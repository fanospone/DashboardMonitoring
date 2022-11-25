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
    public partial class UserCreate : System.Web.UI.Page
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
                GetOffice();
                if (Id != null)
                {
                    GetUser(Id);
                }
            }

            //ddlAccess.Items.Add(new ListItem("a", "a"));
        }

        public void GetOffice()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GET_OFFICE", con))
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
                        member.Add(dtAll.Rows[i]["OFFICE_CODE"].ToString(), dtAll.Rows[i]["OFFICE_NAME"].ToString());
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
        public void GetUser(string id)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USERNAME", Encryption.Encryption.Decrypt(id, Global.salt));
                    //string a;
                    //a = " WHERE A.USERNAME = '" + Encryption.Encryption.Decrypt(id, Global.salt) + "'";

                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count == 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Failed!', 'Data not found.' ,'info','UserSetting.aspx');", true);
                    }
                    else
                    {
                        txtUsername.Text = dtAll.Rows[0]["USERNAME"].ToString();
                        txtUsername.ReadOnly = true;
                        ddlAccess.SelectedValue = dtAll.Rows[0]["ROLE"].ToString();
                        ddlStatus.SelectedValue = dtAll.Rows[0]["IS_ACTIVE"].ToString();
                        ddlGroup.SelectedValue = dtAll.Rows[0]["OFFICE_CODE"].ToString();
                    }
                }
                con.Close();
            }
        }

        public void InsertUser(int flag)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {
                    GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARD_INSERT_USER", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@ACCSESS", ddlAccess.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@ROLE", ddlAccess.SelectedValue);
                        cmd.Parameters.AddWithValue("@OFFICECODE", ddlGroup.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@IS_ACTV", ddlStatus.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@USR", principal.Identity.Name);
                        cmd.Parameters.AddWithValue("@FLAG", flag);
                        con.Open();
                        cmd.ExecuteReader();
                    }
                    con.Close();
                    if (principal.Identity.Name.Equals(txtUsername.Text))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Successful!', 'Data has been saved.' ,'success','Logout.aspx');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Successful!', 'Data has been saved.' ,'success','UserSetting.aspx');", true);
                    }
                }
            }
            catch(Exception err)
            {
                string msg = "Something went wrong, contact your Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + err.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','UserSetting.aspx');", true);
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSetting.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string Id = Request.QueryString["Id"];
            if (Id == null)
            {

                checkUser();
                
                //cek username telah digunakan
                if (dtAll.Rows.Count == 0)
                {
                        checkUser2();
                        //cek apakah ada di ref_user
                        if (dtAll.Rows.Count == 0)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', 'Username "+ txtUsername.Text + " tidak terdapat pada Employee','error','UserCreate.aspx');", true);
                        }
                        else
                        {
                            InsertUser(0);
                        }
                  
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', '"+ dtAll.Rows[0]["MSG"].ToString() + "','error','UserCreate.aspx');", true);
                }
            }
            else
            {
                InsertUser(1);
            }
        }

        public void checkUser()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                        con.Open();
                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());

                    }
                    con.Close();
                }
            }
            catch (Exception err)
            {
                string msg = "Something went wrong, contact your Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + err.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','UserSetting.aspx');", true);
            }
        }

        public void checkUser2()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARD_CheckEmployee", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@USERNAME",txtUsername.Text);
                        con.Open();
                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());

                    }
                    con.Close();
                }
            }
            catch (Exception err)
            {
                string msg = "Something went wrong, contact your Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + err.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','UserSetting.aspx');", true);
            }
        }


    }
}