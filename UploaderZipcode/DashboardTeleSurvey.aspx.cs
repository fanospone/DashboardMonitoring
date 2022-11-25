using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Mvc;
using System.Web.UI.WebControls;

using Highsoft.Web.Mvc.Charts;
using Highsoft.Web.Mvc.Charts.Rendering;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Web.Services;
using UploaderZipcode.Model;

namespace UploaderZipcode
{
    public partial class DashboardTeleSurvey : System.Web.UI.Page
    {
        DataTable dtAll;
        DataTable dtSLAToday;
        DataTable dtSLABefore;
        DataTable dtStdActvty;
        int StringArea, StringYear, StringMonth, StringDay;
        public string lineSLAToday;
        public string lineSLABefore;
        public string linestdMinSLA;
        public string linestdActvty;
        public string lineAchiveNOW;
        public string lineAchiveBEFORE;

        protected void Page_Load(object sender, EventArgs e)
        {
            StringArea = Convert.ToInt32(Request.QueryString["a"]);
            //GetData(StringArea);
            //GetDataDaily(StringArea);
            //LoadSLAToday(StringArea);
        }
        public void GetData(int strArea)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEY", con))
                {
                    strArea = Convert.ToInt32(ddl1.SelectedValue);
                    cmd.CommandTimeout = 360;
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Area", strArea);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                    GridMTD.DataSource = dtAll;
                    GridMTD.DataBind();
                    GridMTD.HeaderRow.TableSection = TableRowSection.TableHeader;
                    con.Dispose();
                }
            }
        }
        public void GetDataDaily(int strArea)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEYGETDATATODAY", con))
                {
                    strArea = Convert.ToInt32(ddl1.SelectedValue);
                    cmd.CommandTimeout = 360;
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Area", strArea);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                    GridDaily.DataSource = dtAll;
                    GridDaily.DataBind();
                    GridDaily.HeaderRow.TableSection = TableRowSection.TableHeader;
                    con.Dispose();
                }
            }
        }
        public void LoadSLAToday(int strArea)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEYCHART", con))
                {
                    strArea = Convert.ToInt32(ddl1.SelectedValue);
                    cmd.CommandTimeout = 360;
                    dtSLAToday = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Area", strArea);
                    con.Open();
                    dtSLAToday.Clear();
                    dtSLAToday.Load(cmd.ExecuteReader());
                    lineSLAToday = "[";
                    foreach(DataRow dr in dtSLAToday.Rows)
                    {
                        lineSLAToday += "[" + dr["AssignDate"] + "," + dr["SLANOW"] + "],";
                    }
                    lineSLAToday = lineSLAToday.Remove(lineSLAToday.Length - 1) + ']';
                    con.Dispose();
                }
            }
            LoadSLALastM(strArea);
        }
        public void LoadSLALastM(int strArea)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEYCHARTLASTMONTH", con))
                {
                    strArea = Convert.ToInt32(ddl1.SelectedValue);
                    cmd.CommandTimeout = 360;
                    dtSLABefore = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Area", strArea);
                    con.Open();
                    dtSLABefore.Clear();
                    dtSLABefore.Load(cmd.ExecuteReader());
                    linestdActvty = "[";
                    linestdMinSLA = "[";
                    lineAchiveBEFORE = "[";
                    foreach (DataRow dr in dtSLABefore.Rows)
                    {
                        linestdActvty += "[" + dr["AssignDate"] + "," + dr["SLAB"] + "],";
                        linestdMinSLA += "" + dr["SLAStd"] + ",";
                        lineAchiveBEFORE += "[" + dr["AssignDate"] + "," + dr["prctgSLA"] + "],";
                    }
                    linestdActvty = linestdActvty.Remove(linestdActvty.Length - 1) + ']';
                    linestdMinSLA = linestdMinSLA.Remove(linestdMinSLA.Length - 1) + ']';
                    lineAchiveBEFORE = lineAchiveBEFORE.Remove(lineAchiveBEFORE.Length - 1) + ']';

                    con.Dispose();
                }
            }
            LoadStdActivity(strArea);
        }
        public void LoadStdActivity(int strArea)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringTAFSCONFINS"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_TELESURVEYGETSLAACTVTY", con))
                {
                    strArea = Convert.ToInt32(ddl1.SelectedValue);
                    cmd.CommandTimeout = 360;
                    dtStdActvty = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Area", strArea);
                    con.Open();
                    dtStdActvty.Clear();
                    dtStdActvty.Load(cmd.ExecuteReader());
                    lineSLABefore = "[";
                    lineAchiveNOW = "[";
                    foreach (DataRow dr in dtStdActvty.Rows)
                    {
                        lineSLABefore += "[" + dr["assignDt"] + "," + dr["StdActvty"] + "],";
                        lineAchiveNOW += "[" + dr["assignDt"] + "," + dr["prctgSLA"] + "],";
                    }
                    lineSLABefore = lineSLABefore.Remove(lineSLABefore.Length - 1) + ']';
                    lineAchiveNOW = lineAchiveNOW.Remove(lineAchiveNOW.Length - 1) + ']';

                    con.Dispose();
                }
            }
        }
    }
}