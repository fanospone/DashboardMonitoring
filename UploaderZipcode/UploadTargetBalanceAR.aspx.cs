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
using System.IO;
using System.Threading;
using System.Data.OleDb;

namespace UploaderZipcode
{
    public partial class UploadTargetBalanceAR : System.Web.UI.Page
    {
        public DataTable dtAll = new DataTable();
        string Role = "";
        string Username = "";
        string BranchCode = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];

            if (!IsPostBack)
            {
                GetData();

                //Displaying the Data
                string isdownload = Request.QueryString["isdownload"];
            }
        }
        protected void Upload_Click(object sender, EventArgs e)
        {
            DataTable dt;
            lnkBtn.Enabled = false;
            string DateGet = DateTime.Now.ToString("MM/dd/yyyyHH:mm");
            //bool hasHeader = true;
            try
            {
                if (this.fileupload.HasFile)
                {
                    string ext = System.IO.Path.GetExtension(fileupload.PostedFile.FileName);
                    if (ext.Equals(".xls") || ext.Equals(".XLS"))
                    {
                        string fileName = "TARGET_BALANCE_AR_" + Username + "_" + DateTime.Now.ToString("ddMMyy_HHmmss") + ".xls";
                        string fileLocation = Server.MapPath("TemplateExcel/" + fileName);
                        fileupload.SaveAs(fileLocation);

                        dt = RetrieveExcel(fileLocation);

                        //Delete file Excel
                        File.Delete(Path.Combine(Proccess.rootFolder, fileName));

                        int Success = 0;
                        int Failed = 0;

                        

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            
                            int flag = InsertExcel(dt.Rows[i]["YEAR"].ToString(), dt.Rows[i]["MONTH"].ToString(),
                                        dt.Rows[i]["CATEGORY"].ToString(), dt.Rows[i]["HANDLING OFFICE AREA"].ToString(),
                                        dt.Rows[i]["BALANCE OVER"].ToString(), dt.Rows[i]["TARGET"].ToString().Replace(",", "."));

                            if (flag == 1)
                            {
                                Success = Success + 1;

                            }
                            else
                            {
                                Failed = Failed + 1;
                            }
                        }
                        Proccess.DeleteTarget("TARGET_BALANCE_AR", DateGet);
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Success!', \"Success : " + Success + " Failed : " + Failed + "\",'success','UploadTargetBalanceAR.aspx');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Failed!', 'Format file tidak sesuai.' ,'error','UploadTargetBalanceAR.aspx');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Failed!', 'Tidak ada file yang dipilih.' ,'error','UploadTargetBalanceAR.aspx');", true);
                }
        }
            catch (Exception ex)
            {
                string msg = "Terjadi kesalahan, Mohon hubungi Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + ex.Message.Replace(System.Environment.NewLine, " ") + "</span>";
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','UploadTargetBalanceAR.aspx');", true);
        }

    }

        protected DataTable RetrieveExcel(string fileLocation)
        {
            string connectionString = "";

            connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            fileLocation + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";

            OleDbConnection con = new OleDbConnection(connectionString);
            OleDbCommand cmd = new OleDbCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = con;
            OleDbDataAdapter dAdapter = new OleDbDataAdapter(cmd);
            DataTable dtExcelRecords = new DataTable();
            con.Open();
            DataTable dtExcelSheetName = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string getExcelSheetName = dtExcelSheetName.Rows[0]["Table_Name"].ToString();
            //cmd.CommandText = "SELECT * FROM [" + getExcelSheetName + "]";
            cmd.CommandText = "SELECT [YEAR],[MONTH], [CATEGORY], [HANDLING OFFICE AREA], [BALANCE OVER], [TARGET] FROM [Sheet1$]";
            dAdapter.SelectCommand = cmd;
            dAdapter.Fill(dtExcelRecords);

            //Close Semua Koneksi
            con.Close();
            cmd.Dispose();
            //dtExcelRecords.Clear();

            return dtExcelRecords;
        }

        private int InsertExcel(string YEAR, string MONTH, string CATEGORY, string REGION_ID, string BALANCE, string TARGET)
        {
            int flag = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {

                    using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_INSERT_TARGET_BALANCE_AR", con))
                    {

                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        cmd.Parameters.AddWithValue("@YEAR", YEAR);
                        cmd.Parameters.AddWithValue("@MONTH", MONTH);
                        cmd.Parameters.AddWithValue("@CATEGORY", CATEGORY);
                        cmd.Parameters.AddWithValue("@REGION_ID", REGION_ID);
                        cmd.Parameters.AddWithValue("@BALANCE", BALANCE);
                        cmd.Parameters.AddWithValue("@TARGET",TARGET);
                        cmd.Parameters.AddWithValue("@USR_CRT", User.Identity.Name);
                        cmd.Parameters.AddWithValue("@GETDATE", DateTime.Now);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                flag = Convert.ToInt32(dr["NOTE"].ToString());
                            }
                        }

                    }
                    con.Close();
                }

            }
            catch (SqlException ex)
            {
                lblmessage.Text = ex.Message.ToString();
            }

            return flag;
        }


        public void GetData()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_ListTargetBalanceAR", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    gvGrid.DataSource = dtAll;
                    gvGrid.DataBind();
                    gvGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                con.Close();
            }
        }



    }
}