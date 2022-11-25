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
    public partial class DashboardSalesProcess_View : System.Web.UI.Page
    {

        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string Position = "";
        int StringOffice, StringYear, StringMonth;
        string StringRealTime;
        string gy1, gy2, gy3, gy4, gy5;

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            Position = Array[3];

            StringRealTime = Request.QueryString["R"];

            if (StringRealTime != null && StringRealTime == "1")
            {
                DateTime sDate = DateTime.Now;

                StringMonth = sDate.Month;
                StringYear = sDate.Year;
            }
            else
            {
                StringYear = Convert.ToInt32(Request.QueryString["Y"]);
                StringMonth = Convert.ToInt32(Request.QueryString["M"]);
            }

            StringOffice = Convert.ToInt32(Request.QueryString["O"]);
            getData(StringOffice, StringYear, StringMonth);

        }


        public void getData(int strOffice, int strYear, int strMonth)
        {

            GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDashboard_SalesProcess_NEW", con))
                {

                    DataTable dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@OFFICE", strOffice);
                    cmd.Parameters.AddWithValue("@MONTH", strMonth);
                    cmd.Parameters.AddWithValue("@YEAR", strYear);
                    cmd.Parameters.AddWithValue("@TYPE", "SELECT");
                    cmd.CommandTimeout = 0;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count > 0)
                    {
                        //spanUpd.InnerText = "LAST UPDATE - " + dtAll.Rows[0]["DTM_UPD"].ToString();

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

                        //dtGYTY.InnerText = dtAll.Rows[0]["TOYOTA_GY"].ToString().Remove(dtAll.Rows[0]["TOYOTA_GY"].ToString().Length - 4);
                        //dtGYDH.InnerText = dtAll.Rows[0]["DAIHATSU_GY"].ToString().Remove(dtAll.Rows[0]["DAIHATSU_GY"].ToString().Length - 4);
                        //dtGYSD.InnerText = dtAll.Rows[0]["SIAPDANA_GY"].ToString().Remove(dtAll.Rows[0]["SIAPDANA_GY"].ToString().Length - 4);
                        //dtGYOT.InnerText = dtAll.Rows[0]["OTHER_GY"].ToString().Remove(dtAll.Rows[0]["OTHER_GY"].ToString().Length - 4);

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

                        office.InnerText = dtAll.Rows[0]["OFFICE_NAME"].ToString();
                        //Array[0] = dtAll.Rows[0]["USERNAME"].ToString();
                        //Array[1] = dtAll.Rows[0]["ROLE"].ToString();
                        //Array[2] = dtAll.Rows[0]["OFFICE_CODE"].ToString();
                    }
                }
                con.Close();
            }


        }



    }
}