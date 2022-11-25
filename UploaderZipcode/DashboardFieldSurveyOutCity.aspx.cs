using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class DashboardFieldSurveyOutCity : System.Web.UI.Page
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
            string DtMonthYear;

            DtMonthYear = DateTime.Now.ToString("MMM") + "-" + DateTime.Now.Year.ToString();

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

            if (StringLoop == 2 || StringLoop == 3 || StringLoop == 4)
            {

            }
            else if (maxnextitem > 1)
            {
                link = link + "4";
            }

            spanAspx.InnerText = link;
            spanQueryString.InnerText = "?realtime=" + "1" + "&loop=" + StringLoop + "&seqno=" + seqno;


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
                    cmd.CommandTimeout = 0;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count > 0)
                    {
                        spanArea.InnerText = dtAll.Rows[0]["DBNAME"].ToString();
                        spanUpd.InnerText = "LAST UPDATE " + dtAll.Rows[0]["DTM_UPD"].ToString();

                        DateTime DTM_UPD = Convert.ToDateTime(dtAll.Rows[0]["DTM_UPD"]);
                        //spanDt.InnerText = DTM_UPD.ToString("MMM") + "-" + DTM_UPD.Year.ToString();

                        SumInOutcty.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int?>("TITIK_IN")).ToString();
                        //SumProdField.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("DAY_1")).ToString();

                        SumProdField.InnerText = (
                            Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_1"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_2"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_3"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_4"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_5")))
                         + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_6"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_7"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_8"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_9"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_10")))
                         + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_11"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_12"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_13"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_14"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_15")))
                         + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_16"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_17"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_18"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_19"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_20")))
                         + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_21"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_22"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_23"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_24"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_25")))
                         + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_26"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_27"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_28"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_29"))) + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_30")))
                         + Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAY_31")))
                            ).ToString();

                        SumNotField.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int?>("NOT_FIELD_SURVEY")).ToString();
                        SumNotSameDay.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int?>("NOT_SAME_DAY")).ToString();

                        gvGrid2.DataSource = dtAll;
                        gvGrid2.DataBind();
                        gvGrid2.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
                con.Close();
            }
        }




        public void GetData(int strOffice, int strYear, int strMonth)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_FieldOutCity", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AREA", strOffice);
                    cmd.Parameters.AddWithValue("@MONTH", strMonth);
                    cmd.Parameters.AddWithValue("@YEAR", strYear);
                    cmd.CommandTimeout = 0;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());


                    gvGrid2.DataSource = dtAll;
                    gvGrid2.DataBind();
                    gvGrid2.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                con.Close();
            }
        }


    }
}