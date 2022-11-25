using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using UploaderZipcode.Model;

namespace UploaderZipcode
{
    /// <summary>
    /// Summary description for CAMonitoringService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    [ScriptService]
    public class CAMonitoringService : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CAMonitoring> GetCAMonitoring(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CAmonitoring = new List<CAMonitoring>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var camonitoring = new CAMonitoring();

                    if (dr[15].ToString().Contains('.'))
                    {
                        camonitoring = new CAMonitoring
                        {
                            UserCA = dr[0].ToString(),
                            MTDNew = Convert.ToInt32(dr[1]),
                            MTDReturn = Convert.ToInt32(dr[2]),
                            MTDCopy = Convert.ToInt32(dr[3]),
                            DailyNew = Convert.ToInt32(dr[4]),
                            DailyReturn = Convert.ToInt32(dr[5]),
                            DailyCopy = Convert.ToInt32(dr[6]),
                            DENew = Convert.ToInt32(dr[7]),
                            DEReturn = Convert.ToInt32(dr[8]),
                            DECopy = Convert.ToInt32(dr[9]),
                            ClaimedNew = Convert.ToInt32(dr[10]),
                            ClaimedReturn = Convert.ToInt32(dr[11]),
                            ClaimedCopy = Convert.ToInt32(dr[12]),
                            RtnSo = Convert.ToInt32(dr[13]),
                            RtnSvy = Convert.ToInt32(dr[14]),
                            AchDec = Convert.ToDecimal(dr[15])
                        };
                    }
                    else
                    {
                        camonitoring = new CAMonitoring
                        {
                            UserCA = dr[0].ToString(),
                            MTDNew = Convert.ToInt32(dr[1]),
                            MTDReturn = Convert.ToInt32(dr[2]),
                            MTDCopy = Convert.ToInt32(dr[3]),
                            DailyNew = Convert.ToInt32(dr[4]),
                            DailyReturn = Convert.ToInt32(dr[5]),
                            DailyCopy = Convert.ToInt32(dr[6]),
                            DENew = Convert.ToInt32(dr[7]),
                            DEReturn = Convert.ToInt32(dr[8]),
                            DECopy = Convert.ToInt32(dr[9]),
                            ClaimedNew = Convert.ToInt32(dr[10]),
                            ClaimedReturn = Convert.ToInt32(dr[11]),
                            ClaimedCopy = Convert.ToInt32(dr[12]),
                            RtnSo = Convert.ToInt32(dr[13]),
                            RtnSvy = Convert.ToInt32(dr[14]),
                            Ach = Convert.ToInt32(dr[15])
                        };
                    }
                    
                    CAmonitoring.Add(camonitoring);
                }
            }
            return CAmonitoring;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Tanggal> GetDate(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CATanggal = new List<Tanggal>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objTanggal = new Tanggal
                    {
                        LastDate ="Last Status" +" - "+ dr[16].ToString()
                    };
                    CATanggal.Add(objTanggal);
                }
            }


            return CATanggal;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CATotalHeader> GetTotal(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CATotalHeader = new List<CATotalHeader>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_TOTAL", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objTotalHeader = new CATotalHeader
                    {
                        HeaderTotal1 = Convert.ToInt32(dr[0]),
                        HeaderTotal2 = Convert.ToInt32(dr[1])
                    };
                    CATotalHeader.Add(objTotalHeader);
                }
            }

           
            return CATotalHeader;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CATotalHeader> GetDone(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CATotalHeader = new List<CATotalHeader>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_DONE", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objTotalHeader = new CATotalHeader
                    {
                        HeaderTotal1 = Convert.ToInt32(dr[0]),
                        HeaderTotal2 = Convert.ToInt32(dr[1])
                    };
                    CATotalHeader.Add(objTotalHeader);
                }
            }


            return CATotalHeader;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CATotalHeader> GetDE(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CATotalHeader = new List<CATotalHeader>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_DE", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objTotalHeader = new CATotalHeader
                    {
                        HeaderTotal1 = Convert.ToInt32(dr[0]),
                        HeaderTotal2 = Convert.ToInt32(dr[1])
                    };
                    CATotalHeader.Add(objTotalHeader);
                }
            }


            return CATotalHeader;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CATotalHeader> GetCR(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CATotalHeader = new List<CATotalHeader>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_CR", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objTotalHeader = new CATotalHeader
                    {
                        HeaderTotal1 = Convert.ToInt32(dr[0]),
                        HeaderTotal2 = Convert.ToInt32(dr[1])
                    };
                    CATotalHeader.Add(objTotalHeader);
                }
            }


            return CATotalHeader;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CATotalHeader> GetPending(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CATotalHeader = new List<CATotalHeader>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_PENDING", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objTotalHeader = new CATotalHeader
                    {
                        HeaderTotal1 = Convert.ToInt32(dr[0]),
                        HeaderTotal2 = Convert.ToInt32(dr[1])
                    };
                    CATotalHeader.Add(objTotalHeader);
                }
            }


            return CATotalHeader;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<CATotalHeader> GetAch(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CATotalHeader = new List<CATotalHeader>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_ACHIEVEMENT", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objTotalHeader = new CATotalHeader
                    {
                        HeaderTotal1 = Convert.ToInt32(dr[0]),
                        HeaderTotal2 = Convert.ToInt32(dr[1])
                    };
                    CATotalHeader.Add(objTotalHeader);
                }
            }


            return CATotalHeader;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<TotalAchievement> GetTotalAchievement(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var totalAchievements = new List<TotalAchievement>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_TOTAL_ACHIEVEMENT", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objTotal = new TotalAchievement
                    {
                        Total = dr[0].ToString(),
                    };
                    totalAchievements.Add(objTotal);
                }
            }


            return totalAchievements;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<barChart> getdrawChart(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CAbarChartc = new List<barChart>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_DRWACHART", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objBarchart = new barChart
                    {
                        Area = dr[0].ToString(),
                        RangeNew = Convert.ToInt32(dr[1]),
                        RangeReturn = Convert.ToInt32(dr[2]),
                        RangeCopy = Convert.ToInt32(dr[3])
                    };
                    CAbarChartc.Add(objBarchart);
                }
            }


            return CAbarChartc;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<SumChart> getSumChart(string type)
        {
            var cs = ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString;
            var CASumChart = new List<SumChart>();
            using (var con = new SqlConnection(cs))
            {
                var cmd = new SqlCommand("spDASHBOARD_CreditManagement_SUM_DRWACHART", con) { CommandType = CommandType.StoredProcedure };
                //string ddlCategory = null;
                cmd.Parameters.AddWithValue("@AREA", type);
                con.Open();
                var dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    var objSumChart = new SumChart
                    {
                        SumRangeNew = Convert.ToInt32(dr[0]),
                        SumRangeReturn = Convert.ToInt32(dr[1]),
                        SumRangeCopy = Convert.ToInt32(dr[2])
                    };
                    CASumChart.Add(objSumChart);
                }
            }

            return CASumChart;
        }

        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public List<barChart> getdrawChart()
        //{
        //    List<barChart> revenues = new List<barChart>();
        //    using (SqlConnection con = new SqlConnection("Data Source=.;Trusted_Connection=true;DataBase=test"))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = con;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = "Pr_getrevenue";
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataSet ds = new DataSet();
        //            da.Fill(ds, "Revenue");
        //            if (ds != null)
        //            {
        //                if (ds.Tables.Count > 0)
        //                {
        //                    if (ds.Tables["Revenue"].Rows.Count > 0)
        //                    {
        //                        foreach (DataRow dr in ds.Tables["Revenue"].Rows)
        //                        {
        //                            revenues.Add(new barChart
        //                            {
        //                                year = dr["year"].ToString(),
        //                                quarter1 = Convert.ToInt32(dr["Q1"]),
        //                                quarter2 = Convert.ToInt32(dr["Q3"]),
        //                                quarter3 = Convert.ToInt32(dr["Q3"]),
        //                                quarter4 = Convert.ToInt32(dr["Q4"])
        //                            });
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    return revenues;
        //}

    }
}
