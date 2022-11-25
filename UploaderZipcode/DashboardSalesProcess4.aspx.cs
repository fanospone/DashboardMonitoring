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
    public partial class DashboardSalesProcess4 : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string Position = "";
        string gy1, gy2, gy3, gy4, gy5;

        int StringLoop, StringSeqNo, StringRow;
        int loop, seqno, maxnextitem;
        string type, link;
        string StringRealTime;

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            Position = Array[3];

            StringRealTime = Request.QueryString["realtime"];



            if (StringRealTime != null)
            {
                StringLoop = Convert.ToInt32(Request.QueryString["loop"]);
                StringSeqNo = Convert.ToInt32(Request.QueryString["seqno"]);
                StringRow = Convert.ToInt32(Request.QueryString["row"]);
            }
            else
            {

            }

            getItem(StringLoop, StringSeqNo);


            nextItem(StringLoop, StringSeqNo);

            if (type == "Sales")
            {
                link = "DashboardSalesProcess";
            }
            else if (type == "DetoValid")
            {
                link = "DashboardAppDeToValid";
            }

            if (maxnextitem > 1)
            {
                link = link + "4";
            }

            spanAspx.InnerText = link;
            spanQueryString.InnerText = "?realtime=" + "1" + "&loop=" + StringLoop + "&seqno=" + seqno ;
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
                        spanUpd.InnerText = "LAST UPDATE - " + dtAll.Rows[0]["DTM_UPD"].ToString();

                        dt1APPinLM.InnerText = dtAll.Rows[0]["APP_IN_LAST_MONTH"].ToString();
                        dt1APPinTM.InnerText = dtAll.Rows[0]["APP_IN_THIS_MONTH"].ToString();
                        dt1Valid.InnerText = dtAll.Rows[0]["APP_VALID_THIS_MONTH"].ToString();
                        dt1BACKLOG.InnerText = dtAll.Rows[0]["BACKLOG"].ToString();

                        dt1REJECTLM.InnerText = dtAll.Rows[0]["APP_REJECT_LAST_MONTH"].ToString();
                        dt1REJECTTM.InnerText = dtAll.Rows[0]["APP_REJECT_THIS_MONTH"].ToString();
                        dt1TARGETvalidTM.InnerText = dtAll.Rows[0]["TARGET_THIS_MONTH"].ToString();
                        dt1TARGETValidLM.InnerText = dtAll.Rows[0]["APP_VALID_LAST_MONTH"].ToString();
                        dt1CANCELLM.InnerText = dtAll.Rows[0]["APP_CANCEL_LAST_MONTH"].ToString();
                        dt1CANCELTM.InnerText = dtAll.Rows[0]["APP_CANCEL_THIS_MONTH"].ToString();

                        
                        gy1 = dtAll.Rows[0]["GROSS_YIELD"].ToString();
                        gy2 = dtAll.Rows[0]["TOYOTA_GY"].ToString();
                        gy3 = dtAll.Rows[0]["DAIHATSU_GY"].ToString();
                        gy4 = dtAll.Rows[0]["SIAPDANA_GY"].ToString();
                        gy5 = dtAll.Rows[0]["OTHER_GY"].ToString();

                        if (gy1 != "")
                        {
                            gy1 = gy1.Substring(0, 5);
                        }

                        if (gy2 != "")
                        {
                            gy2 = gy2.Substring(0, 5);
                        }

                        if (gy3 != "")
                        {
                            gy3 = gy3.Substring(0, 5);
                        }

                        if (gy4 != "")
                        {
                            gy4 = gy4.Substring(0, 5);
                        }

                        if (gy5 != "")
                        {
                            gy5 = gy5.Substring(0, 5);
                        }

                        dt1GY.InnerText = gy1;
                        dt1GYTY.InnerText = gy2;
                        dt1GYDH.InnerText = gy3;
                        dt1GYSD.InnerText = gy4;
                        dt1GYOT.InnerText = gy5;

                        //dt1GY.InnerText = dtAll.Rows[0]["GROSS_YIELD"].ToString().Remove(dtAll.Rows[0]["GROSS_YIELD"].ToString().Length - 4);              
                        //dt1GYTY.InnerText = dtAll.Rows[0]["TOYOTA_GY"].ToString().Remove(dtAll.Rows[0]["TOYOTA_GY"].ToString().Length - 4);
                        //dt1GYDH.InnerText = dtAll.Rows[0]["DAIHATSU_GY"].ToString().Remove(dtAll.Rows[0]["DAIHATSU_GY"].ToString().Length - 4);
                        //dt1GYSD.InnerText = dtAll.Rows[0]["SIAPDANA_GY"].ToString().Remove(dtAll.Rows[0]["SIAPDANA_GY"].ToString().Length - 4);
                        //dt1GYOT.InnerText = dtAll.Rows[0]["OTHER_GY"].ToString().Remove(dtAll.Rows[0]["OTHER_GY"].ToString().Length - 4);

                        dt1INTY.InnerText = dtAll.Rows[0]["TOYOTA_IN"].ToString();
                        dt1INDH.InnerText = dtAll.Rows[0]["DAIHATSU_IN"].ToString();
                        dt1INSD.InnerText = dtAll.Rows[0]["SIAPDANA_INFINITE"].ToString();
                        dt1INOT.InnerText = dtAll.Rows[0]["OTHER_IN"].ToString();

                        dt1VALIDTY.InnerText = dtAll.Rows[0]["TOYOTA_VALID"].ToString();
                        dt1VALIDDH.InnerText = dtAll.Rows[0]["DAIHATSU_VALID"].ToString();
                        dt1VALIDSD.InnerText = dtAll.Rows[0]["SIAPDANA_PLATINUM"].ToString();
                        dt1VALIDOT.InnerText = dtAll.Rows[0]["OTHER_VALID"].ToString();

                        dt1RJCTY.InnerText = dtAll.Rows[0]["TOYOTA_REJECT"].ToString();
                        dt1RJCDH.InnerText = dtAll.Rows[0]["DAIHATSU_REJECT"].ToString();
                        dt1RJCSD.InnerText = dtAll.Rows[0]["SIAPDANA_LUX"].ToString();
                        dt1RJCOT.InnerText = dtAll.Rows[0]["OTHER_REJECT"].ToString();

                        dt1CANTY.InnerText = dtAll.Rows[0]["TOYOTA_CANCEL"].ToString();
                        dt1CANDH.InnerText = dtAll.Rows[0]["DAIHATSU_CANCEL"].ToString();
                        dt1CANSD.InnerText = dtAll.Rows[0]["SIAPDANA_CANCEL"].ToString();
                        dt1CANOT.InnerText = dtAll.Rows[0]["OTHER_CAN"].ToString();
                        //added in process
                        dt1IP.InnerText = dtAll.Rows[0]["IN_PROCESS"].ToString();

                        dt1Office.InnerText = dtAll.Rows[0]["DBNAME"].ToString();

                        if (dtAll.Rows.Count > 1)
                        {

                            dt2APPinLM.InnerText = dtAll.Rows[1]["APP_IN_LAST_MONTH"].ToString();
                            dt2APPinTM.InnerText = dtAll.Rows[1]["APP_IN_THIS_MONTH"].ToString();
                            dt2Valid.InnerText = dtAll.Rows[1]["APP_VALID_THIS_MONTH"].ToString();
                            dt2BACKLOG.InnerText = dtAll.Rows[1]["BACKLOG"].ToString();

                            dt2REJECTLM.InnerText = dtAll.Rows[1]["APP_REJECT_LAST_MONTH"].ToString();
                            dt2REJECTTM.InnerText = dtAll.Rows[1]["APP_REJECT_THIS_MONTH"].ToString();
                            dt2TARGETvalidTM.InnerText = dtAll.Rows[1]["TARGET_THIS_MONTH"].ToString();
                            dt2TARGETValidLM.InnerText = dtAll.Rows[1]["APP_VALID_LAST_MONTH"].ToString();
                            dt2CANCELLM.InnerText = dtAll.Rows[1]["APP_CANCEL_LAST_MONTH"].ToString();
                            dt2CANCELTM.InnerText = dtAll.Rows[1]["APP_CANCEL_THIS_MONTH"].ToString();

                            gy1 = dtAll.Rows[1]["GROSS_YIELD"].ToString();
                            gy2 = dtAll.Rows[1]["TOYOTA_GY"].ToString();
                            gy3 = dtAll.Rows[1]["DAIHATSU_GY"].ToString();
                            gy4 = dtAll.Rows[1]["SIAPDANA_GY"].ToString();
                            gy5 = dtAll.Rows[1]["OTHER_GY"].ToString();

                            if (gy1 != "")
                            {
                                gy1 = gy1.Substring(0, 5);
                            }

                            if (gy2 != "")
                            {
                                gy2 = gy2.Substring(0, 5);
                            }

                            if (gy3 != "")
                            {
                                gy3 = gy3.Substring(0, 5);
                            }

                            if (gy4 != "")
                            {
                                gy4 = gy4.Substring(0, 5);
                            }

                            if (gy5 != "")
                            {
                                gy5 = gy5.Substring(0, 5);
                            }

                            dt2GY.InnerText = gy1;
                            dt2GYTY.InnerText = gy2;
                            dt2GYDH.InnerText = gy3;
                            dt2GYSD.InnerText = gy4;
                            dt2GYOT.InnerText = gy5;

                            //dt2GY.InnerText = dtAll.Rows[0]["GROSS_YIELD"].ToString().Remove(dtAll.Rows[0]["GROSS_YIELD"].ToString().Length - 4);

                            //dt2GYTY.InnerText = dtAll.Rows[0]["TOYOTA_GY"].ToString().Remove(dtAll.Rows[0]["TOYOTA_GY"].ToString().Length - 4);
                            //dt2GYDH.InnerText = dtAll.Rows[0]["DAIHATSU_GY"].ToString().Remove(dtAll.Rows[0]["DAIHATSU_GY"].ToString().Length - 4);
                            //dt2GYSD.InnerText = dtAll.Rows[0]["SIAPDANA_GY"].ToString().Remove(dtAll.Rows[0]["SIAPDANA_GY"].ToString().Length - 4);
                            //dt2GYOT.InnerText = dtAll.Rows[0]["OTHER_GY"].ToString().Remove(dtAll.Rows[0]["OTHER_GY"].ToString().Length - 4);

                            dt2INTY.InnerText = dtAll.Rows[1]["TOYOTA_IN"].ToString();
                            dt2INDH.InnerText = dtAll.Rows[1]["DAIHATSU_IN"].ToString();
                            dt2INSD.InnerText = dtAll.Rows[1]["SIAPDANA_INFINITE"].ToString();
                            dt2INOT.InnerText = dtAll.Rows[1]["OTHER_IN"].ToString();

                            dt2VALIDTY.InnerText = dtAll.Rows[1]["TOYOTA_VALID"].ToString();
                            dt2VALIDDH.InnerText = dtAll.Rows[1]["DAIHATSU_VALID"].ToString();
                            dt2VALIDSD.InnerText = dtAll.Rows[1]["SIAPDANA_PLATINUM"].ToString();
                            dt2VALIDOT.InnerText = dtAll.Rows[1]["OTHER_VALID"].ToString();

                            dt2RJCTY.InnerText = dtAll.Rows[1]["TOYOTA_REJECT"].ToString();
                            dt2RJCDH.InnerText = dtAll.Rows[1]["DAIHATSU_REJECT"].ToString();
                            dt2RJCSD.InnerText = dtAll.Rows[1]["SIAPDANA_LUX"].ToString();
                            dt2RJCOT.InnerText = dtAll.Rows[1]["OTHER_REJECT"].ToString();

                            dt2CANTY.InnerText = dtAll.Rows[1]["TOYOTA_CANCEL"].ToString();
                            dt2CANDH.InnerText = dtAll.Rows[1]["DAIHATSU_CANCEL"].ToString();
                            dt2CANSD.InnerText = dtAll.Rows[1]["SIAPDANA_CANCEL"].ToString();
                            dt2CANOT.InnerText = dtAll.Rows[1]["OTHER_CAN"].ToString();
                            //added in process
                            dt2IP.InnerText = dtAll.Rows[1]["IN_PROCESS"].ToString();

                            dt2Office.InnerText = dtAll.Rows[1]["DBNAME"].ToString();
                        }
                        if (dtAll.Rows.Count > 2)
                        {
                            dt3APPinLM.InnerText = dtAll.Rows[2]["APP_IN_LAST_MONTH"].ToString();
                            dt3APPinTM.InnerText = dtAll.Rows[2]["APP_IN_THIS_MONTH"].ToString();
                            dt3Valid.InnerText = dtAll.Rows[2]["APP_VALID_THIS_MONTH"].ToString();
                            dt3BACKLOG.InnerText = dtAll.Rows[2]["BACKLOG"].ToString();

                            dt3REJECTLM.InnerText = dtAll.Rows[2]["APP_REJECT_LAST_MONTH"].ToString();
                            dt3REJECTTM.InnerText = dtAll.Rows[2]["APP_REJECT_THIS_MONTH"].ToString();
                            dt3TARGETvalidTM.InnerText = dtAll.Rows[2]["TARGET_THIS_MONTH"].ToString();
                            dt3TARGETValidLM.InnerText = dtAll.Rows[2]["APP_VALID_LAST_MONTH"].ToString();
                            dt3CANCELLM.InnerText = dtAll.Rows[2]["APP_CANCEL_LAST_MONTH"].ToString();
                            dt3CANCELTM.InnerText = dtAll.Rows[2]["APP_CANCEL_THIS_MONTH"].ToString();

                            gy1 = dtAll.Rows[2]["GROSS_YIELD"].ToString();
                            gy2 = dtAll.Rows[2]["TOYOTA_GY"].ToString();
                            gy3 = dtAll.Rows[2]["DAIHATSU_GY"].ToString();
                            gy4 = dtAll.Rows[2]["SIAPDANA_GY"].ToString();
                            gy5 = dtAll.Rows[2]["OTHER_GY"].ToString();

                            if (gy1 != "")
                            {
                                gy1 = gy1.Substring(0, 5);
                            }

                            if (gy2 != "")
                            {
                                gy2 = gy2.Substring(0, 5);
                            }

                            if (gy3 != "")
                            {
                                gy3 = gy3.Substring(0, 5);
                            }

                            if (gy4 != "")
                            {
                                gy4 = gy4.Substring(0, 5);
                            }

                            if (gy5 != "")
                            {
                                gy5 = gy5.Substring(0, 5);
                            }

                            dt3GY.InnerText = gy1;
                            dt3GYTY.InnerText = gy2;
                            dt3GYDH.InnerText = gy3;
                            dt3GYSD.InnerText = gy4;
                            dt3GYOT.InnerText = gy5;

                            //dt3GY.InnerText = dtAll.Rows[0]["GROSS_YIELD"].ToString().Remove(dtAll.Rows[0]["GROSS_YIELD"].ToString().Length - 4);

                            //dt3GYTY.InnerText = dtAll.Rows[0]["TOYOTA_GY"].ToString().Remove(dtAll.Rows[0]["TOYOTA_GY"].ToString().Length - 4);
                            //dt3GYDH.InnerText = dtAll.Rows[0]["DAIHATSU_GY"].ToString().Remove(dtAll.Rows[0]["DAIHATSU_GY"].ToString().Length - 4);
                            //dt3GYSD.InnerText = dtAll.Rows[0]["SIAPDANA_GY"].ToString().Remove(dtAll.Rows[0]["SIAPDANA_GY"].ToString().Length - 4);
                            //dt3GYOT.InnerText = dtAll.Rows[0]["OTHER_GY"].ToString().Remove(dtAll.Rows[0]["OTHER_GY"].ToString().Length - 4);

                            dt3INTY.InnerText = dtAll.Rows[2]["TOYOTA_IN"].ToString();
                            dt3INDH.InnerText = dtAll.Rows[2]["DAIHATSU_IN"].ToString();
                            dt3INSD.InnerText = dtAll.Rows[2]["SIAPDANA_INFINITE"].ToString();
                            dt3INOT.InnerText = dtAll.Rows[2]["OTHER_IN"].ToString();

                            dt3VALIDTY.InnerText = dtAll.Rows[2]["TOYOTA_VALID"].ToString();
                            dt3VALIDDH.InnerText = dtAll.Rows[2]["DAIHATSU_VALID"].ToString();
                            dt3VALIDSD.InnerText = dtAll.Rows[2]["SIAPDANA_PLATINUM"].ToString();
                            dt3VALIDOT.InnerText = dtAll.Rows[2]["OTHER_VALID"].ToString();

                            dt3RJCTY.InnerText = dtAll.Rows[2]["TOYOTA_REJECT"].ToString();
                            dt3RJCDH.InnerText = dtAll.Rows[2]["DAIHATSU_REJECT"].ToString();
                            dt3RJCSD.InnerText = dtAll.Rows[2]["SIAPDANA_LUX"].ToString();
                            dt3RJCOT.InnerText = dtAll.Rows[2]["OTHER_REJECT"].ToString();

                            dt3CANTY.InnerText = dtAll.Rows[2]["TOYOTA_CANCEL"].ToString();
                            dt3CANDH.InnerText = dtAll.Rows[2]["DAIHATSU_CANCEL"].ToString();
                            dt3CANSD.InnerText = dtAll.Rows[2]["SIAPDANA_CANCEL"].ToString();
                            dt3CANOT.InnerText = dtAll.Rows[2]["OTHER_CAN"].ToString();
                            //added in process
                            dt3IP.InnerText = dtAll.Rows[2]["IN_PROCESS"].ToString();

                            dt3Office.InnerText = dtAll.Rows[2]["DBNAME"].ToString();
                        }
                        if (dtAll.Rows.Count > 3)
                        {
                            dt4APPinLM.InnerText = dtAll.Rows[3]["APP_IN_LAST_MONTH"].ToString();
                            dt4APPinTM.InnerText = dtAll.Rows[3]["APP_IN_THIS_MONTH"].ToString();
                            dt4Valid.InnerText = dtAll.Rows[3]["APP_VALID_THIS_MONTH"].ToString();
                            dt4BACKLOG.InnerText = dtAll.Rows[3]["BACKLOG"].ToString();

                            dt4REJECTLM.InnerText = dtAll.Rows[3]["APP_REJECT_LAST_MONTH"].ToString();
                            dt4REJECTTM.InnerText = dtAll.Rows[3]["APP_REJECT_THIS_MONTH"].ToString();
                            dt4TARGETvalidTM.InnerText = dtAll.Rows[3]["TARGET_THIS_MONTH"].ToString();
                            dt4TARGETValidLM.InnerText = dtAll.Rows[3]["APP_VALID_LAST_MONTH"].ToString();
                            dt4CANCELLM.InnerText = dtAll.Rows[3]["APP_CANCEL_LAST_MONTH"].ToString();
                            dt4CANCELTM.InnerText = dtAll.Rows[3]["APP_CANCEL_THIS_MONTH"].ToString();


                            gy1 = dtAll.Rows[3]["GROSS_YIELD"].ToString();
                            gy2 = dtAll.Rows[3]["TOYOTA_GY"].ToString();
                            gy3 = dtAll.Rows[3]["DAIHATSU_GY"].ToString();
                            gy4 = dtAll.Rows[3]["SIAPDANA_GY"].ToString();
                            gy5 = dtAll.Rows[3]["OTHER_GY"].ToString();

                            if (gy1 != "")
                            {
                                gy1 = gy1.Substring(0, 5);
                            }

                            if (gy2 != "")
                            {
                                gy2 = gy2.Substring(0, 5);
                            }

                            if (gy3 != "")
                            {
                                gy3 = gy3.Substring(0, 5);
                            }

                            if (gy4 != "")
                            {
                                gy4 = gy4.Substring(0, 5);
                            }

                            if (gy5 != "")
                            {
                                gy5 = gy5.Substring(0, 5);
                            }

                            dt4GY.InnerText = gy1;
                            dt4GYTY.InnerText = gy2;
                            dt4GYDH.InnerText = gy3;
                            dt4GYSD.InnerText = gy4;
                            dt4GYOT.InnerText = gy5;

                            //dt4GY.InnerText = dtAll.Rows[0]["GROSS_YIELD"].ToString().Remove(dtAll.Rows[0]["GROSS_YIELD"].ToString().Length - 4);

                            //dt4GYTY.InnerText = dtAll.Rows[0]["TOYOTA_GY"].ToString().Remove(dtAll.Rows[0]["TOYOTA_GY"].ToString().Length - 4);
                            //dt4GYDH.InnerText = dtAll.Rows[0]["DAIHATSU_GY"].ToString().Remove(dtAll.Rows[0]["DAIHATSU_GY"].ToString().Length - 4);
                            //dt4GYSD.InnerText = dtAll.Rows[0]["SIAPDANA_GY"].ToString().Remove(dtAll.Rows[0]["SIAPDANA_GY"].ToString().Length - 4);
                            //dt4GYOT.InnerText = dtAll.Rows[0]["OTHER_GY"].ToString().Remove(dtAll.Rows[0]["OTHER_GY"].ToString().Length - 4);

                            dt4INTY.InnerText = dtAll.Rows[3]["TOYOTA_IN"].ToString();
                            dt4INDH.InnerText = dtAll.Rows[3]["DAIHATSU_IN"].ToString();
                            dt4INSD.InnerText = dtAll.Rows[3]["SIAPDANA_INFINITE"].ToString();
                            dt4INOT.InnerText = dtAll.Rows[3]["OTHER_IN"].ToString();

                            dt4VALIDTY.InnerText = dtAll.Rows[3]["TOYOTA_VALID"].ToString();
                            dt4VALIDDH.InnerText = dtAll.Rows[3]["DAIHATSU_VALID"].ToString();
                            dt4VALIDSD.InnerText = dtAll.Rows[3]["SIAPDANA_PLATINUM"].ToString();
                            dt4VALIDOT.InnerText = dtAll.Rows[3]["OTHER_VALID"].ToString();

                            dt4RJCTY.InnerText = dtAll.Rows[3]["TOYOTA_REJECT"].ToString();
                            dt4RJCDH.InnerText = dtAll.Rows[3]["DAIHATSU_REJECT"].ToString();
                            dt4RJCSD.InnerText = dtAll.Rows[3]["SIAPDANA_LUX"].ToString();
                            dt4RJCOT.InnerText = dtAll.Rows[3]["OTHER_REJECT"].ToString();

                            dt4CANTY.InnerText = dtAll.Rows[3]["TOYOTA_CANCEL"].ToString();
                            dt4CANDH.InnerText = dtAll.Rows[3]["DAIHATSU_CANCEL"].ToString();
                            dt4CANSD.InnerText = dtAll.Rows[3]["SIAPDANA_CANCEL"].ToString();
                            dt4CANOT.InnerText = dtAll.Rows[3]["OTHER_CAN"].ToString();
                            //added in process
                            dt4IP.InnerText = dtAll.Rows[3]["IN_PROCESS"].ToString();

                            dt4Office.InnerText = dtAll.Rows[3]["DBNAME"].ToString();
                        }

                    }
                }
                con.Close();
            }
        }


    }
}