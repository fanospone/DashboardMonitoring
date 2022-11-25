using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class DetailSalesProcess : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string Position = "";
        string link;

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            Position = Array[3];

            if (!IsPostBack)
            {
                GetOffice();
                GetUser();
                GetYear();
                GetMonth();
                
            }


        }


       

        public void GetOffice()
        {
            dtAll = new DataTable();
            dtAll = Proses.GetData("spDASHBOARD_GET_OFFICE", "");

            Dictionary<string, string> member = new Dictionary<string, string>();
            int i = 0;
            for (i = 0; i < dtAll.Rows.Count; i++)
            {
                member.Add(dtAll.Rows[i]["REF_OFFICE_ID"].ToString(), dtAll.Rows[i]["OFFICE_NAME"].ToString());
            }

            ddlOffice.DataTextField = "Value";
            ddlOffice.DataValueField = "Key";
            ddlOffice.DataSource = member;
            ddlOffice.DataBind();
            ddlOffice.SelectedIndex = 0;
        }

        public void GetYear()
        {

            dtAll = new DataTable();
            dtAll = Proses.GetData("spDASHBOARD_GetYear", "");

            Dictionary<string, string> member = new Dictionary<string, string>();
            int i = 0;
            for (i = 0; i < dtAll.Rows.Count; i++)
            {
                member.Add(dtAll.Rows[i]["Year"].ToString(), dtAll.Rows[i]["Year"].ToString());
            }

            ddlYear.DataTextField = "Value";
            ddlYear.DataValueField = "Key";
            ddlYear.DataSource = member;
            ddlYear.DataBind();
            ddlYear.SelectedIndex = 0;

            
        }

        public void GetMonth()
        {
            dtAll = new DataTable();
            dtAll = Proses.GetData("spDASHBOARD_GetMonth", "");


            Dictionary<string, string> member = new Dictionary<string, string>();
            int i = 0;
            for (i = 0; i < dtAll.Rows.Count; i++)
            {
                member.Add(dtAll.Rows[i]["number"].ToString(), dtAll.Rows[i]["monthname"].ToString());
            }

            ddlMonth.DataTextField = "Value";
            ddlMonth.DataValueField = "Key";
            ddlMonth.DataSource = member;
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 0;
            
        }

        public void GetUser()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USERNAME", Username);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count == 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Failed!', 'Data not found.' ,'info','ReportDashboard.aspx');", true);
                    }
                    else
                    {
                        ddlOffice.SelectedValue = dtAll.Rows[0]["OFFICE_CODE"].ToString();
                    }
                }
                con.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int ParamOffice = Convert.ToInt32(ddlOffice.SelectedValue);
            int ParamYear = Convert.ToInt32(ddlYear.SelectedValue); 
            int ParamMonth = Convert.ToInt32(ddlMonth.SelectedValue); 

            Response.Redirect("DashboardSalesProcess_View.aspx?o=" + ParamOffice + "&y=" + ParamYear + "&m=" + ParamMonth + "");
        }
    }
}