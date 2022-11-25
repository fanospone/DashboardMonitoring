using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class DetailMonitoringCreditAnalyst : System.Web.UI.Page
    {
        DataTable dtAll;
        string Role = "";
        string Username = "";
        string BranchCode = "";
        string Position = "";
        string link;

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] Array = Proses.UserInfo();

            Username = Array[0];
            Role = Array[1];
            BranchCode = Array[2];
            Position = Array[3];

            if (!IsPostBack)
            {
                dt1.Value = DateTime.Now.ToString("yyyy/MM/dd");

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int ParamArea = Convert.ToInt32(ddlArea.SelectedValue);
            string ParamDate = dt1.Value.Replace("/", "");

            int ParamDay, ParamMonth, ParamYear;

            ParamDay = Convert.ToInt32(ParamDate.Substring(6, 2));
            ParamMonth = Convert.ToInt32(ParamDate.Substring(4, 2)); ;
            ParamYear = Convert.ToInt32(ParamDate.Substring(0, 4)); ;

            // Response.Redirect("DashboardAppBmAndTeleSvy_View.aspx?d=" + ParamDay + "&m=" + ParamMonth + "&y=" + ParamYear + "&a=" + ParamArea + "");


            Response.Redirect("DashboardMonitoringCreditAnalyst_View.aspx?d=" + ParamDate + "&a=" + ParamArea + "");
        }
    }
}