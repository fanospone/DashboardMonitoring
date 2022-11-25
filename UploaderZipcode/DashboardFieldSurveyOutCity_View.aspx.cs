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
    public partial class DashboardFieldSurveyOutCity_View : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        int StringArea, StringYear, StringMonth;
        protected void Page_Load(object sender, EventArgs e)
        {

            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];

            StringArea = Convert.ToInt32(Request.QueryString["a"]);
            StringYear = Convert.ToInt32(Request.QueryString["y"]);
            StringMonth = Convert.ToInt32(Request.QueryString["m"]);

            GetData(StringArea, StringYear, StringMonth);
        }
        public void GetData(int strOffice, int strYear, int strMonth)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_FieldOutCity_NEW", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AREA", strOffice);
                    cmd.Parameters.AddWithValue("@MONTH", strMonth);
                    cmd.Parameters.AddWithValue("@YEAR", strYear);
                    cmd.Parameters.AddWithValue("@TYPE", "SELECT");
                    cmd.CommandTimeout = 0;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                    if (dtAll.Rows.Count > 0)
                    {
                        spanArea.InnerText = dtAll.Rows[0]["DBNAME"].ToString();
                        spanUpd.InnerText = "LAST UPDATE " + dtAll.Rows[0]["DTM_UPD"].ToString();


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


    }
}