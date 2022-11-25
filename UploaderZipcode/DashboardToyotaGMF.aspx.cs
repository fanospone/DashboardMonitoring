using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class DashboardToyotaGMF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string script = "window.onload = function() { TurnPage(); };";
                ClientScript.RegisterStartupScript(this.GetType(), "none", script, true);

                GetDataRanking();

                
            }
        }

        protected void GetDataRanking()
        {
            DataTable dtAll;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spGamification_TopListRank", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SEQUENCE_NO", "1");                  
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }           
                con.Close();

                if (dtAll.Rows.Count > 0)
                {
                    lblHeader1.Text = dtAll.Rows[0]["Gamification_Name"].ToString();
                    lblSalesmanNameOne.Text = dtAll.Rows[0]["SALESMAN_NAME"].ToString();
                    lblDealerOne.Text = dtAll.Rows[0]["DEALER_NAME"].ToString();
                    

                    lblSalesmanNameTwo.Text = dtAll.Rows[1]["SALESMAN_NAME"].ToString();
                    lblDealerTwo.Text = dtAll.Rows[1]["DEALER_NAME"].ToString();
                    

                    lblSalesmanNameThree.Text = dtAll.Rows[2]["SALESMAN_NAME"].ToString();
                    lblDealerThree.Text = dtAll.Rows[2]["DEALER_NAME"].ToString();


                    lblSalesmanNameFour.Text = dtAll.Rows[3]["SALESMAN_NAME"].ToString();
                    lblDealerFour.Text = dtAll.Rows[3]["DEALER_NAME"].ToString();
                    

                    lblSalesmanNameFive.Text = dtAll.Rows[4]["SALESMAN_NAME"].ToString();
                    lblDealerFive.Text = dtAll.Rows[4]["DEALER_NAME"].ToString();
                    
                }

                using (SqlCommand cmd = new SqlCommand("spGamification_TopListRank", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SEQUENCE_NO", "2");
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();

                if (dtAll.Rows.Count > 0)
                {
                    lblHeader2.Text = dtAll.Rows[0]["Gamification_Name"].ToString();
                    lblSumateraName1.Text = dtAll.Rows[0]["SALESMAN_NAME"].ToString();
                    lblSumateraDealer1.Text = dtAll.Rows[0]["DEALER_NAME"].ToString();
                    

                    lblSumateraName2.Text = dtAll.Rows[1]["SALESMAN_NAME"].ToString();
                    lblSumateraDealer2.Text = dtAll.Rows[1]["DEALER_NAME"].ToString();
                    

                    lblSumateraName3.Text = dtAll.Rows[2]["SALESMAN_NAME"].ToString();
                    lblSumateraDealer3.Text = dtAll.Rows[2]["DEALER_NAME"].ToString();
                    

                }
                else
                {
                    dSumatera.Visible = false;
                }

                using (SqlCommand cmd = new SqlCommand("spGamification_TopListRank", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SEQUENCE_NO", "3");
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();

                if (dtAll.Rows.Count > 0)
                {
                    lblHeader3.Text = dtAll.Rows[0]["Gamification_Name"].ToString();
                    lblJawaName1.Text = dtAll.Rows[0]["SALESMAN_NAME"].ToString();
                    lblJawaDealer1.Text = dtAll.Rows[0]["DEALER_NAME"].ToString();
                    

                    lblJawaName2.Text = dtAll.Rows[1]["SALESMAN_NAME"].ToString();
                    lblJawaDealer2.Text = dtAll.Rows[1]["DEALER_NAME"].ToString();
                    

                    lblJawaName3.Text = dtAll.Rows[2]["SALESMAN_NAME"].ToString();
                    lblJawaDealer3.Text = dtAll.Rows[2]["DEALER_NAME"].ToString();
                    

                }
                else
                {
                    dJawa.Visible = false;
                }

                using (SqlCommand cmd = new SqlCommand("spGamification_TopListRank", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SEQUENCE_NO", "4");
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();

                if (dtAll.Rows.Count > 0)
                {
                    lblHeader4.Text = dtAll.Rows[0]["Gamification_Name"].ToString();
                    lblBaliName1.Text = dtAll.Rows[0]["SALESMAN_NAME"].ToString();
                    lblBaliDealer1.Text = dtAll.Rows[0]["DEALER_NAME"].ToString();
                    

                    lblBaliName2.Text = dtAll.Rows[1]["SALESMAN_NAME"].ToString();
                    lblBaliDealer2.Text = dtAll.Rows[1]["DEALER_NAME"].ToString();
                    

                    lblBaliName3.Text = dtAll.Rows[2]["SALESMAN_NAME"].ToString();
                    lblBaliDealer3.Text = dtAll.Rows[2]["DEALER_NAME"].ToString();
                   

                }
                else
                {
                    dBali.Visible = false;
                }

                using (SqlCommand cmd = new SqlCommand("spGamification_TopListRank", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SEQUENCE_NO", "5");
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();

                if (dtAll.Rows.Count > 0)
                {
                    lblHeader5.Text = dtAll.Rows[0]["Gamification_Name"].ToString();
                    lblReg4Name1.Text = dtAll.Rows[0]["SALESMAN_NAME"].ToString();
                    lblReg4Dealer1.Text = dtAll.Rows[0]["DEALER_NAME"].ToString();
                   

                    lblReg4Name2.Text = dtAll.Rows[1]["SALESMAN_NAME"].ToString();
                    lblReg4Dealer2.Text = dtAll.Rows[1]["DEALER_NAME"].ToString();
                    

                    lblReg4Name3.Text = dtAll.Rows[2]["SALESMAN_NAME"].ToString();
                    lblReg4Dealer3.Text = dtAll.Rows[2]["DEALER_NAME"].ToString();
                    

                }
                else
                {
                    dReg4.Visible = false;
                }

                using (SqlCommand cmd = new SqlCommand("spGamification_TopListRank", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SEQUENCE_NO", "6");
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();

                if (dtAll.Rows.Count > 0)
                {
                    lblHeader6.Text = dtAll.Rows[0]["Gamification_Name"].ToString();
                    lblReg5Name1.Text = dtAll.Rows[0]["SALESMAN_NAME"].ToString();
                    lblReg5Dealer1.Text = dtAll.Rows[0]["DEALER_NAME"].ToString();
                   

                    lblReg5Name2.Text = dtAll.Rows[1]["SALESMAN_NAME"].ToString();
                    lblReg5Dealer2.Text = dtAll.Rows[1]["DEALER_NAME"].ToString();
                   

                    lblReg5Name3.Text = dtAll.Rows[2]["SALESMAN_NAME"].ToString();
                    lblReg5Dealer3.Text = dtAll.Rows[2]["DEALER_NAME"].ToString();
                   
                }
                else
                {
                    dReg5.Visible = false;
                }

                dReg6.Visible = false;
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardHome.aspx");
        }
    }
}