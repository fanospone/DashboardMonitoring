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
    public partial class DashboardAppDeToValid4 : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string OfficeId = "";
        string Position = "";

        int StringBranch, StringDate;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            Position = Array[3];

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

                }
                con.Close();
            }
        }




        public void GetData(string BranchCode, int SeqNo)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_DataEntry", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BranchId", OfficeId);
                    cmd.Parameters.AddWithValue("@SeqNo", SeqNo);


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