using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UploaderZipcode
{
    public partial class Login2 : System.Web.UI.Page
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
                //if (Request.QueryString["Id"] != null && Request.QueryString["Id"] != "")
                //{
                //    try
                //    {
                //        loginSister(Request.QueryString["Id"]);
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string adPath = "LDAP://corp.tafinance.com"; //Path to your LDAP directory server
            //LdapAuthentication adAuth = new LdapAuthentication(adPath);
            GetAdAuthentication getAdAuthentication = new GetAdAuthentication();
            string domain = ConfigurationManager.AppSettings["AdLink"];
            try
            {
                DataTable dtAll;
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

                if (dtAll.Rows.Count > 0 /*&& getAdAuthentication.IsAuthenticatedPost(domain,txtUsername.Text,txtPassword.Text) == true*/)
                    
                //if (dtAll.Rows.Count > 0 && true == adAuth.IsAuthenticated("corp.tafinance.com", txtUsername.Text, txtPassword.Text))
                {
                    FormsAuthentication.SetAuthCookie(txtUsername.Text, false);
                    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, txtUsername.Text, DateTime.Now,
                                    DateTime.Now.AddMinutes(30), true, dtAll.Rows[0]["ROLE"].ToString());

                    string encryptedTicket = FormsAuthentication.Encrypt(authTicket); //Encrypt the ticket.

                    //Create a cookie, and then add the encrypted ticket to the cookie as data.
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                    authCookie.Expires = authTicket.Expiration;

                    Response.Cookies.Add(authCookie); //Add the cookie to the outgoing cookies collection.
                    string url = "DashboardHome.aspx";
                    

                    if (FormsAuthentication.GetRedirectUrl(txtUsername.Text, true).Contains("default.aspx"))
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
                    string msg = "Authentication did not succeed. Check user name and password.";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \'" + msg + "\','error','Login2.aspx');", true);
                }
            }
            catch (Exception err)
            {
                string msg = "Something went wrong, contact your Administrator.<br><span style=\\\"font-size:9px;color:#F8BB86\\\">" + err.Message.Replace(System.Environment.NewLine, " ") + "</span>";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "dialog", "dialog('Error!', \"" + msg + "\",'error','Login2.aspx');", true);
            }
        }

        public void loginRoutine(string role)
        {
            FormsAuthenticationTicket authTicket;
            authTicket = new FormsAuthenticationTicket(1, Session[Constants.UserId].ToString(), DateTime.Now, DateTime.Now.AddMinutes(Constants.timeout), false, role);

            string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
            HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

            authCookie.Expires = authTicket.Expiration;
            Response.Cookies.Add(authCookie);

            if (FormsAuthentication.GetRedirectUrl(Session[Constants.UserId].ToString(), false).Contains("default.aspx"))
            {
                Response.Redirect("DashboardHome.aspx",false);
            }
            else
                Response.Redirect(FormsAuthentication.GetRedirectUrl(Session[Constants.UserId].ToString(), false));
           


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





    }





}