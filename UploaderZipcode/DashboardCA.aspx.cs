using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class DashboardCA : System.Web.UI.Page
    {
        //public string Area
        //{
        //    get
        //    {
        //        object value = HttpContext.Current.Session["Area"];
        //        return value == null ? "" : (string)value;
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["Area"] = value;
        //    }
        //}

        //public string RangeNew
        //{
        //    get
        //    {
        //        object value = HttpContext.Current.Session["RangeNew"];
        //        return value == null ? "" : (string)value;
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["RangeNew"] = value;
        //    }
        //}

        //public string RangeCopy
        //{
        //    get
        //    {
        //        object value = HttpContext.Current.Session["RangeCopy"];
        //        return value == null ? "" : (string)value;
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["RangeCopy"] = value;
        //    }
        //}


        //public string RangeReturn
        //{
        //    get
        //    {
        //        object value = HttpContext.Current.Session["RangeReturn"];
        //        return value == null ? "" : (string)value;
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["RangeReturn"] = value;
        //    }
        //}
        //DataTable dtAll;
        //string DashboardTime;
        protected void Page_Load(object sender, EventArgs e)
        {
            //DashboardType = Request.QueryString["type"];

            //if (DashboardType != null)
            //{
            //    DashboardTime = Request.QueryString["time"];
            //}


            //Getdata();


            if (!IsPostBack)
            {
                //GetCategory(DashboardType);
                //ddlCategory.SelectedValue = DashboardType;
                ////dllTgl.SelectedValue = DashboardTime;
                //lblDate.Text = "LAST STATUS - " + DateTime.Now.AddDays(-1).ToString("dd - MMMM - yyyy");
                //Getdata();
                //GetTotalAchievement(ddlCategory.SelectedValue);

            }


        }


        //public string TotalAchievement
        //{
        //    get
        //    {
        //        object value = HttpContext.Current.Session["TotalAchievement"];
        //        return value == null ? "" : (string)value;
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["TotalAchievement"] = value;
        //    }
        //}

        //protected void GetTotalAchievement(string Id)
        //{
        //    DataTable dtAll;
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_CRM_TOTAL_ACHIEVEMENT", con))
        //        {
        //            dtAll = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@AREA", Id);
        //            con.Open();
        //            dtAll.Clear();
        //            dtAll.Load(cmd.ExecuteReader());
        //            con.Close();
        //        }
        //    }
        //    TotalAchievement = dtAll.Rows[0][0].ToString();
        //}

        //protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    GetTotalAchievement(ddlCategory.SelectedValue);
        //}

        //protected void Getdata()
        //{
        //    Area = "";
        //    RangeNew = "";
        //    RangeReturn = "";
        //    RangeCopy = "";

        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_CRM_DRWACHART", con))
        //        {
        //            dtAll = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@AREA", "");
        //            con.Open();
        //            dtAll.Clear();
        //            dtAll.Load(cmd.ExecuteReader());

        //        }
        //    }
        //    if (dtAll.Rows.Count > 0)
        //    {
        //        for (int i = 0; i < dtAll.Rows.Count; i++)
        //        {
        //            Area += "'" + dtAll.Rows[i]["OFFICE_NAME"].ToString() + "'";
        //            if (i + 1 < dtAll.Rows.Count)
        //            {
        //                Area += ",";
        //            }
        //        }

        //        for (int i = 0; i < dtAll.Rows.Count; i++)
        //        {
        //            RangeNew += dtAll.Rows[i]["NEW"].ToString();
        //            if (i + 1 < dtAll.Rows.Count)
        //            {
        //                RangeNew += ",";
        //            }
        //        }

        //        for (int i = 0; i < dtAll.Rows.Count; i++)
        //        {
        //            RangeReturn += dtAll.Rows[i]["RETURN"].ToString();
        //            if (i + 1 < dtAll.Rows.Count)
        //            {
        //                RangeReturn += ",";
        //            }
        //        }

        //        for (int i = 0; i < dtAll.Rows.Count; i++)
        //        {
        //            RangeCopy += dtAll.Rows[i]["Copy_Cancel"].ToString();
        //            if (i + 1 < dtAll.Rows.Count)
        //            {
        //                RangeCopy += ",";
        //            }
        //        }
        //    }
        //}


        //public void GetCategory(string DashboardType)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_CA_MASTERAREA", con))
        //        {
        //            DataTable dtAll = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;

        //            con.Open();
        //            dtAll.Clear();
        //            dtAll.Load(cmd.ExecuteReader());

        //            Dictionary<string, string> member = new Dictionary<string, string>();
        //            //member.Add("All", "All");
        //            int i = 0;
        //            for (i = 0; i < dtAll.Rows.Count; i++)
        //            {
        //                member.Add(dtAll.Rows[i]["AREA_CODE"].ToString(), dtAll.Rows[i]["AREA_NAME"].ToString());
        //            }

        //            ddlCategory.DataTextField = "Value";
        //            ddlCategory.DataValueField = "Key";
        //            ddlCategory.DataSource = member;
        //            ddlCategory.DataBind();


        //        }
        //        con.Close();
        //    }
        //}

        //protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string type = ddlCategory.SelectedItem.Value;
        //    //string time = dllTgl.SelectedItem.Value;

        //    Response.Redirect("DashboardCA.aspx?type=" + type);

        //}

        ////protected void dllTgl_SelectedIndexChanged(object sender, EventArgs e)
        ////{
        ////    string type = ddlCategory.SelectedItem.Value;
        ////    string time = dllTgl.SelectedItem.Value;

        ////    Response.Redirect("DashboardCA.aspx?type=" + type + "&time=" + time);

        ////}

        //public void getItem(string DashboardType)
        //{
        //    //DataTable dtTotal = Proses.GetDataCA("spDASHBOARD_CDE_PROSPECT", DashboardType, DashboardTime);
        //    //DataTable dtDone = Proses.GetDataCA("spDASHBOARD_CDE_MATCHING", DashboardType, DashboardTime);
        //    //DataTable dtNewDE = Proses.GetDataCA("spDASHBOARD_CDE_COUNT_LOGIN", DashboardType, DashboardTime);
        //    //DataTable dtNewCR = Proses.GetDataCA("spDASHBOARD_CDE_COMPLETION", DashboardType, DashboardTime);
        //    //DataTable dtPending = Proses.GetDataCA("spDASHBOARD_CDE_ACH_LAST_MONTH", DashboardType, DashboardTime);
        //    //DataTable dtAch = Proses.GetDataCA("spDASHBOARD_CDE_NAP", DashboardType, DashboardTime);
        //    DataTable dtGrid = Proses.GetDataCA("spDASHBOARD_CRM", DashboardType);
        //    //DataTable dtUnclaim = Proses.GetDataCA("spDASHBOARD_CDE_COMPLETION_PERFORM", DashboardType, DashboardTime);


        //    //if (dtTotal.Rows.Count > 0)
        //    //{
        //    //    lblTotal.Text = dtTotal.Rows[0]["SUBMIT"].ToString();
        //    //    LMTotal.Text = dtTotal.Rows[0]["WFD"].ToString();
        //    //}

        //    //if (dtDone.Rows.Count > 0)
        //    //{
        //    //    lblDone.Text = dtTotal.Rows[0]["SUBMIT"].ToString();
        //    //    LMDOne.Text = dtTotal.Rows[0]["WFD"].ToString();
        //    //}

        //    //if (dtNewDE.Rows.Count > 0)
        //    //{
        //    //    lblDE.Text = dtTotal.Rows[0]["SUBMIT"].ToString();
        //    //    LMCR.Text = dtTotal.Rows[0]["WFD"].ToString();
        //    //}

        //    //if (dtNewCR.Rows.Count > 0)
        //    //{
        //    //    lblCR.Text = dtTotal.Rows[0]["SUBMIT"].ToString();
        //    //    LMTotal.Text = dtTotal.Rows[0]["WFD"].ToString();
        //    //}

        //    //if (dtPending.Rows.Count > 0)
        //    //{
        //    //    lblPending.Text = dtTotal.Rows[0]["SUBMIT"].ToString();
        //    //    LMPending.Text = dtTotal.Rows[0]["WFD"].ToString();
        //    //}

        //    //if (dtAch.Rows.Count > 0)
        //    //{
        //    //    lblAchieve.Text = dtTotal.Rows[0]["SUBMIT"].ToString();
        //    //    LMPending.Text = dtTotal.Rows[0]["WFD"].ToString();
        //    //}

        //    if (dtGrid.Rows.Count > 0)
        //    {
        //        GetCAMonitoring();
        //        //Response.Redirect("CAMonitoringService.asmx/GetCAMonitoring);
        //    }

        //    //if (dtUnclaim.Rows.Count > 0)
        //    //{

        //    //}


        //}

        //public void GetCAMonitoring()
        //{
        //    CAMonitoringService CAService = new CAMonitoringService();

        //}

        //public void setGrid()
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringName"].ConnectionString))
        //    {
        //        GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
        //        using (SqlCommand cmd = new SqlCommand("spTACP_GET_LOG", con))
        //        {
        //            dtAll = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@User", principal.Identity.Name);
        //            con.Open();
        //            dtAll.Clear();
        //            dtAll.Load(cmd.ExecuteReader());
        //            //TableId.DataSource = dtAll;
        //            //TableId.DataBind();
        //            //TableId.HeaderRow.TableSection = TableRowSection.TableHeader;
        //        }
        //        con.Close();
        //    }
        //}

        //protected void btnHome_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("DashboardHome.aspx");
        //}
    }
}