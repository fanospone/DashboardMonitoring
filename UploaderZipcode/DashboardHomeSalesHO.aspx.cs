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

namespace UploaderZipcode
{
    public partial class DashboardHomeSalesHO : System.Web.UI.Page
    {

        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string Position = "";
        int OfficeId = 0;

        int StringOffice, StringYear, StringMonth;
        string StringRealTime;

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            OfficeId = Convert.ToInt32(Array[3]);

            DateTime sDate = DateTime.Now;

            StringMonth = sDate.Month;
            StringYear = sDate.Year;
            StringOffice = OfficeId;

        }

        protected void bntOne_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardSalesProcess.aspx?realtime=" + "1" + "&loop=" + "51" + "&seqno=" + "1");
        }

        protected void btnTwo_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardSalesProcess.aspx?realtime=" + "1" + "&loop=" + "52" + "&seqno=" + "1");
        }

        protected void btnThree_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardSalesProcess.aspx?realtime=" + "1" + "&loop=" + "53" + "&seqno=" + "1");
        }

        protected void btnFour_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardSalesProcess4.aspx?realtime=" + "1" + "&loop=" + "54" + "&seqno=" + "1");
        }
        protected void btnFive_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardSalesProcess.aspx?realtime=" + "1" + "&loop=" + "5" + "&seqno=" + "1");
        }


    }
}