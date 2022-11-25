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
    public partial class DashboardMonitoringCreditAnalyst_View : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        int StringArea, StringDate;

        int unclaim;

        protected void Page_Load(object sender, EventArgs e)
        {

            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];

            StringArea = Convert.ToInt32(Request.QueryString["a"]);
            StringDate = Convert.ToInt32(Request.QueryString["d"]);


            GetDataUnclaim(StringArea);
            GetData(StringArea, StringDate);




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

        public void GetData(int strArea, int StringDate)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_CA_NEW", con))
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
        

    }
}