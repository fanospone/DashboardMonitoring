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
    public partial class ReportDashboard : System.Web.UI.Page
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

            link = dllDashboard.SelectedValue;
            if (!IsPostBack)
            {
                dt1.Value = DateTime.Now.ToString("yyyy/MM/dd");
                GetOffice();
                GetUser();

                if (BranchCode == "0000")
                {
                    dllDashboard.Items.Add(new ListItem("FIELD SURVEY INCITY", "DashboardFieldSurveyInCity"));
                    dllDashboard.Items.Add(new ListItem("FIELD SURVEY OUTCITY", "DashboardFieldSurveyOutCity"));
                    dllDashboard.Items.Add(new ListItem("APP BM and TELE SURVEY", "DashboardAppBmAndTeleSvy"));
                    dllDashboard.Items.Add(new ListItem("CREDIT ANALYST", "DashboardMonitoringCreditAnalyst"));
                    
                }
                else
                {
                    ddlGroup.Attributes.Add("disabled", "disabled");
                }



            }

            getDdlStat(link);

           


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
                        ddlGroup.SelectedValue = dtAll.Rows[0]["OFFICE_CODE"].ToString();
                    }
                }
                con.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var link = dllDashboard.SelectedValue;
            Response.Redirect(link + ".aspx");
        }

        protected void dllDashboard_SelectedIndexChanged(object sender, EventArgs e)
        {

            //getDdlStat(link);

        }

        public void getDdlStat(string link)
        {
            if (link == "DashboardSalesProcess")
            {
                dtPicker.Attributes.Add("style", "display:none");
            }
            else
            {
                dtPicker.Attributes.Add("style", "display:block");
            }
        }





    }
}