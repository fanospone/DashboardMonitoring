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
    public partial class EmailSetting : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];

            GetData();
        }

        public void GetData()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetEmail", con))
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string yourValue = btn.CommandArgument;
            //yourValue = Encryption.Encryption.Encrypt(yourValue, Global.salt);
            Response.Redirect("EmailCreate.aspx?Id=" + yourValue);
        }

        //protected void btnDelete_Click(object sender, EventArgs e)
        //{
        //    LinkButton btn = (LinkButton)(sender);
        //    string yourValue = btn.CommandArgument;


        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_DeleteEmail", con))
        //        {
        //            dtAll = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;


        //            con.Open();
        //            dtAll.Clear();
        //            dtAll.Load(cmd.ExecuteReader());
        //            gvGrid.DataSource = dtAll;
        //            gvGrid.DataBind();
        //            gvGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        //        }
        //        con.Close();
        //    }

        //}


        protected void Create_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmailCreate.aspx");
        }
    }
}