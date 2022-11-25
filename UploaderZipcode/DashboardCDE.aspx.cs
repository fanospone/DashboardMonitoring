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
    public partial class DashboardCDE : System.Web.UI.Page
    {
        string DashboardType, DashboardTime;

        protected void Page_Load(object sender, EventArgs e)
        {

            DashboardType = Request.QueryString["type"];

            if (DashboardType != null)
            {
                DashboardTime = Request.QueryString["time"];
            }


            getItem(DashboardType, DashboardTime);



            if (!IsPostBack)
            {
                GetCategory(DashboardType);
                ddlCategory.SelectedValue = DashboardType;
                dllTgl.SelectedValue = DashboardTime;
            }




        }

        public void GetCategory(string DashboardType)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_CDE_MASTERAREA", con))
                {
                    DataTable dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                    Dictionary<string, string> member = new Dictionary<string, string>();
                    //member.Add("All", "All");
                    int i = 0;
                    for (i = 0; i < dtAll.Rows.Count; i++)
                    {
                        member.Add(dtAll.Rows[i]["AREA_CODE"].ToString(), dtAll.Rows[i]["AREA_NAME"].ToString());
                    }

                    ddlCategory.DataTextField = "Value";
                    ddlCategory.DataValueField = "Key";
                    ddlCategory.DataSource = member;
                    ddlCategory.DataBind();


                }
                con.Close();
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string type = ddlCategory.SelectedItem.Value;
            string time = dllTgl.SelectedItem.Value;

            Response.Redirect("DashboardCDE.aspx?type=" + type + "&time=" + time);
        }

        protected void dllTgl_SelectedIndexChanged(object sender, EventArgs e)
        {
            string type = ddlCategory.SelectedItem.Value;
            string time = dllTgl.SelectedItem.Value;

            Response.Redirect("DashboardCDE.aspx?type=" + type + "&time=" + time);

        }

        public void getItem(string DashboardType, string DashboardTime)
        {
            DataTable dtProspect = Proses.GetDataCDE("spDASHBOARD_CDE_PROSPECT", DashboardType, DashboardTime);
            DataTable dtMatching = Proses.GetDataCDE("spDASHBOARD_CDE_MATCHING", DashboardType, DashboardTime);
            DataTable dtCountLogin = Proses.GetDataCDE("spDASHBOARD_CDE_COUNT_LOGIN", DashboardType, DashboardTime);
            DataTable dtCompletion = Proses.GetDataCDE("spDASHBOARD_CDE_COMPLETION", DashboardType, DashboardTime);
            DataTable dtAchLM = Proses.GetDataCDE("spDASHBOARD_CDE_ACH_LAST_MONTH", DashboardType, DashboardTime);
            DataTable dtNAP = Proses.GetDataCDE("spDASHBOARD_CDE_NAP", DashboardType, DashboardTime);
            DataTable dtMatchingPerf = Proses.GetDataCDE("spDASHBOARD_CDE_MATCHING_PERFORM", DashboardType, DashboardTime);
            DataTable dtCompletionPerf = Proses.GetDataCDE("spDASHBOARD_CDE_COMPLETION_PERFORM", DashboardType, DashboardTime);
            DataTable dtNAPPerf = Proses.GetDataCDE("spDASHBOARD_CDE_NAP_PERFORM", DashboardType, DashboardTime);
            /*
            if (dtMatching.Rows.Count > 0)
            {
                matchingSubCDE.Text = dtMatching.Rows[0][""].ToString();
                matchingSubSO.Text = dtMatching.Rows[0][""].ToString();
            }
            */

            if (dtProspect.Rows.Count > 0)
            {
                prospectSubmit.Text = dtProspect.Rows[0]["SUBMIT"].ToString();
                prospectWFD.Text = dtProspect.Rows[0]["WFD"].ToString();
                prospectSIM.Text = dtProspect.Rows[0]["SIM"].ToString();
            }

            if (dtMatching.Rows.Count > 0)
            {
                matchingSubCDE.Text = dtMatching.Rows[0]["SUBMIT-CDE"].ToString();
                matchingSubSO.Text = dtMatching.Rows[0]["SUBMIT-SO"].ToString();
                matchingPenCDE.Text = dtMatching.Rows[0]["PENDING-CDE"].ToString();
                matchingNotClaim.Text = dtMatching.Rows[0]["NOT CLAIM"].ToString();
                matchingPenSO.Text = dtMatching.Rows[0]["PENDING-SO"].ToString();


                txtTgl.Text = "Last Status : " + dtMatching.Rows[0]["DTM_UPD"].ToString();
            }

            if (dtCountLogin.Rows.Count > 0)
            {
                loginCDE.Text = dtCountLogin.Rows[0]["CDE"].ToString();
                loginSO.Text = dtCountLogin.Rows[0]["SO"].ToString();
            }

            if (dtCompletion.Rows.Count > 0)
            {
                complSubCDE.Text = dtCompletion.Rows[0]["SUBMIT-CDE"].ToString();
                complSubSO.Text = dtCompletion.Rows[0]["SUBMIT-SO"].ToString();
                complPenCDE.Text = dtCompletion.Rows[0]["PENDING-CDE"].ToString();
                complNotClaim.Text = dtCompletion.Rows[0]["NOT CLAIM"].ToString();
                complPenSO.Text = dtCompletion.Rows[0]["PENDING-SO"].ToString();
            }

            if (dtAchLM.Rows.Count > 0)
            {
                achCDE15.Text = dtAchLM.Rows[0]["CDE MATCHING <15(%)"].ToString();
                achCDE90.Text = dtAchLM.Rows[0]["CDE COMPLETION <90(%)"].ToString();
                achNAP90.Text = dtAchLM.Rows[0]["NAP DATA ENTRY <90(%)"].ToString();

                //txtTgl.Text = "Last Status : " + dtAchLM.Rows[0]["DTM_CRT"].ToString();
            }

            if (dtNAP.Rows.Count > 0)
            {
                napSubmit.Text = dtNAP.Rows[0]["SUBMIT"].ToString();
                napPending.Text = dtNAP.Rows[0]["PENDING"].ToString();
                napNotClaim.Text = dtNAP.Rows[0]["NOT CLAIM"].ToString();
            }

            if (dtMatchingPerf.Rows.Count > 0)
            {
                mpCde15.Text = dtMatchingPerf.Rows[0]["<15(%)"].ToString() + "%";
                mpCde30.Text = dtMatchingPerf.Rows[0]["<30(%)"].ToString() + "%";
                mpCde60.Text = dtMatchingPerf.Rows[0]["<60(%)"].ToString() + "%";
                mpCde90.Text = dtMatchingPerf.Rows[0]["<90(%)"].ToString() + "%";
                //mpCde120.Text = dtMatchingPerf.Rows[0]["<120(%)"].ToString() + "%";
                //mpCde150.Text = dtMatchingPerf.Rows[0]["<150(%)"].ToString() + "%";
                //mpCde180.Text = dtMatchingPerf.Rows[0]["<180(%)"].ToString() + "%";

                mpCde120.Text = "-";
                mpCde150.Text = "-";
                mpCde180.Text = "-";

                mpCdeTotal.Text = dtMatchingPerf.Rows[0]["TOTAL"].ToString();

                mpSo15.Text = dtMatchingPerf.Rows[1]["<15(%)"].ToString() + "%";
                mpSo30.Text = dtMatchingPerf.Rows[1]["<30(%)"].ToString() + "%";
                mpSo60.Text = dtMatchingPerf.Rows[1]["<60(%)"].ToString() + "%";
                mpSo90.Text = dtMatchingPerf.Rows[1]["<90(%)"].ToString() + "%";
                //mpSo120.Text = dtMatchingPerf.Rows[1]["<120(%)"].ToString() + "%";
                //mpSo150.Text = dtMatchingPerf.Rows[1]["<150(%)"].ToString() + "%";
                //mpSo180.Text = dtMatchingPerf.Rows[1]["<180(%)"].ToString() + "%";


                mpSo120.Text = "-";
                mpSo150.Text = "-";
                mpSo180.Text = "-";

                mpSoTotal.Text = dtMatchingPerf.Rows[1]["TOTAL"].ToString();

                dtMatchingPerfBack();
            }

            if (dtCompletionPerf.Rows.Count > 0)
            {
                cpCde30.Text = dtCompletionPerf.Rows[0]["<30(%)"].ToString() + "%";
                cpCde60.Text = dtCompletionPerf.Rows[0]["<60(%)"].ToString() + "%";
                cpCde90.Text = dtCompletionPerf.Rows[0]["<90(%)"].ToString() + "%";
                cpCde120.Text = dtCompletionPerf.Rows[0]["<120(%)"].ToString() + "%";
                cpCde150.Text = dtCompletionPerf.Rows[0]["<150(%)"].ToString() + "%";
                cpCde180.Text = dtCompletionPerf.Rows[0]["<180(%)"].ToString() + "%";
                cpCde240.Text = dtCompletionPerf.Rows[0]["<240(%)"].ToString() + "%";

                cpCdeTotal.Text = dtCompletionPerf.Rows[0]["TOTAL"].ToString();

                cpSo30.Text = dtCompletionPerf.Rows[1]["<30(%)"].ToString() + "%";
                cpSo60.Text = dtCompletionPerf.Rows[1]["<60(%)"].ToString() + "%";
                cpSo90.Text = dtCompletionPerf.Rows[1]["<90(%)"].ToString() + "%";
                cpSo120.Text = dtCompletionPerf.Rows[1]["<120(%)"].ToString() + "%";
                cpSo150.Text = dtCompletionPerf.Rows[1]["<150(%)"].ToString() + "%";
                cpSo180.Text = dtCompletionPerf.Rows[1]["<180(%)"].ToString() + "%";
                cpSo240.Text = dtCompletionPerf.Rows[1]["<240(%)"].ToString() + "%";

                cpSoTotal.Text = dtCompletionPerf.Rows[1]["TOTAL"].ToString();

                dtCompletionPerfBack();
            }

            if (dtNAPPerf.Rows.Count > 0)
            {

                napSo30.Text = dtNAPPerf.Rows[0]["<30(%)"].ToString() + "%";
                napSo60.Text = dtNAPPerf.Rows[0]["<60(%)"].ToString() + "%";
                napSo90.Text = dtNAPPerf.Rows[0]["<90(%)"].ToString() + "%";
                napSo120.Text = dtNAPPerf.Rows[0]["<120(%)"].ToString() + "%";
                napSo150.Text = dtNAPPerf.Rows[0]["<150(%)"].ToString() + "%";
                napSo180.Text = dtNAPPerf.Rows[0]["<180(%)"].ToString() + "%";
                napSo240.Text = dtNAPPerf.Rows[0]["<240(%)"].ToString() + "%";

                napSoTotal.Text = dtNAPPerf.Rows[0]["TOTAL"].ToString();

                dtNAPPerfBack();
            }

        }


        public void dtMatchingPerfBack()
        {
            if (Convert.ToInt32(mpCde15.Text.Replace("%", "")) < 50)
            {
                mpCde15Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(mpCde15.Text.Replace("%", "")) < 80)
            {
                mpCde15Back.Style.Add("background-color", "yellow");
            }
            else
            {
                mpCde15Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(mpCde30.Text.Replace("%", "")) < 50)
            {
                mpCde30Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(mpCde30.Text.Replace("%", "")) < 80)
            {
                mpCde30Back.Style.Add("background-color", "yellow");
            }
            else
            {
                mpCde30Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(mpCde60.Text.Replace("%", "")) < 50)
            {
                mpCde60Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(mpCde60.Text.Replace("%", "")) < 80)
            {
                mpCde60Back.Style.Add("background-color", "yellow");
            }
            else
            {
                mpCde60Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(mpCde90.Text.Replace("%", "")) < 50)
            {
                mpCde90Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(mpCde90.Text.Replace("%", "")) < 80)
            {
                mpCde90Back.Style.Add("background-color", "yellow");
            }
            else
            {
                mpCde90Back.Style.Add("background-color", "green");
            }

            //if (Convert.ToInt32(mpCde120.Text.Replace("%", "")) < 50)
            //{
            //    mpCde120Back.Style.Add("background-color", "lightcoral");
            //}
            //else if (Convert.ToInt32(mpCde120.Text.Replace("%", "")) < 80)
            //{
            //    mpCde120Back.Style.Add("background-color", "yellow");
            //}
            //else
            //{
            //    mpCde120Back.Style.Add("background-color", "green");
            //}

            //if (Convert.ToInt32(mpCde150.Text.Replace("%", "")) < 50)
            //{
            //    mpCde150Back.Style.Add("background-color", "lightcoral");
            //}
            //else if (Convert.ToInt32(mpCde150.Text.Replace("%", "")) < 80)
            //{
            //    mpCde150Back.Style.Add("background-color", "yellow");
            //}
            //else
            //{
            //    mpCde150Back.Style.Add("background-color", "green");
            //}

            //if (Convert.ToInt32(mpCde180.Text.Replace("%", "")) < 50)
            //{
            //    mpCde180Back.Style.Add("background-color", "lightcoral");
            //}
            //else if (Convert.ToInt32(mpCde180.Text.Replace("%", "")) < 80)
            //{
            //    mpCde180Back.Style.Add("background-color", "yellow");
            //}
            //else
            //{
            //    mpCde180Back.Style.Add("background-color", "green");
            //}




            //SO

            if (Convert.ToInt32(mpSo15.Text.Replace("%", "")) < 50)
            {
                mpSo15Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(mpSo15.Text.Replace("%", "")) < 80)
            {
                mpSo15Back.Style.Add("background-color", "yellow");
            }
            else
            {
                mpSo15Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(mpSo30.Text.Replace("%", "")) < 50)
            {
                mpSo30Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(mpSo30.Text.Replace("%", "")) < 80)
            {
                mpSo30Back.Style.Add("background-color", "yellow");
            }
            else
            {
                mpSo30Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(mpSo60.Text.Replace("%", "")) < 50)
            {
                mpSo60Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(mpSo60.Text.Replace("%", "")) < 80)
            {
                mpSo60Back.Style.Add("background-color", "yellow");
            }
            else
            {
                mpSo60Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(mpSo90.Text.Replace("%", "")) < 50)
            {
                mpSo90Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(mpSo90.Text.Replace("%", "")) < 80)
            {
                mpSo90Back.Style.Add("background-color", "yellow");
            }
            else
            {
                mpSo90Back.Style.Add("background-color", "green");
            }

            //if (Convert.ToInt32(mpSo120.Text.Replace("%", "")) < 50)
            //{
            //    mpSo120Back.Style.Add("background-color", "lightcoral");
            //}
            //else if (Convert.ToInt32(mpSo120.Text.Replace("%", "")) < 80)
            //{
            //    mpSo120Back.Style.Add("background-color", "yellow");
            //}
            //else
            //{
            //    mpSo120Back.Style.Add("background-color", "green");
            //}

            //if (Convert.ToInt32(mpSo150.Text.Replace("%", "")) < 50)
            //{
            //    mpSo150Back.Style.Add("background-color", "lightcoral");
            //}
            //else if (Convert.ToInt32(mpSo150.Text.Replace("%", "")) < 80)
            //{
            //    mpSo150Back.Style.Add("background-color", "yellow");
            //}
            //else
            //{
            //    mpSo150Back.Style.Add("background-color", "green");
            //}

            //if (Convert.ToInt32(mpSo180.Text.Replace("%", "")) < 50)
            //{
            //    mpSo180Back.Style.Add("background-color", "lightcoral");
            //}
            //else if (Convert.ToInt32(mpSo180.Text.Replace("%", "")) < 80)
            //{
            //    mpSo180Back.Style.Add("background-color", "yellow");
            //}
            //else
            //{
            //    mpSo180Back.Style.Add("background-color", "green");
            //}
        }

        public void dtCompletionPerfBack()
        {
            if (Convert.ToInt32(cpCde240.Text.Replace("%", "")) < 50)
            {
                cpCde240Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpCde240.Text.Replace("%", "")) < 80)
            {
                cpCde240Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpCde240Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpCde30.Text.Replace("%", "")) < 50)
            {
                cpCde30Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpCde30.Text.Replace("%", "")) < 80)
            {
                cpCde30Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpCde30Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpCde60.Text.Replace("%", "")) < 50)
            {
                cpCde60Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpCde60.Text.Replace("%", "")) < 80)
            {
                cpCde60Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpCde60Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpCde90.Text.Replace("%", "")) < 50)
            {
                cpCde90Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpCde90.Text.Replace("%", "")) < 80)
            {
                cpCde90Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpCde90Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpCde120.Text.Replace("%", "")) < 50)
            {
                cpCde120Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpCde120.Text.Replace("%", "")) < 80)
            {
                cpCde120Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpCde120Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpCde150.Text.Replace("%", "")) < 50)
            {
                cpCde150Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpCde150.Text.Replace("%", "")) < 80)
            {
                cpCde150Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpCde150Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpCde180.Text.Replace("%", "")) < 50)
            {
                cpCde180Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpCde180.Text.Replace("%", "")) < 80)
            {
                cpCde180Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpCde180Back.Style.Add("background-color", "green");
            }




            //SO

            if (Convert.ToInt32(cpSo240.Text.Replace("%", "")) < 50)
            {
                cpSo240Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpSo240.Text.Replace("%", "")) < 80)
            {
                cpSo240Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpSo240Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpSo30.Text.Replace("%", "")) < 50)
            {
                cpSo30Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpSo30.Text.Replace("%", "")) < 80)
            {
                cpSo30Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpSo30Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpSo60.Text.Replace("%", "")) < 50)
            {
                cpSo60Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpSo60.Text.Replace("%", "")) < 80)
            {
                cpSo60Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpSo60Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpSo90.Text.Replace("%", "")) < 50)
            {
                cpSo90Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpSo90.Text.Replace("%", "")) < 80)
            {
                cpSo90Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpSo90Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpSo120.Text.Replace("%", "")) < 50)
            {
                cpSo120Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpSo120.Text.Replace("%", "")) < 80)
            {
                cpSo120Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpSo120Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpSo150.Text.Replace("%", "")) < 50)
            {
                cpSo150Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpSo150.Text.Replace("%", "")) < 80)
            {
                cpSo150Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpSo150Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(cpSo180.Text.Replace("%", "")) < 50)
            {
                cpSo180Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(cpSo180.Text.Replace("%", "")) < 80)
            {
                cpSo180Back.Style.Add("background-color", "yellow");
            }
            else
            {
                cpSo180Back.Style.Add("background-color", "green");
            }
        }

        public void dtNAPPerfBack()
        {
            //SO

            if (Convert.ToInt32(napSo240.Text.Replace("%", "")) < 50)
            {
                napSo240Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(napSo240.Text.Replace("%", "")) < 80)
            {
                napSo240Back.Style.Add("background-color", "yellow");
            }
            else
            {
                napSo240Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(napSo30.Text.Replace("%", "")) < 50)
            {
                napSo30Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(napSo30.Text.Replace("%", "")) < 80)
            {
                napSo30Back.Style.Add("background-color", "yellow");
            }
            else
            {
                napSo30Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(napSo60.Text.Replace("%", "")) < 50)
            {
                napSo60Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(napSo60.Text.Replace("%", "")) < 80)
            {
                napSo60Back.Style.Add("background-color", "yellow");
            }
            else
            {
                napSo60Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(napSo90.Text.Replace("%", "")) < 50)
            {
                napSo90Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(napSo90.Text.Replace("%", "")) < 80)
            {
                napSo90Back.Style.Add("background-color", "yellow");
            }
            else
            {
                napSo90Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(napSo120.Text.Replace("%", "")) < 50)
            {
                napSo120Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(napSo120.Text.Replace("%", "")) < 80)
            {
                napSo120Back.Style.Add("background-color", "yellow");
            }
            else
            {
                napSo120Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(napSo150.Text.Replace("%", "")) < 50)
            {
                napSo150Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(napSo150.Text.Replace("%", "")) < 80)
            {
                napSo150Back.Style.Add("background-color", "yellow");
            }
            else
            {
                napSo150Back.Style.Add("background-color", "green");
            }

            if (Convert.ToInt32(napSo180.Text.Replace("%", "")) < 50)
            {
                napSo180Back.Style.Add("background-color", "lightcoral");
            }
            else if (Convert.ToInt32(napSo180.Text.Replace("%", "")) < 80)
            {
                napSo180Back.Style.Add("background-color", "yellow");
            }
            else
            {
                napSo180Back.Style.Add("background-color", "green");
            }
        }
    }
}