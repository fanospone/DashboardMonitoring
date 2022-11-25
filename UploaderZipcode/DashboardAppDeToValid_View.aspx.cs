using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class DashboardAppDeToValid_View : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string OfficeId = "";
        string Position = "";

        int StringBranch, StringDate;

        //int StringOffice, StringFrom, StringTo;
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            Position = Array[3];

            //StringOffice = Convert.ToInt32(Request.QueryString["O"]);
            //StringFrom = Convert.ToInt32(Request.QueryString["F"]);
            //StringTo = Convert.ToInt32(Request.QueryString["T"]);


            //GetData(StringOffice, StringFrom, StringTo);

            StringBranch = Convert.ToInt32(Request.QueryString["b"]);
            StringDate = Convert.ToInt32(Request.QueryString["d"]);
            
            GetData(StringBranch, StringDate);
        }



        public void GetData(int strBranch, int StringDate)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_DataEntry_NEW", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Date", StringDate.ToString());
                    cmd.Parameters.AddWithValue("@BRANCHID", strBranch);
                    cmd.Parameters.AddWithValue("@TYPE", "SELECT");

                    cmd.CommandTimeout = 0;

                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());


                    //baru
                    if (dtAll.Rows.Count > 0)
                    {
                        spanArea.InnerText = dtAll.Rows[0]["DBNAME"].ToString();
                        spanUpd.InnerText = "LAST UPDATE " + dtAll.Rows[0]["DTM_UPD"].ToString();

                        spanAppIn.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("APP_IN")).ToString();
                        spanAppValid.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("APP_VALID")).ToString();
                        spanAppOnPc.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("APP_ONPC")).ToString();
                        spanRtHandling.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int>("RETURN_HANDLING")).ToString();

                        spanSrvyPc.InnerText = (dtAll.AsEnumerable().Sum(x => x.Field<int>("ASSIGN_SURVEY")) + dtAll.AsEnumerable().Sum(x => x.Field<int>("RESULT_SURVEY"))).ToString();
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

        public void GetData(int strOffice, int strFrom, int strTo)
        {

            var dtFrom = DateTime.ParseExact(strFrom.ToString(), "yyyyMMdd", null);

            var dtTo = DateTime.ParseExact(strTo.ToString(), "yyyyMMdd", null);


            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_Get_DataEntry", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PeriodFrom", dtFrom);
                    cmd.Parameters.AddWithValue("@PeriodTo", dtTo);
                    cmd.Parameters.AddWithValue("@BranchId", strOffice);
                    cmd.Parameters.AddWithValue("@TYPE", "SELECT");

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