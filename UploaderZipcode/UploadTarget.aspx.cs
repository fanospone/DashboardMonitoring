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

namespace UploaderZipcode
{
    public partial class UploadTarget : System.Web.UI.Page
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
            lnkBtn.Enabled = false;
            
            bool hasHeader = true;
            try
            {
                if (this.fileupload.HasFile)
                {
                    string ext = System.IO.Path.GetExtension(fileupload.PostedFile.FileName);
                    if (ext.Equals(".xlsx") || ext.Equals(".XLSX"))
                    {
                        string path = Server.MapPath("TemplateExcel\\");
                        path = path + "TARGET_"+ Username + "_" + DateTime.Now.ToString("ddMMyy_HHmmss") + Path.GetExtension(fileupload.PostedFile.FileName);
                        this.fileupload.SaveAs(path);

                        int Success = 0;
                        int Failed = 0;

                        using (var pck = new OfficeOpenXml.ExcelPackage())
                        {
                            using (var stream = File.OpenRead(path))
                            {
                                pck.Load(stream);
                            }
                            var ws = pck.Workbook.Worksheets.First();

                            var startRow = hasHeader ? 2 : 1;
                            List<string> value = new List<string>();


                            for (int rowNum = startRow; rowNum <= ws.Dimension.End.Row; rowNum++)
                            {
                                var wsRow = ws.Cells[rowNum, 1, rowNum, ws.Dimension.End.Column];


                                for (int i = 1; i <= ws.Dimension.End.Column; i++)
                                {
                                    value.Add(ws.Cells[rowNum, i].Text);
                                }


                                //JIKA ADA VALUE KOSONG
                                //if (value[0] == "" || value[1] == "" || value[2] == "" || value[3] == "" || value[4] == "" || value[5] == "")
                                //{
                                //    InsertToLog(value[0], value[1], "Terdapat data yang kosong");
                                //    Failed = Failed + 1;
                                //    value.Clear();
                                //}
                                //else
                                //{
                                if (InsertExcel(value) == 1)
                                {
                                    Success = Success + 1;

                                }
                                else
                                {
                                    Failed = Failed + 1;
                                }
                                value.Clear();
                                //}
                            }

                        }


                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Success!', \"Success : " + Success + " Failed : " + Failed + "\",'success','DashboardHome.aspx');", true);
                        
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Failed!', 'Format file tidak sesuai.' ,'error','UploadTarget.aspx');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Failed!', 'Tidak ada file yang dipilih.' ,'error','UploadTarget.aspx');", true);
                }
            }
            catch (Exception ex)
            {
                string msg = "Terjadi kesalahan, Mohon hubungi Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + ex.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','UploadTarget.aspx');", true);
            }

        }

        private int InsertExcel(List<string> value)
        {
            int flag = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {

                    using (SqlCommand cmd = new SqlCommand("spDASBOARD_UploadTargetSales", con))
                    {

                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        cmd.Parameters.Add("@Tahun", SqlDbType.VarChar).Value = value[0];
                        cmd.Parameters.Add("@Bulan", SqlDbType.VarChar).Value = value[1];
                        cmd.Parameters.Add("@RefOfficeID", SqlDbType.VarChar).Value = value[2];
                        cmd.Parameters.Add("@Target", SqlDbType.VarChar).Value = value[3];
                        cmd.Parameters.Add("@User", SqlDbType.VarChar).Value = User.Identity.Name;

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                flag = Convert.ToInt32(dr["MSG_TYPE"].ToString());
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
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetLog", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@User", Username);
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