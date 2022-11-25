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
    public partial class Dashboard_AR : System.Web.UI.Page
    {
        public string MonthYear
        {
            get
            {
                object value = HttpContext.Current.Session["MonthYear"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["MonthYear"] = value;
            }
        }

        public string OsarValue
        {
            get
            {
                object value = HttpContext.Current.Session["OsarValue"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["OsarValue"] = value;
            }
        }
        public string Balance7
        {
            get
            {
                object value = HttpContext.Current.Session["Balance7"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["Balance7"] = value;
            }
        }
        public string Balance30
        {
            get
            {
                object value = HttpContext.Current.Session["Balance30"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["Balance30"] = value;
            }
        }

        public string Balance60
        {
            get
            {
                object value = HttpContext.Current.Session["Balance60"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["Balance60"] = value;
            }
        }

        public string Balance90
        {
            get
            {
                object value = HttpContext.Current.Session["Balance90"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["Balance90"] = value;
            }
        }

        public string BalanceTarget7
        {
            get
            {
                object value = HttpContext.Current.Session["BalanceTarget7"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["BalanceTarget7"] = value;
            }
        }

        public string BalanceTarget30
        {
            get
            {
                object value = HttpContext.Current.Session["BalanceTarget30"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["BalanceTarget30"] = value;
            }
        }

        public string BalanceTarget60
        {
            get
            {
                object value = HttpContext.Current.Session["BalanceTarget60"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["BalanceTarget60"] = value;
            }
        }

        public string BalanceTarget90
        {
            get
            {
                object value = HttpContext.Current.Session["BalanceTarget90"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["BalanceTarget90"] = value;
            }
        }

        public double TotalOsar
        {
            get
            {
                double value = ((double)HttpContext.Current.Session["TotalOsar"]);
                return value == 0 ? 0 : (double)value;
            }
            set
            {
                HttpContext.Current.Session["TotalOsar"] = value;
            }
        }

        public bool ChartVisible
        {
            get
            {
                object value = HttpContext.Current.Session["ChartVisible"];
                return value == null ? false : (bool)value;
            }
            set
            {
                HttpContext.Current.Session["ChartVisible"] = value;
            }
        }

        DataTable dtAll;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Getdata();
                GetArea();
                GetOffice();
                lblDate.Text = "LAST STATUS - " + DateTime.Now.AddDays(-1).ToString("dd - MMMM - yyyy");

            }
        }

        protected void Getdata()
        {
            MonthYear = "";
            OsarValue = "";
            Balance7 = "";
            Balance30 = "";
            Balance60 = "";
            Balance90 = "";
            BalanceTarget7 = "";
            BalanceTarget30 = "";
            BalanceTarget60 = "";
            BalanceTarget90 = "";
            TotalOsar = 0;
            Session["RegionId"] = 0;
            ChartVisible = true;
            double Osar7Dif = 0;
            double Osar30Dif = 0;
            double Osar60Dif = 0;
            double Osar90Dif = 0;
            double Osar120Dif = 0;


            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_BalanceSummary", con))
                {
                    Session["RegionId"] = 0;
                    if (ddlCategory.SelectedValue == "Area")
                    {
                        Session["RegionId"] = Convert.ToInt32(ddlArea.SelectedValue);
                    }
                    else if (ddlCategory.SelectedValue == "Handling")
                    {
                        Session["RegionId"] = Convert.ToInt32(ddlHandling.SelectedValue);
                    }

                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PERIODTYPE", rblPeriod.SelectedValue);
                    cmd.Parameters.AddWithValue("@CATEGORY", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@REGION_ID", Session["RegionId"]);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                    if (dtAll.Rows.Count > 0)
                    {
                        for (int i = 0; i < dtAll.Rows.Count; i++)
                        {
                            MonthYear += "'" + dtAll.Rows[i]["MONTH"].ToString() + "'";
                            if (i + 1 < dtAll.Rows.Count)
                            {
                                MonthYear += ",";
                            }
                        }
                        int a = 0;
                        for (a = 0; a < dtAll.Rows.Count; a++)
                        {
                            OsarValue += dtAll.Rows[a]["OSAR2"].ToString().Replace(",", ".");
                            if (a + 1 < dtAll.Rows.Count)
                            {
                                OsarValue += ",";                             
                            }
                        }
                        //lblOsarTotal.Text = "OSAR: " + string.Format("{0:0,0.00}", TotalOsar).ToString();
                        TotalOsar = Convert.ToDouble(dtAll.Rows[a-1]["OSAR"].ToString().Replace(",", "."));
                        lblOsarTotal.Text = "OSAR " + string.Format("{0:0,0}", (TotalOsar / 1000000)).ToString() + " Mio"; 
                        for (int i = 0; i < dtAll.Rows.Count; i++)
                        {
                            Balance7 += dtAll.Rows[i]["BALANCE7"].ToString().Replace(",", ".");
                            if (i + 1 < dtAll.Rows.Count)
                            {
                                Balance7 += ",";
                            }
                        }

                        for (int i = 0; i < dtAll.Rows.Count; i++)
                        {
                            Balance30 += dtAll.Rows[i]["BALANCE30"].ToString().Replace(",", ".");
                            if (i + 1 < dtAll.Rows.Count)
                            {
                                Balance30 += ",";
                            }
                        }
                        for (int i = 0; i < dtAll.Rows.Count; i++)
                        {
                            Balance60 += dtAll.Rows[i]["BALANCE60"].ToString().Replace(",", ".");
                            if (i + 1 < dtAll.Rows.Count)
                            {
                                Balance60 += ",";
                            }
                        }
                        for (int i = 0; i < dtAll.Rows.Count; i++)
                        {
                            Balance90 += dtAll.Rows[i]["BALANCE90"].ToString().Replace(",", ".");
                            if (i + 1 < dtAll.Rows.Count)
                            {
                                Balance90 += ",";
                            }
                        }
                    }
                }
                using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_RepoInvSummary", con))
                {
                    Session["RegionId"] = 0;
                    if (ddlCategory.SelectedValue == "Area")
                    {
                        Session["RegionId"] = Convert.ToInt32(ddlArea.SelectedValue);
                    }
                    else if (ddlCategory.SelectedValue == "Handling")
                    {
                        Session["RegionId"] = Convert.ToInt32(ddlHandling.SelectedValue);
                    }

                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CATEGORY", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@REGION_ID", Session["RegionId"]);
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                    if (dtAll.Rows.Count > 0)
                    {
                        lblInvAsset.Text = dtAll.Rows[0]["INVENTORY_ASSET"].ToString();
                        lblTotalRepo.Text = dtAll.Rows[0]["REPO"].ToString();
                        lblBalance7Total.Text = dtAll.Rows[0]["BALANCE7"].ToString() + "%";
                        lblBalance30Total.Text = dtAll.Rows[0]["BALANCE30"].ToString() + "%";
                        lblBalance60Total.Text = dtAll.Rows[0]["BALANCE60"].ToString() + "%";
                        lblBalance90Total.Text = dtAll.Rows[0]["BALANCE90"].ToString() + "%";
                        lblBalance120Total.Text = dtAll.Rows[0]["BALANCE120"].ToString() + "%";
                        lblOsar7.Text = string.Format("{0:0,0}",dtAll.Rows[0]["OSAR7"]) + " Mio";
                        lblOsar30.Text = string.Format("{0:0,0}", dtAll.Rows[0]["OSAR30"]) + " Mio";
                        lblOsar60.Text = string.Format("{0:0,0}", dtAll.Rows[0]["OSAR60"]) + " Mio";
                        lblOsar90.Text = string.Format("{0:0,0}", dtAll.Rows[0]["OSAR90"]) + " Mio";
                        lblOsar120.Text = string.Format("{0:0,0}", dtAll.Rows[0]["OSAR120"]) + " Mio";

                        if (Convert.ToInt64(dtAll.Rows[0]["REPO"]) > Convert.ToInt64(dtAll.Rows[1]["REPO"]))
                        {
                            ImgGreenRepo.Visible = true;
                            ImgRedRepo.Visible = false;
                            ImgYellowRepo.Visible = false;
                            lblCountRepo.Text = Convert.ToString(Convert.ToInt64(dtAll.Rows[0]["REPO"]) - Convert.ToInt64(dtAll.Rows[1]["REPO"]));
                        }
                        else if (Convert.ToInt64(dtAll.Rows[0]["REPO"]) < Convert.ToInt64(dtAll.Rows[1]["REPO"]))
                        {
                            ImgGreenRepo.Visible = false;
                            ImgRedRepo.Visible = true;
                            ImgYellowRepo.Visible = false;
                            lblCountRepo.Text = Convert.ToString(Convert.ToInt64(dtAll.Rows[1]["REPO"]) - Convert.ToInt64(dtAll.Rows[0]["REPO"]));
                        }
                        else
                        {
                            ImgGreenRepo.Visible = false;
                            ImgRedRepo.Visible = false;
                            ImgYellowRepo.Visible = true;
                            lblCountRepo.Text = "0";
                        }

                        if (Convert.ToInt64(dtAll.Rows[0]["INVENTORY_ASSET"]) > Convert.ToInt64(dtAll.Rows[1]["INVENTORY_ASSET"]))
                        {
                            ImgGreenInv.Visible = true;
                            ImgRedInv.Visible = false;
                            ImgYellowInv.Visible = false;
                            lblCountInv.Text = Convert.ToString(Convert.ToInt64(dtAll.Rows[0]["INVENTORY_ASSET"]) - Convert.ToInt64(dtAll.Rows[1]["INVENTORY_ASSET"]));
                        }
                        else if (Convert.ToInt64(dtAll.Rows[0]["INVENTORY_ASSET"]) < Convert.ToInt64(dtAll.Rows[1]["INVENTORY_ASSET"]))
                        {
                            ImgGreenInv.Visible = false;
                            ImgRedInv.Visible = true;
                            ImgYellowInv.Visible = false;
                            lblCountInv.Text = Convert.ToString(Convert.ToInt64(dtAll.Rows[1]["INVENTORY_ASSET"]) - Convert.ToInt64(dtAll.Rows[0]["INVENTORY_ASSET"]));
                        }
                        else
                        {
                            ImgGreenInv.Visible = false;
                            ImgRedInv.Visible = false;
                            ImgYellowInv.Visible = true;
                            lblCountInv.Text = "0";
                        }

                        if (Convert.ToDecimal(dtAll.Rows[0]["OSAR7"]) > Convert.ToDecimal(dtAll.Rows[1]["OSAR7"]))
                        {
                            Osar7Dif = Convert.ToDouble(dtAll.Rows[0]["OSAR7"]) - Convert.ToDouble(dtAll.Rows[1]["OSAR7"]);
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["OSAR7"]) < Convert.ToDecimal(dtAll.Rows[1]["OSAR7"]))
                        {
                            Osar7Dif = Convert.ToDouble(dtAll.Rows[1]["OSAR7"]) - Convert.ToDouble(dtAll.Rows[0]["OSAR7"]);
                        }
                        else
                        {
                            Osar7Dif = 0.00;
                        }

                        lblOsar7Dif.Text = string.Format("{0:0,0}", Osar7Dif) + " Mio";

                        if (Convert.ToDecimal(dtAll.Rows[0]["OSAR30"]) > Convert.ToDecimal(dtAll.Rows[1]["OSAR30"]))
                        {
                            Osar30Dif = Convert.ToDouble(dtAll.Rows[0]["OSAR30"]) - Convert.ToDouble(dtAll.Rows[1]["OSAR30"]);
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["OSAR30"]) < Convert.ToDecimal(dtAll.Rows[1]["OSAR30"]))
                        {
                            Osar30Dif = Convert.ToDouble(dtAll.Rows[1]["OSAR30"]) - Convert.ToDouble(dtAll.Rows[0]["OSAR30"]);
                        }
                        else
                        {
                            Osar30Dif = 0.00;
                        }

                        lblOsar30Dif.Text = string.Format("{0:0,0}", Osar30Dif) + " Mio";

                        if (Convert.ToDecimal(dtAll.Rows[0]["OSAR60"]) > Convert.ToDecimal(dtAll.Rows[1]["OSAR60"]))
                        {
                            Osar60Dif = Convert.ToDouble(dtAll.Rows[0]["OSAR60"]) - Convert.ToDouble(dtAll.Rows[1]["OSAR60"]);
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["OSAR60"]) < Convert.ToDecimal(dtAll.Rows[1]["OSAR60"]))
                        {
                            Osar60Dif = Convert.ToDouble(dtAll.Rows[1]["OSAR60"]) - Convert.ToDouble(dtAll.Rows[0]["OSAR60"]);
                        }
                        else
                        {
                            Osar60Dif = 0.00;
                        }

                        lblOsar60Dif.Text = string.Format("{0:0,0}", Osar60Dif) + " Mio";

                        if (Convert.ToDecimal(dtAll.Rows[0]["OSAR90"]) > Convert.ToDecimal(dtAll.Rows[1]["OSAR90"]))
                        {
                            Osar90Dif = Convert.ToDouble(dtAll.Rows[0]["OSAR90"]) - Convert.ToDouble(dtAll.Rows[1]["OSAR90"]);
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["OSAR90"]) < Convert.ToDecimal(dtAll.Rows[1]["OSAR90"]))
                        {
                            Osar90Dif = Convert.ToDouble(dtAll.Rows[1]["OSAR90"]) - Convert.ToDouble(dtAll.Rows[0]["OSAR90"]);
                        }
                        else
                        {
                            Osar90Dif = 0.00;
                        }

                        lblOsar90Dif.Text = string.Format("{0:0,0}", Osar90Dif) + " Mio";

                        if (Convert.ToDecimal(dtAll.Rows[0]["OSAR120"]) > Convert.ToDecimal(dtAll.Rows[1]["OSAR120"]))
                        {
                            Osar120Dif = Convert.ToDouble(dtAll.Rows[0]["OSAR120"]) - Convert.ToDouble(dtAll.Rows[1]["OSAR120"]);
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["OSAR120"]) < Convert.ToDecimal(dtAll.Rows[1]["OSAR120"]))
                        {
                            Osar120Dif = Convert.ToDouble(dtAll.Rows[1]["OSAR120"]) - Convert.ToDouble(dtAll.Rows[0]["OSAR120"]);
                        }
                        else
                        {
                            Osar120Dif = 0.00;
                        }

                        lblOsar120Dif.Text = string.Format("{0:0,0}", Osar120Dif) + " Mio";

                        if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE7"]) > Convert.ToDecimal(dtAll.Rows[1]["BALANCE7"]))
                        {
                            ImgOsar7GreenTriangle.Visible = false;
                            ImgOsar7RedTriangle.Visible = true;
                            ImgOsar7YellowEquals.Visible = false;
                            lblBalance7Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[0]["BALANCE7"]) - Convert.ToDecimal(dtAll.Rows[1]["BALANCE7"]));
                            dBalance7.Style.Add("background-color", "bisque");
                            lblBalance7Total.Style.Add("color", "Red");


                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE7"]) < Convert.ToDecimal(dtAll.Rows[1]["BALANCE7"]))
                        {
                            ImgOsar7GreenTriangle.Visible = true;
                            ImgOsar7RedTriangle.Visible = false;
                            ImgOsar7YellowEquals.Visible = false;
                            lblBalance7Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[1]["BALANCE7"]) - Convert.ToDecimal(dtAll.Rows[0]["BALANCE7"]));
                            dBalance7.Style.Add("background-color", "aliceblue");
                            lblBalance7Total.Style.Add("color", "darkblue");

                        }
                        else
                        {
                            ImgOsar7GreenTriangle.Visible = false;
                            ImgOsar7RedTriangle.Visible = false;
                            ImgOsar7YellowEquals.Visible = true;
                            lblBalance7Dif.Text = "0.00";
                            dBalance7.Style.Add("background-color", "rgb(255,255,115)");
                            lblBalance7Total.Style.Add("color", "goldenrod");
                        }

                        if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE30"]) > Convert.ToDecimal(dtAll.Rows[1]["BALANCE30"]))
                        {
                            ImgOsar30GreenTriangle.Visible = false;
                            ImgOsar30RedTriangle.Visible = true;
                            ImgOsar30YellowEquals.Visible = false;
                            lblBalance30Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[0]["BALANCE30"]) - Convert.ToDecimal(dtAll.Rows[1]["BALANCE30"]));
                            dBalance30.Style.Add("background-color", "bisque");
                            lblBalance30Total.Style.Add("color", "Red");
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE30"]) < Convert.ToDecimal(dtAll.Rows[1]["BALANCE30"]))
                        {
                            ImgOsar30GreenTriangle.Visible = true;
                            ImgOsar30RedTriangle.Visible = false;
                            ImgOsar30YellowEquals.Visible = false;
                            lblBalance30Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[1]["BALANCE30"]) - Convert.ToDecimal(dtAll.Rows[0]["BALANCE30"]));
                            dBalance30.Style.Add("background-color", "aliceblue");
                            lblBalance30Total.Style.Add("color", "darkblue");
                        }
                        else
                        {
                            ImgOsar30GreenTriangle.Visible = false;
                            ImgOsar30RedTriangle.Visible = false;
                            ImgOsar30YellowEquals.Visible = true;
                            lblBalance30Dif.Text = "0.00";
                            dBalance30.Style.Add("background-color", "rgb(255,255,115)");
                            lblBalance30Total.Style.Add("color", "goldenrod");
                        }

                        if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE60"]) > Convert.ToDecimal(dtAll.Rows[1]["BALANCE60"]))
                        {
                            ImgOsar60GreenTriangle.Visible = false;
                            ImgOsar60RedTriangle.Visible = true;
                            ImgOsar60YellowEquals.Visible = false;
                            lblBalance60Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[0]["BALANCE60"]) - Convert.ToDecimal(dtAll.Rows[1]["BALANCE60"]));
                            dBalance60.Style.Add("background-color", "bisque");
                            lblBalance60Total.Style.Add("color", "Red");
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE60"]) < Convert.ToDecimal(dtAll.Rows[1]["BALANCE60"]))
                        {
                            ImgOsar60GreenTriangle.Visible = true;
                            ImgOsar60RedTriangle.Visible = false;
                            ImgOsar60YellowEquals.Visible = false;
                            lblBalance60Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[1]["BALANCE60"]) - Convert.ToDecimal(dtAll.Rows[0]["BALANCE60"]));
                            dBalance60.Style.Add("background-color", "aliceblue");
                            lblBalance60Total.Style.Add("color", "darkblue");
                        }
                        else
                        {
                            ImgOsar60GreenTriangle.Visible = false;
                            ImgOsar60RedTriangle.Visible = false;
                            ImgOsar60YellowEquals.Visible = true;
                            lblBalance60Dif.Text = "0.00";
                            dBalance60.Style.Add("background-color", "rgb(255,255,115)");
                            lblBalance60Total.Style.Add("color", "goldenrod");
                        }

                        if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE90"]) > Convert.ToDecimal(dtAll.Rows[1]["BALANCE90"]))
                        {
                            ImgOsar90GreenTriangle.Visible = false;
                            ImgOsar90RedTriangle.Visible = true;
                            ImgOsar90YellowEquals.Visible = false;
                            lblBalance90Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[0]["BALANCE90"]) - Convert.ToDecimal(dtAll.Rows[1]["BALANCE90"]));
                            dBalance90.Style.Add("background-color", "bisque");
                            lblBalance90Total.Style.Add("color", "Red");
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE90"]) < Convert.ToDecimal(dtAll.Rows[1]["BALANCE90"]))
                        {
                            ImgOsar90GreenTriangle.Visible = true;
                            ImgOsar90RedTriangle.Visible = false;
                            ImgOsar90YellowEquals.Visible = false;
                            lblBalance90Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[1]["BALANCE90"]) - Convert.ToDecimal(dtAll.Rows[0]["BALANCE90"]));
                            dBalance90.Style.Add("background-color", "aliceblue");
                            lblBalance90Total.Style.Add("color", "darkblue");
                        }
                        else
                        {
                            ImgOsar90GreenTriangle.Visible = false;
                            ImgOsar90RedTriangle.Visible = false;
                            ImgOsar90YellowEquals.Visible = true;
                            lblBalance90Dif.Text = "0.00";
                            dBalance90.Style.Add("background-color", "rgb(255,255,115)");
                            lblBalance90Total.Style.Add("color", "goldenrod");
                        }

                        if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE120"]) > Convert.ToDecimal(dtAll.Rows[1]["BALANCE120"]))
                        {
                            ImgOsar120GreenTriangle.Visible = false;
                            ImgOsar120RedTriangle.Visible = true;
                            ImgOsar120YellowEquals.Visible = false;
                            lblBalance120Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[0]["BALANCE120"]) - Convert.ToDecimal(dtAll.Rows[1]["BALANCE120"]));
                            dBalance120.Style.Add("background-color", "bisque");
                            lblBalance120Total.Style.Add("color", "Red");
                        }
                        else if (Convert.ToDecimal(dtAll.Rows[0]["BALANCE120"]) < Convert.ToDecimal(dtAll.Rows[1]["BALANCE120"]))
                        {
                            ImgOsar120GreenTriangle.Visible = true;
                            ImgOsar120RedTriangle.Visible = false;
                            ImgOsar120YellowEquals.Visible = false;
                            lblBalance120Dif.Text = Convert.ToString(Convert.ToDecimal(dtAll.Rows[1]["BALANCE120"]) - Convert.ToDecimal(dtAll.Rows[0]["BALANCE120"]));
                            dBalance120.Style.Add("background-color", "aliceblue");
                            lblBalance120Total.Style.Add("color", "darkblue");
                        }
                        else
                        {
                            ImgOsar120GreenTriangle.Visible = false;
                            ImgOsar120RedTriangle.Visible = false;
                            ImgOsar120YellowEquals.Visible = true;
                            lblBalance120Dif.Text = "0.00";
                            dBalance120.Style.Add("background-color", "rgb(255,255,115)");
                            lblBalance120Total.Style.Add("color", "goldenrod");
                        }
                    }
                }

                using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_RepoTargetChart", con))
                {
                    Session["RegionId"] = 0;
                    if (ddlCategory.SelectedValue == "Area")
                    {
                        Session["RegionId"] = Convert.ToInt32(ddlArea.SelectedValue);
                    }
                    else if (ddlCategory.SelectedValue == "Handling")
                    {
                        Session["RegionId"] = Convert.ToInt32(ddlHandling.SelectedValue);
                    }

                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CATEGORY", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@REGION_ID", Session["RegionId"]);
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());

                    if (dtAll.Rows.Count > 0)
                    {
                        lblTargetRepo.Text = dtAll.Rows[0]["TARGET"].ToString();
                    }
                    else
                    {
                        lblTargetRepo.Text = "0";
                    }
                }
                if (rblPeriod.SelectedValue == "Monthly")
                {
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_BalanceChart", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CATEGORY", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@BALANCE", "7");
                        cmd.Parameters.AddWithValue("@REGION_ID", Session["RegionId"]);

                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());

                        if (dtAll.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtAll.Rows.Count; i++)
                            {
                                BalanceTarget7 += dtAll.Rows[i]["TARGET"].ToString().Replace(",", ".");
                                if (i + 1 < dtAll.Rows.Count)
                                {
                                    BalanceTarget7 += ",";
                                }
                            }
                        }
                    }


                    using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_BalanceChart", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CATEGORY", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@BALANCE", "30");
                        cmd.Parameters.AddWithValue("@REGION_ID", Session["RegionId"]);

                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());

                        if (dtAll.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtAll.Rows.Count; i++)
                            {
                                BalanceTarget30 += dtAll.Rows[i]["TARGET"].ToString().Replace(",", ".");
                                if (i + 1 < dtAll.Rows.Count)
                                {
                                    BalanceTarget30 += ",";
                                }
                            }
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_BalanceChart", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CATEGORY", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@BALANCE", "60");
                        cmd.Parameters.AddWithValue("@REGION_ID", Session["RegionId"]);

                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());

                        if (dtAll.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtAll.Rows.Count; i++)
                            {
                                BalanceTarget60 += dtAll.Rows[i]["TARGET"].ToString().Replace(",", ".");
                                if (i + 1 < dtAll.Rows.Count)
                                {
                                    BalanceTarget60 += ",";
                                }
                            }
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_BalanceChart", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CATEGORY", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@BALANCE", "90");
                        cmd.Parameters.AddWithValue("@REGION_ID", Session["RegionId"]);

                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());

                        if (dtAll.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtAll.Rows.Count; i++)
                            {
                                BalanceTarget90 += dtAll.Rows[i]["TARGET"].ToString().Replace(",", ".");
                                if (i + 1 < dtAll.Rows.Count)
                                {
                                    BalanceTarget90 += ",";
                                }
                            }
                        }
                    }
                }
                con.Close();
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "National")
            {
                ddlArea.Visible = false;
                ddlHandling.Visible = false;
                Getdata();
            }
            else if (ddlCategory.SelectedValue == "Area")
            {
                ddlArea.Visible = true;
                ddlHandling.Visible = false;
                Getdata();
            }
            else
            {
                ddlArea.Visible = false;
                ddlHandling.Visible = true;
                Getdata();
            }
        }
        protected void GetArea()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_REF_AREA_AR", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    ddlArea.DataSource = dtAll;
                    ddlArea.DataValueField = "AREA_ID";
                    ddlArea.DataTextField = "AREA_NAME";
                    ddlArea.DataBind();
                }
            }
        }
        protected void GetOffice()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARDAR_OFFICE_AR", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    ddlHandling.DataSource = dtAll;
                    ddlHandling.DataValueField = "REF_OFFICE_ID";
                    ddlHandling.DataTextField = "OFFICE_NAME";
                    ddlHandling.DataBind();
                }
            }
        }

        protected void rblPeriod_SelectedIndexChanged(object sender, EventArgs e)
        {
            Getdata();
        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            Getdata();
        }

        protected void ddlHandling_SelectedIndexChanged(object sender, EventArgs e)
        {
            Getdata();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashboardHome.aspx");
        }
    }
}