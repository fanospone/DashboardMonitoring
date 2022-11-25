using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;

namespace UploaderZipcode
{
    public partial class DashboardAppBmAndTeleSvy : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        int StringArea, StringYear, StringMonth, StringDay;
        protected void Page_Load(object sender, EventArgs e)
        {

            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];

            StringArea = Convert.ToInt32(Request.QueryString["a"]);
            StringYear = Convert.ToInt32(Request.QueryString["y"]);
            StringMonth = Convert.ToInt32(Request.QueryString["m"]);
            StringDay = Convert.ToInt32(Request.QueryString["d"]);

            GetData(StringArea, StringYear, StringMonth, StringDay);



            /*
            if (!this.IsPostBack)
            {
                
                DataTable dt = GetDataChart();

                //Get the DISTINCT Countries.
                List<string> countries = (from p in dt.AsEnumerable()
                                          select p.Field<string>("BRANCH")).Distinct().ToList();

                //Loop through the Countries.
                foreach (string country in countries)
                {
                    //Get the Year for each Country.
                    int[] x = (from p in dt.AsEnumerable()
                               where p.Field<string>("BRANCH") == country
                               orderby p.Field<int>("Year") ascending
                               select p.Field<int>("Year")).ToArray();

                    //Get the Total of Orders for each Country.
                    int[] y = (from p in dt.AsEnumerable()
                               where p.Field<string>("BRANCH") == country
                               orderby p.Field<int>("Year") ascending
                               select p.Field<int>("Total")).ToArray();

                    //Add Series to the Chart.
                    Chart1.Series.Add(new Series(country));
                    Chart1.Series[country].IsValueShownAsLabel = true;
                    Chart1.Series[country].ChartType = SeriesChartType.StackedBar;
                    Chart1.Series[country].Points.DataBindXY(x, y);
                }

                Chart1.Legends[0].Enabled = true;
            }

             */


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

                    gvGrid1.DataSource = dtAll;
                    gvGrid1.DataBind();
                    gvGrid1.HeaderRow.TableSection = TableRowSection.TableHeader;

                    gvGrid2.DataSource = dtAll;
                    gvGrid2.DataBind();
                    gvGrid2.HeaderRow.TableSection = TableRowSection.TableHeader;

                    gvGrid3.DataSource = dtAll;
                    gvGrid3.DataBind();
                    gvGrid3.HeaderRow.TableSection = TableRowSection.TableHeader;

                    gvGrid4.DataSource = dtAll;
                    gvGrid4.DataBind();
                    gvGrid4.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                con.Close();
            }
        }

        public DataTable GetDataChart()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetChartBMTele", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                }
                con.Close();

                return dtAll;
            }
        }



    }
}