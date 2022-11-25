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
    public partial class DashboardSalesProcess : System.Web.UI.Page
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

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string Aspx = spanAspx.InnerText;
            string QueryString = spanQueryString.InnerText;

            Response.Redirect(Aspx + ".aspx" + QueryString);
        }

        string gy1, gy2, gy3, gy4, gy5;

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            RefOfficeId = Array[3];


            StringRealTime = Request.QueryString["realtime"];
            


            if (StringRealTime != null )
            {
                StringLoop = Convert.ToInt32(Request.QueryString["loop"]);
                StringSeqNo = Convert.ToInt32(Request.QueryString["seqno"]);
            }



            if (StringLoop == 7)
            {
                //jika tipe 7, seq no ganti ref office akun cabang
                StringSeqNo = Convert.ToInt32(RefOfficeId);
                getItem(StringLoop, StringSeqNo);

                spanAspx.InnerText = "DashboardAppDeToValid";
                spanQueryString.InnerText = "?realtime=" + "1" + "&loop=" + "7" + "&seqno=" + StringSeqNo;
            }
            else
            {
                if (StringLoop == 5)
                {
                    getItem(StringLoop, StringSeqNo);
                }

                if ((StringLoop == 51) || (StringLoop == 52) || (StringLoop == 53) || (StringLoop == 54))
                {
                    getItem(StringLoop, StringSeqNo);
                }

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
                spanQueryString.InnerText = "?realtime=" + "1" + "&loop=" + StringLoop + "&seqno=" + seqno;
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
                using (SqlCommand cmd = new SqlCommand("spDashboard_Loop"+ StringLoop+"_GetItem", con))
                {

                    DataTable dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SeqNo", StringSeqNo);
                    if (StringLoop == 7)
                    {
                        cmd.Parameters.AddWithValue("@DB", "SALES");
                    }

                    cmd.CommandTimeout = 0;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count > 0)
                    {

                        spanUpd.InnerText = "LAST UPDATE - " + dtAll.Rows[0]["DTM_UPD"].ToString();

                        dtAPPinLM.InnerText = dtAll.Rows[0]["APP_IN_LAST_MONTH"].ToString();
                        dtAPPinTM.InnerText = dtAll.Rows[0]["APP_IN_THIS_MONTH"].ToString();
                        dtValid.InnerText = dtAll.Rows[0]["APP_VALID_THIS_MONTH"].ToString();
                        dtBACKLOG.InnerText = dtAll.Rows[0]["BACKLOG"].ToString();

                        dtREJECTLM.InnerText = dtAll.Rows[0]["APP_REJECT_LAST_MONTH"].ToString();
                        dtREJECTTM.InnerText = dtAll.Rows[0]["APP_REJECT_THIS_MONTH"].ToString();
                        dtTARGETvalidTM.InnerText = dtAll.Rows[0]["TARGET_THIS_MONTH"].ToString();
                        dtTARGETValidLM.InnerText = dtAll.Rows[0]["APP_VALID_LAST_MONTH"].ToString();
                        dtCANCELLM.InnerText = dtAll.Rows[0]["APP_CANCEL_LAST_MONTH"].ToString();
                        dtCANCELTM.InnerText = dtAll.Rows[0]["APP_CANCEL_THIS_MONTH"].ToString();


                        Decimal prcntVal = Convert.ToDecimal((Convert.ToDecimal(dtAll.Rows[0]["APP_VALID_THIS_MONTH"]) - Convert.ToDecimal(dtAll.Rows[0]["APP_VALID_LAST_MONTH"])) / Convert.ToDecimal((dtAll.Rows[0]["APP_VALID_LAST_MONTH"].ToString() == "0" ? "1" : dtAll.Rows[0]["APP_VALID_LAST_MONTH"]))) * 100;
                        Decimal prcntIn = Convert.ToDecimal((Convert.ToDecimal(dtAll.Rows[0]["APP_IN_THIS_MONTH"]) - Convert.ToDecimal(dtAll.Rows[0]["APP_IN_LAST_MONTH"])) / Convert.ToDecimal((dtAll.Rows[0]["APP_IN_LAST_MONTH"].ToString() == "0" ? "1" : dtAll.Rows[0]["APP_IN_LAST_MONTH"]))) * 100;
                        Decimal prcntRec = Convert.ToDecimal((Convert.ToDecimal(dtAll.Rows[0]["APP_REJECT_THIS_MONTH"]) - Convert.ToDecimal(dtAll.Rows[0]["APP_REJECT_LAST_MONTH"])) / Convert.ToDecimal((dtAll.Rows[0]["APP_REJECT_LAST_MONTH"].ToString() == "0" ? "1": dtAll.Rows[0]["APP_REJECT_LAST_MONTH"]))) * 100;
                        Decimal prcntCan = Convert.ToDecimal((Convert.ToDecimal(dtAll.Rows[0]["APP_CANCEL_THIS_MONTH"]) - Convert.ToDecimal(dtAll.Rows[0]["APP_CANCEL_LAST_MONTH"])) / Convert.ToDecimal((dtAll.Rows[0]["APP_CANCEL_LAST_MONTH"].ToString() == "0" ? "1" : dtAll.Rows[0]["APP_CANCEL_LAST_MONTH"]))) * 100;

                        pcValid.InnerText = Convert.ToInt32(prcntVal).ToString();
                        pcIn.InnerText = Convert.ToInt32(prcntIn).ToString();
                        pcReject.InnerText = Convert.ToInt32(prcntRec).ToString();
                        pcCancel.InnerText = Convert.ToInt32(prcntCan).ToString();


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

                        dtGY.InnerText = gy1;
                        dtGYTY.InnerText = gy2;
                        dtGYDH.InnerText = gy3;
                        dtGYSD.InnerText = gy4;
                        dtGYOT.InnerText = gy5;

                        //dtGY.InnerText = dtAll.Rows[0]["GROSS_YIELD"].ToString().Remove(dtAll.Rows[0]["GROSS_YIELD"].ToString().Length - 4);
                        //dtGYTY.InnerText = dtAll.Rows[0]["TOYOTA_GY"].ToString().Remove(dtAll.Rows[0]["TOYOTA_GY"].ToString().Length - 4) ;
                        //dtGYDH.InnerText = dtAll.Rows[0]["DAIHATSU_GY"].ToString().Remove(dtAll.Rows[0]["DAIHATSU_GY"].ToString().Length - 4) ;
                        //dtGYSD.InnerText = dtAll.Rows[0]["SIAPDANA_GY"].ToString().Remove(dtAll.Rows[0]["SIAPDANA_GY"].ToString().Length - 4) ;
                        //dtGYOT.InnerText = dtAll.Rows[0]["OTHER_GY"].ToString().Remove(dtAll.Rows[0]["OTHER_GY"].ToString().Length - 4) ;

                        dtINTY.InnerText = dtAll.Rows[0]["TOYOTA_IN"].ToString();
                        dtINDH.InnerText = dtAll.Rows[0]["DAIHATSU_IN"].ToString();
                        dtINSD.InnerText = dtAll.Rows[0]["SIAPDANA_INFINITE"].ToString();
                        dtINOT.InnerText = dtAll.Rows[0]["OTHER_IN"].ToString();

                        dtVALIDTY.InnerText = dtAll.Rows[0]["TOYOTA_VALID"].ToString();
                        dtVALIDDH.InnerText = dtAll.Rows[0]["DAIHATSU_VALID"].ToString();
                        dtVALIDSD.InnerText = dtAll.Rows[0]["SIAPDANA_PLATINUM"].ToString();
                        dtVALIDOT.InnerText = dtAll.Rows[0]["OTHER_VALID"].ToString();

                        dtRJCTY.InnerText = dtAll.Rows[0]["TOYOTA_REJECT"].ToString();
                        dtRJCDH.InnerText = dtAll.Rows[0]["DAIHATSU_REJECT"].ToString();
                        dtRJCSD.InnerText = dtAll.Rows[0]["SIAPDANA_LUX"].ToString();
                        dtRJCOT.InnerText = dtAll.Rows[0]["OTHER_REJECT"].ToString();

                        dtCANTY.InnerText = dtAll.Rows[0]["TOYOTA_CANCEL"].ToString();
                        dtCANDH.InnerText = dtAll.Rows[0]["DAIHATSU_CANCEL"].ToString();
                        dtCANSD.InnerText = dtAll.Rows[0]["SIAPDANA_CANCEL"].ToString();
                        dtCANOT.InnerText = dtAll.Rows[0]["OTHER_CAN"].ToString();
                        //added in process
                        dtIP.InnerText = dtAll.Rows[0]["IN_PROCESS"].ToString();

                        office.InnerText = dtAll.Rows[0]["DBNAME"].ToString();
                    }
                }
                con.Close();
            }
        }

        


    }
}