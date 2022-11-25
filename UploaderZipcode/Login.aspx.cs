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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                // This is an unauthorized, authenticated request... 
                Response.Redirect("401.aspx");
                
            }
            if (!IsPostBack)
            {
                txtUsername.Attributes.Add("Autocomplete", "off");
                txtOtpNumber.Attributes.Add("Autocomplete", "off");
            }
            txtUsername.MaxLength = 10;
            txtPassword.MaxLength = 30;
            txtOtpNumber.MaxLength = 6;
        }

        private string AvoidSQLInj(string keys)
        {
            string getkeys;
            getkeys = keys.ToUpper();
            getkeys = getkeys.Replace("'", "");
            getkeys = getkeys.Replace("--", "");
            getkeys = getkeys.Replace("INSERT", "");
            getkeys = getkeys.Replace("UPDATE", "");
            getkeys = getkeys.Replace("DELETE", "");
            getkeys = getkeys.Replace("SELECT", "");
            getkeys = getkeys.Replace("JOIN", "");
            return getkeys;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (ConfigurationManager.AppSettings["IsUAT"].ToString() == "1")
                LoginWithOTP();
            else
                LoginWithoutOTP();
        }


        private void loginSister(string id)
        {
            DataTable dtData = dtSister(id);
            if (dtData != null && dtData.Rows.Count > 0)
            {
                string User = dtData.Rows[0]["USER"].ToString();

                //string isuat = System.Configuration.ConfigurationManager.AppSettings["isuat"];
                try
                {
                    DataTable dtAll;
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringUPZIP"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("spUPZIP_GET_USER", con))
                        {
                            dtAll = new DataTable();
                            cmd.CommandType = CommandType.StoredProcedure;
                            //cmd.Parameters.AddWithValue("@USERID", User);
                            cmd.Parameters.AddWithValue("@USERNAME", User);
                            con.Open();
                            dtAll.Clear();
                            dtAll.Load(cmd.ExecuteReader());
                        }
                        con.Close();
                    }
                    int isreg = dtAll.Rows.Count;

                    if (isreg > 0)
                    {
                        FormsAuthenticationTicket authTicket;

                        authTicket = new FormsAuthenticationTicket(1,
                                  User, DateTime.Now, DateTime.Now.AddMinutes(60), false, dtAll.Rows[0]["ROLE"].ToString());

                        //Encrypt the ticket.
                        string encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                        //Create a cookie, and then add the encrypted ticket to the cookie as data.
                        HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                        authCookie.Expires = authTicket.Expiration;

                        //Add the cookie to the outgoing cookies collection.
                        Response.Cookies.Add(authCookie);

                        string url = "Inquiry.aspx";

                        //if (FormsAuthentication.GetRedirectUrl(User, false).Contains("default.aspx"))
                        Response.Redirect(url);
                        //else
                        //    Response.Redirect(FormsAuthentication.GetRedirectUrl(User, false));


                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', 'Authentication did not succeed. Check user name and password.' ,'error','" + ConfigurationManager.AppSettings["RedirectUrlIndex"] + "');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', " + ex.Message + " ,'error','" + ConfigurationManager.AppSettings["RedirectUrlIndex"] + "');", true);
                }

            }
            else
            {
                Response.Redirect(ConfigurationManager.AppSettings["RedirectUrlLogOut"]);
            }
        }


        private static DataTable dtSister(string id)
        {
            DataTable dtAll;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SISTER_ConnString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spSISTER_DECRYPTION", con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID", id);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();
            }

            return dtAll;
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string userId = AvoidSQLInj(txtUsername.Text);
            string otp = AvoidSQLInj(txtOtpNumber.Text);
            try
            {
                DataTable dtAll = new DataTable();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("spDASHBOARD_OTPAuthentication", con))
                    {
                        dtAll = new DataTable();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@OTP_NUMBER", otp);
                        cmd.Parameters.AddWithValue("@USERNAME", userId);
                        con.Open();
                        dtAll.Clear();
                        dtAll.Load(cmd.ExecuteReader());
                    }
                }
                if (dtAll.Rows[0]["NOTE"].ToString() == "1")
                {
                    string role = dtAll.Rows[0]["ROLE"].ToString();
                    FormsAuthentication.SetAuthCookie(userId, false);
                    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1,
                    userId, DateTime.Now, DateTime.Now.AddMinutes(60), false, dtAll.Rows[0]["ROLE"].ToString());

                    //Encrypt the ticket.
                    string encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                    //Create a cookie, and then add the encrypted ticket to the cookie as data.
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                    authCookie.Expires = authTicket.Expiration;

                    //Add the cookie to the outgoing cookies collection.
                    Response.Cookies.Add(authCookie);

                    string url = "DashboardHome.aspx";
                    //if (dtAll.Rows[0]["ACCESS"].ToString().Equals("TAFS")) url = "User.aspx";
                    //You can redirect now.
                    if (FormsAuthentication.GetRedirectUrl(userId, false).Contains("default.aspx"))
                    {
                        Response.Redirect(url);
                    }
                    else
                    {
                        Response.Redirect(FormsAuthentication.GetRedirectUrl(userId, false));
                    }

                }
                else
                {
                    popup.Hide();
                    string msg = "OTP Authentication Code is wrong.";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','Login.aspx');", true);
                    //errorLabel.Visible = true;
                    //errorLabel.Text = "OTP Authentication Code is wrong";
                }
            }
            catch (Exception err)
            {
                string msg = "Something went wrong, contact your Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + err.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','Login.aspx');", true);
            }
        }

        protected void lnkBtnResend_Click(object sender, EventArgs e)
        {
            string userId = AvoidSQLInj(txtUsername.Text);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_INSERT_OTP_NUMBER", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@OTP_NUMBER", GetOtp);
                    cmd.Parameters.AddWithValue("@USERNAME", userId);
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
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_SendEmailOTP", con))
                {
                    dtAll2 = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USERNAME", userId);
                    dtAll2.Clear();
                    dtAll2.Load(cmd.ExecuteReader());

                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient();
                    message.From = new MailAddress("noreply@taf.co.id");
                    message.To.Add(new MailAddress(dtAll2.Rows[0]["EMAIL"].ToString()));
                    message.Subject = "OTP Authentication";
                    message.IsBodyHtml = true; //to make message body as html  
                    message.Body = dtAll2.Rows[0]["EMAIL_BODY"].ToString();
                    //smtp.Port = 587;
                    smtp.Host = System.Configuration.ConfigurationManager.AppSettings["smtp"]; //for gmail host  
                                                                                               //smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("noreply@taf.co.id", "");
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(message);
                    con.Close();
                }
            }
            popup.Show();
        }
        private void LoginWithOTP()
        {
            string userId = AvoidSQLInj(txtUsername.Text);
            string linkDomain = ConfigurationManager.AppSettings["AdLink"];
            string domain = ConfigurationManager.AppSettings["AdLink"];
            GetAdAuthentication getAdAuthentication = new GetAdAuthentication();
            bool adAuth = getAdAuthentication.IsAuthenticatedPost(domain, userId, txtPassword.Text);
            if (adAuth)
            {
                try
                {
                    DataTable dtAll;
                    DataTable dtAll2;
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                        {
                            dtAll = new DataTable();
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@USERNAME", userId);
                            con.Open();
                            dtAll.Clear();
                            dtAll.Load(cmd.ExecuteReader());

                            //Session["ROLE"] = dtAll.Rows[0]["ROLE"].ToString();
                            //Session["USER"] = dtAll.Rows[0]["USERNAME"].ToString();
                            //Session["BRANCH_CODE"] = dtAll.Rows[0]["OFFICE_CODE"].ToString();
                        }
                        con.Close();
                    }


                    if (dtAll.Rows.Count > 0 && getAdAuthentication.IsAuthenticatedPost(linkDomain, txtUsername.Text, txtPassword.Text) == true)

                    //if (dtAll.Rows.Count > 0)
                    {

                        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                        {
                            using (SqlCommand cmd = new SqlCommand("spDASHBOARD_INSERT_OTP_NUMBER", con))
                            {

                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@OTP_NUMBER", GetOtp);
                                cmd.Parameters.AddWithValue("@USERNAME", userId);
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


                            using (SqlCommand cmd = new SqlCommand("spDASHBOARD_SendEmailOTP", con))
                            {
                                dtAll2 = new DataTable();
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@USERNAME", userId);
                                dtAll2.Clear();
                                dtAll2.Load(cmd.ExecuteReader());

                                MailMessage message = new MailMessage();
                                SmtpClient smtp = new SmtpClient();
                                message.From = new MailAddress("noreply@taf.co.id");
                                message.To.Add(new MailAddress(dtAll2.Rows[0]["EMAIL"].ToString()));
                                message.Subject = "Dashboard OTP Authentication";
                                message.IsBodyHtml = true; //to make message body as html  
                                message.Body = dtAll2.Rows[0]["EMAIL_BODY"].ToString();
                                //smtp.Port = 587;
                                smtp.Host = System.Configuration.ConfigurationManager.AppSettings["smtp"]; //for gmail host  
                                                                                                           //smtp.EnableSsl = true;
                                smtp.UseDefaultCredentials = false;
                                smtp.Credentials = new NetworkCredential("noreply@taf.co.id", "");
                                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                                smtp.Send(message);
                                con.Close();
                            }
                        }

                        popup.Show();

                    }
                    else
                    {
                        string msg = "User do not Register";
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \'" + msg + "\','error','Login.aspx');", true);
                    }
                }
                catch (Exception err)
                {
                    string msg = "Something went wrong, contact your Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + err.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','Login.aspx');", true);
                }
            }
            else
            {
                string msg = "Authentication did not succeed. Check user name and password.";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \'" + msg + "\','error','Login.aspx');", true);
            }
        }

        private void LoginWithoutOTP()
        {
            string userId = AvoidSQLInj(txtUsername.Text);
            string linkDomain = ConfigurationManager.AppSettings["AdLink"];
            string domain = ConfigurationManager.AppSettings["AdLink"];
            GetAdAuthentication getAdAuthentication = new GetAdAuthentication();
            bool adAuth = getAdAuthentication.IsAuthenticatedPost(domain, userId, txtPassword.Text);
            if (adAuth)
            {
                try
                {
                    DataTable dtAll;
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                        {
                            dtAll = new DataTable();
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@USERNAME", userId);
                            con.Open();
                            dtAll.Clear();
                            dtAll.Load(cmd.ExecuteReader());
                        }
                        con.Close();
                    }


                    if (dtAll.Rows.Count > 0 && getAdAuthentication.IsAuthenticatedPost(linkDomain, txtUsername.Text, txtPassword.Text) == true)
                    {
                        string role = "Admin";//dtAll.Rows[0]["ROLE"].ToString();
                        FormsAuthentication.SetAuthCookie(userId, false);
                        FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1,
                        userId, DateTime.Now, DateTime.Now.AddMinutes(60), false, role);

                        //Encrypt the ticket.
                        string encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                        //Create a cookie, and then add the encrypted ticket to the cookie as data.
                        HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                        authCookie.Expires = authTicket.Expiration;

                        //Add the cookie to the outgoing cookies collection.
                        Response.Cookies.Add(authCookie);

                        string url = "DashboardHome.aspx";
                        //if (dtAll.Rows[0]["ACCESS"].ToString().Equals("TAFS")) url = "User.aspx";
                        //You can redirect now.
                        if (FormsAuthentication.GetRedirectUrl(userId, false).Contains("default.aspx"))
                        {
                            Response.Redirect(url);
                        }
                        else
                        {
                            Response.Redirect(FormsAuthentication.GetRedirectUrl(userId, false));
                        }

                    }
                    else
                    {
                        string msg = "User do not Register";
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \'" + msg + "\','error','Login.aspx');", true);
                    }
                }
                catch (Exception err)
                {
                    string msg = "Something went wrong, contact your Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + err.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','Login.aspx');", true);
                }
            }
            else
            {
                string msg = "Authentication did not succeed. Check user name and password.";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \'" + msg + "\','error','Login.aspx');", true);
            }
        }
    }
}