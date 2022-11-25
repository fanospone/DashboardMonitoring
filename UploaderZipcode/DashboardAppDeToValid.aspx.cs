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
    public partial class DashboardAppDeToValid : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string RefOfficeId = "";
        int StringLoop, StringSeqNo;
        int loop, seqno, maxnextitem;
        string type, link;
        string StringRealTime;

        protected void Page_Load(object sender, EventArgs e)
        {

            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            RefOfficeId = Array[3];

            StringRealTime = Request.QueryString["realtime"];

            if (StringRealTime != null)
            {
                StringLoop = Convert.ToInt32(Request.QueryString["loop"]);
                StringSeqNo = Convert.ToInt32(Request.QueryString["seqno"]);
            }

            if (StringLoop == 7)
            {
                //jika tipe 7, seq no ganti ref office akun cabang
                StringSeqNo = Convert.ToInt32(RefOfficeId);
                getItem(StringLoop, StringSeqNo);

                spanAspx.InnerText = "DashboardSalesProcess";
                spanQueryString.InnerText = "?realtime=" + "1" + "&loop=" + "7" + "&seqno=" + StringSeqNo;
            }
            else
            {
                getItem(StringLoop, StringSeqNo);
                nextItem(StringLoop, StringSeqNo);

                if (type == "BmTele")
                {
                    link = "DashboardBMTele";
                }
                else if (type == "CA")
                {
                    link = "DashboardMonitoringCreditAnalyst";
                }
                else if (type == "Incity")
                {
                    link = "DashboardFieldSurveyInCity";
                }
                else if (type == "Outcity")
                {
                    link = "DashboardFieldSurveyOutCity";
                }

                else if (type == "DeToValid")
                {
                    link = "DashboardAppDeToValid";
                }

                if (StringLoop == 2 || StringLoop == 3 || StringLoop == 4)
                {

                }
                else if (maxnextitem > 1)
                {
                    link = link + "4";
                }
                
                spanAspx.InnerText = link;
                
                if (StringRealTime == "0")
                {
                    spanAspx.InnerText = "DashboardBMTele";
                    seqno = seqno - 1;
                }
                spanQueryString.InnerText = "?realtime=" + StringRealTime + "&loop=" + StringLoop + "&seqno=" + seqno;

            }



        }



        public void nextItem(int StringLoop, int StringSeqNo)
        {

            GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDashboard_Loop" + StringLoop + "_NextItem", con))
                {

                    DataTable dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SeqNo", StringSeqNo);
                    
                    cmd.CommandTimeout = 0;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count > 0)
                    {

                        type = dtAll.Rows[0]["TYPE"].ToString();
                        seqno = Convert.ToInt32(dtAll.Rows[0]["NEXT_SEQ_NO"].ToString());
                        maxnextitem = Convert.ToInt32(dtAll.Rows[0]["MAX_NEXT_ITEM"].ToString());
                        loop = StringLoop;

                    }
                }
                con.Close();
            }
        }


        public void getItem(int StringLoop, int StringSeqNo)
        {

            GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDashboard_Loop" + StringLoop + "_GetItem", con))
                {

                    DataTable dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SeqNo", StringSeqNo);
                    if (StringLoop == 7)
                    {
                        cmd.Parameters.AddWithValue("@DB", "DEVALID");
                    }

                    cmd.CommandTimeout = 0;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count > 0)
                    {

                        spanArea.InnerText = dtAll.Rows[0]["DBNAME"].ToString();
                        spanUpd.InnerText = "LAST UPDATE "+dtAll.Rows[0]["DTM_UPD"].ToString();

                        spanAppIn.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("APP_IN")).ToString();
                        spanAppValid.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("APP_VALID")).ToString();
                        spanAppOnPc.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("APP_ONPC")).ToString();
                        spanRtHandling.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("RETURN_HANDLING")).ToString();

                        spanSrvyPc.InnerText =  (dtAll.AsEnumerable().Sum(x => x.Field<int>("ASSIGN_SURVEY")) + dtAll.AsEnumerable().Sum(x => x.Field<int>("RESULT_SURVEY"))).ToString();
                        spanCA.InnerText = (dtAll.AsEnumerable().Sum(x => x.Field<int>("CA_APV")) + dtAll.AsEnumerable().Sum(x => x.Field<int>("CA_RJC"))).ToString();
                        spanOverride.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("OVERRIDE_BUCKET")).ToString();
                        spanDev.InnerText = (dtAll.AsEnumerable().Sum(x => x.Field<int>("DEV_CHA")) + dtAll.AsEnumerable().Sum(x => x.Field<int>("DEV_CDH"))).ToString();
                        spanRate.InnerText = (dtAll.AsEnumerable().Sum(x => x.Field<int>("RATE_BH")) + dtAll.AsEnumerable().Sum(x => x.Field<int>("RATE_SAH")) + dtAll.AsEnumerable().Sum(x => x.Field<int>("RATE_SDH"))).ToString();








                        gvGrid2.DataSource = dtAll;
                        gvGrid2.DataBind();
                        gvGrid2.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
                con.Close();
            }
        }
        

    }
}