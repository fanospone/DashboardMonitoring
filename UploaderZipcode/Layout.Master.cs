using DocumentFormat.OpenXml.Bibliography;
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

namespace UploaderZipcode
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        public string Year { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Year = DateTime.Today.Year.ToString();
        }
        public string Userid
        {
            get
            {
                GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
                return principal.Identity.Name;
            }
        }
        public string Position
        {
            set;
            get;

        }

        public string Office
        {
            set;
            get;

        }

        public string Name
        {
            get
            {
                string name = "";
                GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                    {
                        DataTable dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@USERNAME", principal.Identity.Name);
                        con.Open();
                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());
                        if (dtAll.Rows.Count > 0)
                        {
                            name = dtAll.Rows[0]["NAME"].ToString();
                            Position = dtAll.Rows[0]["ROLE"].ToString();
                            Office = dtAll.Rows[0]["OFFICE_NAME"].ToString();
                        }
                    }
                    con.Close();
                }
                return name;
            }
        }

        public string Roles
        {
            get
            {
                string role = "";
                GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                    {
                        //DataTable dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@USERNAME", principal.Identity.Name);
                        con.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                role = dr["ROLES"].ToString();
                            }
                        }
                    }
                    con.Close();
                }
                return role;
            }
        }

        public string Menus
        {
            get
            {
                GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
                string menu = "";
                string namepage = Request.Url.Segments[Request.Url.Segments.Count() - 1];
                namepage = namepage.ToLower();
                string temp = "-1";
                int temp2 = -1;



                if (namepage.Equals("reportdashboard.aspx") || namepage.Equals("dashboardsalesprocess.aspx") || namepage.Equals("dashboardfieldsurveyincity.aspx") || namepage.Equals("dashboardfieldsurveyoutcity.aspx") || namepage.Equals("dashboardappdetovalid.aspx") || namepage.Equals("dashboardappbmandtelesvy.aspx") || namepage.Equals("dashboardmonitoringcreditanalyst.aspx"))
                {
                    temp2 = 0;
                }

                //menu += "<li class=\"active\">";
                //menu += "<a href =\"emailsetting.aspx\">" +
                //            "<i class=\"material-icons\" style=\"color:#747474\">dashboard</i>" +
                //            "<span style=\"color:#333\">Email Setting</span>" +
                //        "</a></li>";
                menu += "<li class=\"active\">";
                menu += "<a href =\"DashboardHome.aspx\">" +
                            "<i class=\"material-icons\" style=\"color:#747474\">home</i>" +
                            "<span style=\"color:#333\">Home</span>" +
                        "</a></li>";

                if (Position == "ADMIN" || Position == "ADMIN_AR")
                {

                    menu += "<li class=\"active\">";
                    menu += "<a href =\"usersetting.aspx\">" +
                                "<i class=\"material-icons\" style=\"color:#747474\">person</i>" +
                                "<span style=\"color:#333\">User Setting</span>" +
                            "</a></li>";
                }


                if (Position == "ADMIN")
                {

                    menu += "<li class=\"active\">";
                    menu += "<a href =\"emailsetting.aspx\">" +
                                "<i class=\"material-icons\" style=\"color:#747474\">dashboard</i>" +
                                "<span style=\"color:#333\">Email Setting</span>" +
                            "</a></li>";
                }

                if (Position == "ADMIN" || Position == "BM" || Position == "ADMIN_AR")
                {
                    menu += temp == "2" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href =\"javascript: void(0);\" class=\"menu-toggle\">" +
                            "<i class=\"material-icons\" style=\"color:#747474\">cloud_upload</i>" +
                            "<span style=\"color:#333\">Upload Target</span>" +
                            "</a>";

                    menu += temp == "2" ? "<ul class=\"ml-menu\" style=\"display: block;\">" : "<ul class=\"ml-menu\">";

                    if (Position == "ADMIN" || Position == "VM")
                    {
                        menu += namepage == "UploadTarget.aspx" ? "<li class=\"active\">" : "<li>";
                        menu += "<a href = \"UploadTarget.aspx\">Target Sales</a>" +
                                 "</li>";
                    }

                    if (Position == "ADMIN_AR")
                    {
                        menu += namepage == "UploadTargetBalanceAR.aspx" ? "<li class=\"active\">" : "<li>";
                        menu += "<a href = \"UploadTargetBalanceAR.aspx\">Target Balance AR</a>" +
                                 "</li>";
                        menu += namepage == "UploadTargetRepoAR.aspx" ? "<li class=\"active\">" : "<li>";
                        menu += "<a href = \"UploadTargetRepoAR.aspx\">Target Repo</a>" +
                                 "</li>";
                        menu += namepage == "UploadListAreaAR.aspx" ? "<li class=\"active\">" : "<li>";
                        menu += "<a href = \"UploadListAreaAR.aspx\">List Area AR</a>" +
                                 "</li>";
                    }

                    menu += "</ul></li>";
                }

                //menu += temp == "1" ? "<li class=\"active\">" : "<li>";
                //menu += "<a href = \"javascript:void(0);\" class=\"menu-toggle\">" +
                //            "<i class=\"material-icons\">dashboard</i>" +
                //            "<span>Dashboard</span>" +
                //        "</a>";
                //menu += temp == "1" ? "<ul class=\"ml-menu\" style=\"display: block;\">" : "<ul class=\"ml-menu\">";


                //menu += namepage == "DashboardSalesProcess.aspx" ? "<li class=\"active\">" : "<li>";
                //menu += "<a href = \"DashboardSalesProcess.aspx\">Sales Process</a>" +
                //         "</li>";
                //menu += namepage == "DashboardFieldSurveyInCity.aspx" ? "<li class=\"active\">" : "<li>";
                //menu += "<a href = \"DashboardFieldSurveyInCity.aspx\">Field Survey In</a>" +
                //         "</li>";
                //menu += namepage == "DashboardFieldSurveyOutCity.aspx" ? "<li class=\"active\">" : "<li>";
                //menu += "<a href = \"DashboardFieldSurveyOutCity.aspx\">Field Survey Out</a>" +
                //         "</li>";
                //menu += namepage == "DashboardAppDeToValid.aspx" ? "<li class=\"active\">" : "<li>";
                //menu += "<a href = \"DashboardAppDeToValid.aspx\">App DE To Valid</a>" +
                //         "</li>";
                //menu += namepage == "DashboardAppBmAndTeleSvy.aspx" ? "<li class=\"active\">" : "<li>";
                //menu += "<a href = \"DashboardAppBmAndTeleSvy.aspx\">App Bm And Tele Svy</a>" +
                //          "</li>";
                //menu += namepage == "DashboardMonitoringCreditAnalyst.aspx" ? "<li class=\"active\">" : "<li>";
                //menu += "<a href = \"DashboardMonitoringCreditAnalyst.aspx\">Monitoring Credit Analyst</a>" +
                //          "</li>";

                //menu += "</ul></li>";



                if (Position != "" || Position != null)
                {

                    menu += temp == "1" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"javascript:void(0);\" class=\"menu-toggle\">" +
                                "<i class=\"material-icons\">dashboard</i>" +
                                "<span> Dashboard</span></a>";

                    menu += temp == "1" ? "<ul class=\"ml-menu\" style=\"display: block;\">" : "<ul class=\"ml-menu\">";


                    menu += namepage == "DetailSalesProcess.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DetailSalesProcess.aspx\">Detail Sales Process</a>" +
                             "</li>";

                    menu += namepage == "DetailAppDeToValid.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DetailAppDeToValid.aspx\">Detail AppDeToValid</a>" +
                             "</li>";
                    menu += namepage == "DetailFieldSurveyInCity.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DetailFieldSurveyInCity.aspx\">Detail FieldSurvey InCity</a>" +
                             "</li>";
                    menu += namepage == "DetailFieldSurveyOutCity.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DetailFieldSurveyOutCity.aspx\">Detail FieldSurvey OutCity</a>" +
                             "</li>";

                    menu += namepage == "DetailAppBmAndTeleSvy.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DetailAppBmAndTeleSvy.aspx\">Detail AppBmAndTeleSvy</a>" +
                             "</li>";

                    menu += namepage == "DetailMonitoringCreditAnalyst.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DetailMonitoringCreditAnalyst.aspx\">Detail CA</a>" +
                             "</li>";

                    menu += namepage == "DashboardToyotaGMF.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DashboardToyotaGMF.aspx\">Dashboard Top Rank Toyota</a>" +
                             "</li>";

                    menu += namepage == "DashboardDaihatsuGMF.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DashboardDaihatsuGMF.aspx\">Dashboard Top Rank Daihatsu</a>" +
                             "</li>";

                    menu += namepage == "Dashboard_AR.aspx" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"Dashboard_AR.aspx\">Dashboard AR</a>" +
                             "</li>";


                    menu += namepage == "DashboardCDE.aspx?type=" + "HO" + "&time=" + "MTD" ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DashboardCDE.aspx?type=" + "HO" + "&time=" + "MTD\" > Dashboard CDE</a>" +
                             "</li>";


                    menu += namepage == "DashboardCA.aspx " ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DashboardCA.aspx\" > Dashboard CA</a>" +
                             "</li>";

                    menu += namepage == "DashboardTeleSurvey.aspx " ? "<li class=\"active\">" : "<li>";
                    menu += "<a href = \"DashboardTeleSurvey.aspx\" > Dashboard Tele Survey</a>" +
                             "</li>";
                }

                menu += "</ul></li>";

                menu += "<li class=\"active\">";
                menu += "<a href =\"Logout.aspx\">" +
                            "<i class=\"material-icons\" style=\"color:#747474\">input</i>" +
                            "<span style=\"color:#333\">Logout</span>" +
                        "</a></li>";


                return menu;
            }
        }
    }
}