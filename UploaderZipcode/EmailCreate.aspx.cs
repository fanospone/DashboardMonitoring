using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft;

namespace UploaderZipcode
{
    public partial class EmailCreate : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];

            string Id = Request.QueryString["Id"];
            if (!IsPostBack)
            {
                GetDashboardType();
                if (Id != null)
                {
                    GetEmail(Id);
                }
            }

        }

        public void GetDashboardType()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetEmailMaster", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                    Dictionary<string, string> member = new Dictionary<string, string>();
                    int i = 0;
                    for (i = 0; i < dtAll.Rows.Count; i++)
                    {
                        member.Add(dtAll.Rows[i]["EMAIL_MASTER_ID"].ToString(), dtAll.Rows[i]["EMAIL_MASTER_NAME"].ToString());
                    }

                    ddlGroup.DataTextField = "Value";
                    ddlGroup.DataValueField = "Key";
                    ddlGroup.DataSource = member;
                    ddlGroup.DataBind();
                    ddlGroup.SelectedIndex = 0;
                }
                con.Close();
            }
        }

        public void GetEmail(string id)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetEmail", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EMAILSETTING", id);


                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count == 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Failed!', 'Data not found.' ,'info','EmailSetting.aspx');", true);
                    }
                    else
                    {
                        txtEmailRecipient.Text = dtAll.Rows[0]["EMAIL_RECIPIENT"].ToString();
                        //txtEmailRecipient.ReadOnly = true;
                        txtEmailPIC.Text = dtAll.Rows[0]["EMAIL_PIC"].ToString();
                        //txtEmailPIC.ReadOnly = true;


                        ddlGroup.SelectedValue = dtAll.Rows[0]["EMAIL_MASTER_ID"].ToString();
                        ddlStatus.SelectedValue = dtAll.Rows[0]["IS_ACTIVE"].ToString();
                    }
                }
                con.Close();
            }
        }






        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmailSetting.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string Id = Request.QueryString["Id"];
            if (Id == null)
            {
                InsertSetting(0, "0");
            }
            else
            {
                InsertSetting(1, Id);
            }
        }


        public void InsertSetting(int flag, string Id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {
                    GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARD_EmailInsert", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EMAILID", Id);
                        cmd.Parameters.AddWithValue("@MASTERID", ddlGroup.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@EMAILREC", txtEmailRecipient.Text);
                        cmd.Parameters.AddWithValue("@EMAILPIC", txtEmailPIC.Text);
                        cmd.Parameters.AddWithValue("@IS_ACTV", ddlStatus.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@USR", principal.Identity.Name);
                        cmd.Parameters.AddWithValue("@FLAG", flag);
                        con.Open();
                        cmd.ExecuteReader();
                    }
                    con.Close();
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Successful!', 'Data has been saved.' ,'success','EmailSetting.aspx');", true);

                }
            }
            catch (Exception err)
            {
                string msg = "Something went wrong, contact your Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + err.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','EmailSetting.aspx');", true);
            }
        }






    }
}