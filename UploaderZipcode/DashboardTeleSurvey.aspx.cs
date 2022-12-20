using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using System.Web.Services;
using UploaderZipcode.Model;
using RestSharp.Serializers;

namespace UploaderZipcode
{
    public partial class DashboardTeleSurvey : System.Web.UI.Page
    {
        DataTable dtAll;
        DataTable dtSLAToday;
        DataTable dtSLABefore;
        DataTable dtStdActvty;
        int StringArea;
        public string lineSLAToday;
        public string lineSLABefore;
        public string linestdMinSLA;
        public string linestdActvty;
        public string lineAchiveNOW;
        public string lineAchiveBEFORE;
        public int sumTtl;
        public int areaInt;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //StringArea = Convert.ToInt32(Request.QueryString["a"]);
                //GetData(StringArea);
                //GetDataDaily(StringArea);
                //LoadSLAToday(StringArea);
            }
        }
        //private int AreaSelected
        //{
        //    get
        //    {
        //        int Area;
        //        Area = int.Parse(ddlSearch.SelectedValue);
        //        return Area;
        //    }
        //}

        [WebMethod]
        public static List<TeleSurvey> GetDataMTD(string Area)
        {
            List<TeleSurvey> ListMTD = new List<TeleSurvey>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                var cmd = new SqlCommand("spDASHBOARD_TELESURVEY", con) { CommandType = CommandType.StoredProcedure };
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Area", int.Parse(Area));
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                TeleSurvey tx;
                foreach (DataRow dx in dt.Rows)
                {
                    tx = new TeleSurvey();
                    tx.svyr = dx["svyr"].ToString();
                    tx.Total = int.Parse(dx["Total"].ToString());
                    tx.Submit = int.Parse(dx["Submit"].ToString());
                    tx.Pending = int.Parse(dx["Pending"].ToString());
                    tx.SixMnts = int.Parse(dx["SixMnts"].ToString());
                    tx.OneEightM = int.Parse(dx["OneEightM"].ToString());
                    tx.PrcntgSix = int.Parse(dx["PrctgSix"].ToString());
                    tx.PrctgOneEight = int.Parse(dx["PrctgOneEight"].ToString());
                    ListMTD.Add(tx);
                }
            }
            return ListMTD;
        }

        [WebMethod]
        public static List<TeleSurvey> GetDataDAILY(string Area)
        {
            List<TeleSurvey> ListDaily = new List<TeleSurvey>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                var cmd = new SqlCommand("spDASHBOARD_TELESURVEYGETDATATODAY", con) { CommandType = CommandType.StoredProcedure };
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Area", int.Parse(Area));
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                TeleSurvey tx;
                foreach (DataRow dx in dt.Rows)
                {
                    tx = new TeleSurvey();
                    tx.svyr = dx["svyr"].ToString();
                    tx.Total = int.Parse(dx["Total"].ToString());
                    tx.Submit = int.Parse(dx["Submit"].ToString());
                    tx.Pending = int.Parse(dx["Pending"].ToString());
                    tx.SixMnts = int.Parse(dx["SixMnts"].ToString());
                    tx.OneEightM = int.Parse(dx["OneEightM"].ToString());
                    tx.PrcntgSix = int.Parse(dx["PrctgSix"].ToString());
                    tx.PrctgOneEight = int.Parse(dx["PrctgOneEight"].ToString());
                    ListDaily.Add(tx);
                }
            }
            return ListDaily;
        }

        //[WebMethod]
        public static TeleSurvey LoadSLAToday (string Area)
        {
            TeleSurvey SLAToday = new TeleSurvey();
            string lineSLAToday;
            string linestdPrdctvty;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                try
                {
                    var cmd = new SqlCommand("spDASHBOARD_TELESURVEYCHART", con) { CommandType = CommandType.StoredProcedure };
                    cmd.CommandTimeout = 0;
                    cmd.Parameters.AddWithValue("@Area", int.Parse(Area));
                    con.Open();
                    //SqlDataReader dr = cmd.ExecuteReader();
                    DataTable dtSLAToday = new DataTable();
                    dtSLAToday.Clear();
                    dtSLAToday.Load(cmd.ExecuteReader());
                    lineSLAToday = "[";
                    linestdPrdctvty = "[";
                    foreach (DataRow drow in dtSLAToday.Rows)
                    {
                        lineSLAToday += "[" + drow["AssignDate"] + "," + drow["SLANOW"] + "],";
                        linestdPrdctvty += "[" + drow["AssignDate"] + "," + drow["srvy"] + "],";
                    }
                    if (lineSLAToday.Length <= 1)
                    {
                        lineSLAToday = "[[0,0]]";
                    }
                    else
                    {
                        lineSLAToday = lineSLAToday.Remove(lineSLAToday.Length - 1) + ']';
                    }
                    if (linestdPrdctvty.Length <= 1)
                    {
                        linestdPrdctvty = "[[0,0]]";
                    }
                    else
                    {
                        linestdPrdctvty = linestdPrdctvty.Remove(linestdPrdctvty.Length - 1) + ']';
                    }
                    SLAToday.SLAToday = lineSLAToday;
                    SLAToday.stdPrdctvty = linestdPrdctvty;
                }
                catch (Exception e)
                {
                    throw new Exception("Error Get Data " + e.Message);
                }
            }
            return SLAToday;
        }
        //[WebMethod]
        public static TeleSurvey LoadSLALastM(string Area)
        {
            TeleSurvey SLALastM = new TeleSurvey();
            string lineSLABefore;
            string linestdMinSLA;
            string lineAchiveBEFORE;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                try
                {
                    var cmd = new SqlCommand("spDASHBOARD_TELESURVEYCHARTLASTMONTH", con) { CommandType = CommandType.StoredProcedure };
                    cmd.CommandTimeout = 0;
                    DataTable dtSLABefore = new DataTable();
                    cmd.Parameters.AddWithValue("@Area", int.Parse(Area));
                    con.Open();
                    dtSLABefore.Clear();
                    dtSLABefore.Load(cmd.ExecuteReader());
                    lineSLABefore = "[";
                    linestdMinSLA = "[";
                    lineAchiveBEFORE = "[";
                    foreach (DataRow dr in dtSLABefore.Rows)
                    {
                        lineSLABefore += "[" + dr["AssignDate"] + "," + dr["SLAB"] + "],";
                        linestdMinSLA += "" + dr["SLAStd"] + ",";
                        lineAchiveBEFORE += "[" + dr["AssignDate"] + "," + dr["prctgSLA"] + "],";
                    }
                    if (lineSLABefore.Length <= 1)
                    {
                        lineSLABefore = "[[0,0]]";
                    }
                    else
                    {
                        lineSLABefore = lineSLABefore.Remove(lineSLABefore.Length - 1) + ']';
                    }
                    if (linestdMinSLA.Length <= 1)
                    {
                        linestdMinSLA = "[0]";
                    }
                    else
                    {
                        linestdMinSLA = linestdMinSLA.Remove(linestdMinSLA.Length - 1) + ']';
                    }
                    if (lineAchiveBEFORE.Length <= 1)
                    {
                        lineAchiveBEFORE = "[[0,0]]";
                    }
                    else
                    {
                        lineAchiveBEFORE = lineAchiveBEFORE.Remove(lineAchiveBEFORE.Length - 1) + ']';
                    }
                    SLALastM.SLABefore = lineSLABefore;
                    SLALastM.stdMinSLA = linestdMinSLA;
                    SLALastM.AchiveBEFORE = lineAchiveBEFORE;
                }
                catch (Exception e)
                {
                    throw new Exception("Error Get Data " + e.Message);
                }
               
            }
            return SLALastM;
        }
        //[WebMethod]
        public static TeleSurvey LoadStdActivity(string Area)
        {
            TeleSurvey StdActivity = new TeleSurvey();
            //string lineSLABefore;
            string lineAchiveNOW;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                try
                {
                    var cmd = new SqlCommand("spDASHBOARD_TELESURVEYGETSLAACTVTY", con) { CommandType = CommandType.StoredProcedure };
                    cmd.CommandTimeout = 360;
                    DataTable dtStdActvty = new DataTable();

                    cmd.Parameters.AddWithValue("@Area", int.Parse(Area));
                    con.Open();
                    dtStdActvty.Clear();
                    dtStdActvty.Load(cmd.ExecuteReader());
                    //lineSLABefore = "[";
                    lineAchiveNOW = "[";
                    foreach (DataRow dr in dtStdActvty.Rows)
                    {
                        //var stdActValue = dr["StdActvty"];
                        //var AssignDate = dr["StdActvty"];
                        //if (stdActValue.Equals(null) || AssignDate.Equals(null))
                        //{
                        //    stdActValue = '0';
                        //    AssignDate = '0';
                        //}
                        //lineSLABefore += "[" + dr["assignDt"] + "," + dr["done180"] + "],";
                        lineAchiveNOW += "[" + dr["assignDt"] + "," + dr["AcvSLATM"] + "],";
                    }
                    //if (lineSLABefore.Length <= 1)
                    //{
                    //    lineSLABefore = "[[0,0]]";
                    //}
                    //else
                    //{
                    //    lineSLABefore = lineSLABefore.Remove(lineSLABefore.Length - 1) + ']';
                    //}

                    if (lineAchiveNOW.Length <= 1)
                    {
                        lineAchiveNOW = "[[0,0]]";
                    }
                    else
                    {
                        lineAchiveNOW = lineAchiveNOW.Remove(lineAchiveNOW.Length - 1) + ']';
                    }

                    //StdActivity.SLABefore = lineSLABefore;
                    StdActivity.AchiveNOW = lineAchiveNOW;
                }
                catch (Exception e)
                {
                    throw new Exception("Error Get Data " + e.Message);
                }
            }
            return StdActivity;
        }
        [WebMethod]
        public static TeleSurvey ChartList(string Area)
        {
            TeleSurvey ListChartAll = new TeleSurvey();

            ListChartAll.SLAToday = LoadSLAToday(Area).SLAToday;
            ListChartAll.stdPrdctvty = LoadSLAToday(Area).stdPrdctvty;
            ListChartAll.stdMinSLA = LoadSLALastM(Area).stdMinSLA;
            ListChartAll.AchiveBEFORE = LoadSLALastM(Area).AchiveBEFORE;
            ListChartAll.SLABefore = LoadSLALastM(Area).SLABefore;
            ListChartAll.AchiveNOW = LoadStdActivity(Area).AchiveNOW;

            return ListChartAll;
        }
        
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //int Area = Convert.ToInt32(ddlSearch.SelectedValue);
            //GetData(Area);
            //GetDataDaily(Area);
            //LoadSLAToday(Area);
        }

        //public void GetData(int strArea)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
        //    {

        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEY", con))
        //        {
        //            strArea = Convert.ToInt32(ddlSearch.SelectedValue);
        //            cmd.CommandTimeout = 360;
        //            dtAll = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Area", strArea);
        //            con.Open();
        //            dtAll.Clear();
        //            dtAll.Load(cmd.ExecuteReader());

        //            //GridMTD.DataSource = dtAll;
        //            //GridMTD.DataBind();
        //            //GridMTD.HeaderRow.TableSection = TableRowSection.TableHeader;

        //            con.Dispose();
        //        }
        //    }
        //}
        //public void GetDataDaily(int strArea)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
        //    {

        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEYGETDATATODAY", con))
        //        {
        //            strArea = Convert.ToInt32(ddlSearch.SelectedValue);
        //            cmd.CommandTimeout = 360;
        //            dtAll = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Area", strArea);
        //            con.Open();
        //            dtAll.Clear();
        //            dtAll.Load(cmd.ExecuteReader());

        //            //GridDaily.DataSource = dtAll;
        //            //GridDaily.DataBind();
        //            //GridDaily.HeaderRow.TableSection = TableRowSection.TableHeader;

        //            sumTtl = 0;
        //            foreach (DataRow dr in dtAll.Rows)
        //            {
        //                sumTtl += Convert.ToInt32(dr["OneEightM"]);
        //            }
        //            string ttlSum = Convert.ToString(sumTtl);

        //            con.Dispose();
        //        }
        //    }
        //}
        //public void LoadSLAToday(int strArea)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
        //    {

        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEYCHART", con))
        //        {
        //            strArea = Convert.ToInt32(ddlSearch.SelectedValue);
        //            cmd.CommandTimeout = 360;
        //            dtSLAToday = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Area", strArea);
        //            con.Open();
        //            dtSLAToday.Clear();
        //            dtSLAToday.Load(cmd.ExecuteReader());
        //            lineSLAToday = "[";
        //            foreach(DataRow dr in dtSLAToday.Rows)
        //            {
        //                lineSLAToday += "[" + dr["AssignDate"] + "," + dr["SLANOW"] + "],";
        //            }
        //            if(lineSLAToday.Length <= 1)
        //            {
        //                lineSLAToday = "[[0,0]]";
        //            }
        //            else
        //            {
        //                lineSLAToday = lineSLAToday.Remove(lineSLAToday.Length - 1) + ']';
        //            }

        //            con.Dispose();
        //        }
        //    }
        //    LoadSLALastM(strArea);
        //}
        //public void LoadSLALastM(int strArea)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEYCHARTLASTMONTH", con))
        //        {
        //            strArea = Convert.ToInt32(ddlSearch.SelectedValue);
        //            cmd.CommandTimeout = 360;
        //            dtSLABefore = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Area", strArea);
        //            con.Open();
        //            dtSLABefore.Clear();
        //            dtSLABefore.Load(cmd.ExecuteReader());
        //            linestdActvty = "[";
        //            linestdMinSLA = "[";
        //            lineAchiveBEFORE = "[";
        //            foreach (DataRow dr in dtSLABefore.Rows)
        //            {
        //                linestdActvty += "[" + dr["AssignDate"] + "," + dr["StdActvty"] + "],";
        //                linestdMinSLA += "" + dr["SLAStd"] + ",";
        //                lineAchiveBEFORE += "[" + dr["AssignDate"] + "," + dr["prctgSLA"] + "],";
        //            }
        //            if (linestdActvty.Length <= 1)
        //            {
        //                linestdActvty = "[[0,0]]";
        //            }
        //            else
        //            {
        //                linestdActvty = linestdActvty.Remove(linestdActvty.Length - 1) + ']';
        //            }
        //            if(linestdMinSLA.Length <= 1)
        //            {
        //                linestdMinSLA = "[0]";
        //            }
        //            else
        //            {
        //                linestdMinSLA = linestdMinSLA.Remove(linestdMinSLA.Length - 1) + ']';
        //            }
        //            if(lineAchiveBEFORE.Length <= 1)
        //            {
        //                lineAchiveBEFORE = "[[0,0]]";
        //            }
        //            else
        //            {
        //                lineAchiveBEFORE = lineAchiveBEFORE.Remove(lineAchiveBEFORE.Length - 1) + ']';
        //            }


        //            con.Dispose();
        //        }
        //    }
        //    LoadStdActivity(strArea);
        //}
        //public void LoadStdActivity(int strArea)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEYGETSLAACTVTY", con))
        //        {
        //            strArea = Convert.ToInt32(ddlSearch.SelectedValue);
        //            cmd.CommandTimeout = 360;
        //            dtStdActvty = new DataTable();
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Area", strArea);
        //            con.Open();
        //            dtStdActvty.Clear();
        //            dtStdActvty.Load(cmd.ExecuteReader());
        //            lineSLABefore = "[";
        //            lineAchiveNOW = "[";
        //            foreach (DataRow dr in dtStdActvty.Rows)
        //            {
        //                //var stdActValue = dr["StdActvty"];
        //                //var AssignDate = dr["StdActvty"];
        //                //if (stdActValue.Equals(null) || AssignDate.Equals(null))
        //                //{
        //                //    stdActValue = '0';
        //                //    AssignDate = '0';
        //                //}
        //                lineSLABefore +="[" + dr["assignDt"] + "," + dr["done180"] + "],";
        //                lineAchiveNOW +=  "[" + dr["assignDt"] + "," + dr["StdActvty"] + "],"; 
        //            }
        //            if (lineSLABefore.Length <= 1)
        //            {
        //                lineSLABefore = "[[0,0]]";
        //            }
        //            else
        //            {
        //                lineSLABefore = lineSLABefore.Remove(lineSLABefore.Length - 1) + ']';
        //            }

        //            if(lineAchiveNOW.Length <= 1)
        //            {
        //                lineAchiveNOW = "[[0,0]]";
        //            }
        //            else
        //            {
        //                lineAchiveNOW = lineAchiveNOW.Remove(lineAchiveNOW.Length - 1) + ']';
        //            }
        //            con.Dispose();
        //        }
        //    }
        //}
    }
}