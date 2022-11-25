﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace UploaderZipcode
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            ViewState.Clear();
            FormsAuthentication.SignOut();
            

            //Response.Redirect("Login.aspx");
            Response.Redirect(ConfigurationManager.AppSettings["RedirectUrlLogOut"]);
        }
    }
}