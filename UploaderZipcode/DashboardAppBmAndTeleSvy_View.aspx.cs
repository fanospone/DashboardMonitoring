using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class DashboardAppBmAndTeleSvy_View : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        int StringArea, StringDate;
        int unclaim;
        //, StringYear, StringMonth, StringDay;
        protected void Page_Load(object sender, EventArgs e)
        {

            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];

            StringArea = Convert.ToInt32(Request.QueryString["a"]);
            //StringYear = Convert.ToInt32(Request.QueryString["y"]);
            //StringMonth = Convert.ToInt32(Request.QueryString["m"]);
            //StringDay = Convert.ToInt32(Request.QueryString["d"]);

            StringDate = Convert.ToInt32(Request.QueryString["d"]);

            //GetData(StringArea, StringYear, StringMonth, StringDay);

            GetDataUnclaim(StringArea, StringDate);
            GetData(StringArea, StringDate);


        }

        public void GetDataUnclaim(int strArea, int StringDate)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDashboard_UnclaimedBM", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Date", StringDate.ToString());
                    cmd.Parameters.AddWithValue("@Area", strArea);
                    cmd.Parameters.AddWithValue("@TYPE", "SELECT");

                    cmd.CommandTimeout = 0;

                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());


                    //baru
                    if (dtAll.Rows.Count > 0)
                    {
                        sumAsgnUnc.InnerText = (Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("NEW_APP")))).ToString();
                        unclaim = Convert.ToInt32(dtAll.AsEnumerable().Sum(x => x.Field<int?>("NEW_APP")));

                        gvGrid1.DataSource = dtAll;
                        gvGrid1.DataBind();
                        gvGrid1.HeaderRow.TableSection = TableRowSection.TableHeader;
                        
                    }

                }
                con.Close();
            }
        }

        public void GetData(int strArea, int StringDate)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_BmTele_NEW", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Date", StringDate.ToString());
                    cmd.Parameters.AddWithValue("@Area", strArea);
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

                        sumAsgn.InnerText = (Convert.ToInt32(dtAll.AsEnumerable().Where(y => y.Field<string>("BUCKET") == "ASSIGN").Sum(x => x.Field<int?>("MONTHYLY_PRODUCTIVITY"))) + Convert.ToInt32(dtAll.AsEnumerable().Where(y => y.Field<string>("BUCKET") == "ASSIGN").Sum(x => x.Field<int?>("NEW"))) + unclaim).ToString();
                        sumProd.InnerText = dtAll.AsEnumerable().Where(y => y.Field<string>("BUCKET") == "ASSIGN").Sum(x => x.Field<int?>("MONTHYLY_PRODUCTIVITY")).ToString();
                        
                        sumTotTele.InnerText = (Convert.ToInt32(dtAll.AsEnumerable().Where(y => y.Field<string>("BUCKET") == "TELE").Sum(x => x.Field<int?>("MONTHYLY_PRODUCTIVITY"))) + Convert.ToInt32(dtAll.AsEnumerable().Where(y => y.Field<string>("BUCKET") == "TELE").Sum(x => x.Field<int?>("NEW"))) ).ToString();
                        sumProdTele.InnerText = dtAll.AsEnumerable().Where(y => y.Field<string>("BUCKET") == "TELE").Sum(x => x.Field<int?>("MONTHYLY_PRODUCTIVITY")).ToString();

                        sumTeleSame.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAILY_PRODUCTIVITY")).ToString();
                        sumTelePend.InnerText = dtAll.AsEnumerable().Sum(x => x.Field<int?>("DAILY_PRODUCTIVITY")).ToString();

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