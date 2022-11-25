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
    public partial class DashboardMonitoringCreditAnalyst : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string RefOfficeId = "";
        int StringLoop, StringSeqNo;
        int loop, seqno, maxnextitem, idnow;
        string type, link;
        string StringRealTime;

        int unclaim;
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



            nextItem(StringLoop, StringSeqNo);

            GetDataUnclaim(idnow);

            getItem(StringLoop, StringSeqNo);



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
                spanAspx.InnerText = "DashboardMonitoringCreditAnalyst";
                seqno = seqno - 1;
            }
            spanQueryString.InnerText = "?realtime=" + StringRealTime + "&loop=" + StringLoop + "&seqno=" + seqno;


        }



        public void GetDataUnclaim(int strArea)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDashboard_unclaimedCA", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Area", strArea);
                    cmd.Parameters.AddWithValue("@TYPE", "LOOP");

                    cmd.CommandTimeout = 0;

                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());


                    //baru
                    if (dtAll.Rows.Count > 0)
                    {
                        sumUNCLAIM.InnerText = (Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int>("UNCLAIMED_NEW"))) ).ToString();
                        unclaim = Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int>("UNCLAIMED_NEW")));

                        gvGrid1.DataSource = dtAll;
                        gvGrid1.DataBind();
                        gvGrid1.HeaderRow.TableSection = TableRowSection.TableHeader;

                    }

                }
                con.Close();
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
                        idnow = Convert.ToInt32(dtAll.Rows[0]["ID_NOW"].ToString());
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
                    cmd.CommandTimeout = 0;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count > 0)
                    {
                        spanArea.InnerText = dtAll.Rows[0]["DBNAME"].ToString();
                        spanUpd.InnerText = "LAST UPDATE " + dtAll.Rows[0]["DTM_UPD"].ToString();

                        sumIn.InnerText = (Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int>("MONTHLY_PROD"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int>("DE_NEW"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int>("REVIEW_NEW"))) + unclaim).ToString();
                        sumProd.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("MONTHLY_PROD")).ToString();

                        sumNewDE.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("DE_NEW")).ToString();
                        sumCLAIMED.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("REVIEW_NEW")).ToString();

                        gvGrid2.DataSource = dtAll;
                        gvGrid2.DataBind();
                        gvGrid2.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
                con.Close();
            }
        }

        public void GetData(int strArea, int strYear, int strMonth, int strDay)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_BMTele", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Tgl", strDay);
                    cmd.Parameters.AddWithValue("@Bln", strMonth);
                    cmd.Parameters.AddWithValue("@Thn", strYear);
                    cmd.Parameters.AddWithValue("@Area", strArea);
                    cmd.Parameters.AddWithValue("@TYPE", "SELECT");


                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());


                    //baru
                    if (dtAll.Rows.Count > 0)
                    {
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