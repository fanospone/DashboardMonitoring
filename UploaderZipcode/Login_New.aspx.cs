using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class Login_New : System.Web.UI.Page
    {
        private static string url;
        private static string RESULTROLE;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                Response.Redirect("401.aspx");
            }
            errorLabel.Visible = false;
            //string IP = GetIPAddress;
            if (!IsPostBack)
            {
                //if (Request.QueryString["Id"] != null && Request.QueryString["Id"] != "")
                //{
                //    //comment untuk drc
                //    try
                //    {
                //        LoginSister();
                //    }
                //    catch (Exception ex)
                //    {
                //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', '" + ex.Message.ToString() + "' ,'error','" + ConfigurationManager.AppSettings["RedirectUrlLogOut"] + "');", true);
                //    }
                //}
                //else
                //{
                //    Response.Redirect(ConfigurationManager.AppSettings["RedirectUrlLogOut"]);
                //}
            }
        }

        public string GetIPAddress
        {
            get
            {
                string IPAddress = "";
                IPHostEntry Host = default(IPHostEntry);
                string Hostname = null;
                Hostname = System.Environment.MachineName;
                Host = Dns.GetHostEntry(Hostname);
                foreach (IPAddress IP in Host.AddressList)
                {
                    if (IP.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                    {
                        IPAddress = Convert.ToString(IP);
                    }
                }
                return IPAddress;
            }
        }

        public string dtSister
        {
            get
            {
                string Usr_Id = "";
                string Id = Request.QueryString["Id"].ToString();
                DataTable dtAll;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringSister"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("spSISTER_DECRYPTION", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ID", Id);
                        con.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                Usr_Id = dr["USER"].ToString();
                            }
                        }
                    }
                    con.Close();
                }
                return Usr_Id;
            }
        }

        public string GetOtp
        {

            get
            {
                string numbers = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                string otp = string.Empty;
                for (int i = 0; i <= 6; i++)
                {
                    string number = string.Empty;
                    do
                    {
                        int index = new Random().Next(0, numbers.Length);
                        number = numbers.ToCharArray()[index].ToString();
                    } while (otp.IndexOf(number) != -1);
                    otp += number;
                }
                return otp;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //bool confirm;
            bool resultlink = true;
            GetAdAuthentication getAdAuthentication = new GetAdAuthentication();
            try
            {
                DataTable dtAll;
                //DataTable dtAll2;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
                        con.Open();
                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());
                    }
                    con.Close();
                }

                //string ResultRole;
                //string linkDomain = ConfigurationManager.AppSettings["AdLink"];
                //resultlink = getAdAuthentication.IsAuthenticated(linkDomain, txtUsername.Text, txtPassword.Text);
                if ( dtAll.Rows.Count > 0 /*&& resultlink == true*/)
                {
                    //ResultRole = dtAll.Rows[0]["ROLES"].ToString();
                    //using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringName"].ConnectionString))
                    //{
                    //    using (SqlCommand cmd = new SqlCommand("spSelfAssessment_INSERT_OTP_NUMBER", con))
                    //    {

                    //        cmd.CommandType = CommandType.StoredProcedure;
                    //        cmd.Parameters.AddWithValue("@OTP_NUMBER", GetOtp);
                    //        cmd.Parameters.AddWithValue("@USERID", txtUsername.Text);
                    //        con.Open();
                    //        using (SqlDataReader dr = cmd.ExecuteReader())
                    //        {
                    //            while (dr.Read())
                    //            {
                    //                if (dr["NOTE"].ToString() == "1")
                    //                {

                    //                }
                    //            }
                    //        }
                    //    }

                        //using (SqlCommand cmd = new SqlCommand("spSelfAssessment_SendEmailOTP", con))
                        //{
                        //    dtAll2 = new DataTable();
                        //    cmd.CommandType = CommandType.StoredProcedure;
                        //    cmd.Parameters.AddWithValue("@USERID", txtUsername.Text);
                        //    dtAll2.Clear();
                        //    dtAll2.Load(cmd.ExecuteReader());

                        //    MailMessage message = new MailMessage();
                        //    SmtpClient smtp = new SmtpClient();
                        //    message.From = new MailAddress("CovidAssessment-noreply@taf.co.id");
                        //    message.To.Add(new MailAddress(dtAll2.Rows[0]["EMAIL"].ToString()));
                        //    message.Subject = "OTP Authentication";
                        //    message.IsBodyHtml = true; //to make message body as html  
                        //    message.Body = dtAll2.Rows[0]["EMAIL_BODY"].ToString();
                        //    //smtp.Port = 587;
                        //    smtp.Host = ConfigurationManager.AppSettings["smtp"]; //for gmail host  
                        //                                                          //smtp.EnableSsl = true;
                        //    smtp.UseDefaultCredentials = false;
                        //    smtp.Credentials = new NetworkCredential("CovidAssessment-noreply@taf.co.id", "");
                        //    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        //    smtp.Send(message);
                        //    con.Close();
                        //}
                    //}

                    RESULTROLE = dtAll.Rows[0]["ROLE"].ToString();

                    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, txtUsername.Text, DateTime.Now,
                                    DateTime.Now.AddMinutes(30), false, RESULTROLE);

                    string encryptedTicket = FormsAuthentication.Encrypt(authTicket); //Encrypt the ticket.

                    //Create a cookie, and then add the encrypted ticket to the cookie as data.
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                    authCookie.Expires = authTicket.Expiration;

                    Response.Cookies.Add(authCookie); //Add the cookie to the outgoing cookies collection.
                    url = "DashboardHome.aspx";
                    

                    if (FormsAuthentication.GetRedirectUrl(txtUsername.Text, false).Contains("default.aspx"))
                    {
                        Response.Redirect(url);
                    }
                    else
                    {
                        Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUsername.Text, false));
                    }
                    //popup.Show();
                }
                else
                {
                    errorLabel.Text = "User and Password do not match";
                    errorLabel.Visible = true;
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Failed Login!', 'User and Password do not match' ,'error','Login.aspx');", true);
                }
            }
            catch (Exception ex)
            {
                errorLabel.Text = "Error authenticating. " + ex.Message;
                errorLabel.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringName"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spSelfAssessment_OTPAuthentication", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@OTP_NUMBER", txtOtpNumber.Text);
                    cmd.Parameters.AddWithValue("@USERID", txtUsername.Text);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            if (dr["NOTE"].ToString() == "1")
                            {
                                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, txtUsername.Text, DateTime.Now,
                                    DateTime.Now.AddMinutes(30), false, RESULTROLE);

                                string encryptedTicket = FormsAuthentication.Encrypt(authTicket); //Encrypt the ticket.

                                //Create a cookie, and then add the encrypted ticket to the cookie as data.
                                HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                                authCookie.Expires = authTicket.Expiration;

                                Response.Cookies.Add(authCookie); //Add the cookie to the outgoing cookies collection.
                                url = "";
                                if (RESULTROLE == "ADMIN")
                                {
                                    url = "SelfAssessment_EntryList.aspx";
                                }
                                else if (RESULTROLE == "USER")
                                {
                                    url = "SelfAssessment_EntryList.aspx";
                                }
                                else if (RESULTROLE == "HR ANALYST")
                                {
                                    url = "SelfAssessment_EntryList.aspx";
                                }

                                if (FormsAuthentication.GetRedirectUrl(txtUsername.Text, false).Contains("default.aspx"))
                                {
                                    Response.Redirect(url);
                                }
                                else
                                {
                                    Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUsername.Text, false));
                                }
                            }
                            else
                            {
                                popup.Hide();
                                errorLabel.Visible = true;
                                errorLabel.Text = "OTP Authentication Code is wrong";
                            }
                        }
                    }
                }
            }
        }
        protected void lnkBtnResend_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringName"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spSelfAssessment_INSERT_OTP_NUMBER", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@OTP_NUMBER", GetOtp);
                    cmd.Parameters.AddWithValue("@USERID", txtUsername.Text);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            if (dr["NOTE"].ToString() == "1")
                            {

                            }
                        }
                    }
                }

                DataTable dtAll2;
                using (SqlCommand cmd = new SqlCommand("spSelfAssessment_SendEmailOTP", con))
                {
                    dtAll2 = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USERID", txtUsername.Text);
                    dtAll2.Clear();
                    dtAll2.Load(cmd.ExecuteReader());

                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient();
                    message.From = new MailAddress("CovidAssessment-noreply@taf.co.id");
                    message.To.Add(new MailAddress(dtAll2.Rows[0]["EMAIL"].ToString()));
                    message.Subject = "OTP Authentication";
                    message.IsBodyHtml = true; //to make message body as html  
                    message.Body = dtAll2.Rows[0]["EMAIL_BODY"].ToString();
                    //smtp.Port = 587;
                    smtp.Host = System.Configuration.ConfigurationManager.AppSettings["smtp"]; //for gmail host  
                                                                                               //smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("CovidAssessment-noreply@taf.co.id", "");
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(message);
                    con.Close();
                }
            }
            popup.Show();
        }
    }
}