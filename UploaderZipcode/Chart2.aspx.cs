using System;
using System.Collections.Generic;
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
    public partial class Chart2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //Fetch the Statistical data from database.
                //string query = "SELECT ShipCountry, DATEPART(Year, OrderDate) [Year], COUNT(OrderId) [Total]";
                //query += " FROM Orders WHERE ShipCountry IN ('France', 'Germany', 'Brazil')";
                //query += " GROUP BY ShipCountry, DATEPART(Year, OrderDate)";


                string query = "SELECT BRANCH ,DATEPART(Year, BIRTH_DT) [Year] ,COUNT(NIK) [Total]";
                query += " FROM FIESTA..EMPLOYEE WHERE BRANCH IN ( 'Bandung' ,'Head Office' ,'Jakarta North' ) AND BIRTH_DT > '19800101' AND BIRTH_DT < '19990101'";
                query += " GROUP BY BRANCH ,DATEPART(Year, BIRTH_DT)";
                


                DataTable dt = GetData(query);

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
        }



        private static DataTable GetData(string query)
        {
            string constr = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    return dt;
                }
            }
        }
    }
}


