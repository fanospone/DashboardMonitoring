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

    public partial class DashboardHome : System.Web.UI.Page
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
            Response.Redirect("DashboardFieldSurveyOutCity.aspx?realtime=" + "1" + "&loop=" + "1" + "&seqno=" + "1");
        }

        protected void btnTwo_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardBMTele.aspx?realtime=" + "1" + "&loop=" + "2" + "&seqno=" + "1");
        }

        protected void btnThree_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardBMTele.aspx?realtime=" + "1" + "&loop=" + "3" + "&seqno=" + "1");
        }

        protected void btnFour_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardBMTele.aspx?realtime=" + "1" + "&loop=" + "4" + "&seqno=" + "1");
        }

        protected void btnFive_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardHomeSalesHO.aspx" );
        }

        protected void btnSix_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardAppDeToValid.aspx?realtime=" + "1" + "&loop=" + "6" + "&seqno=" + "1");
        }

        protected void btnSeven_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardSalesProcess.aspx?realtime=" + "1" + "&loop=" + "7" + "&seqno=" + OfficeId.ToString() );
        }
    }
}