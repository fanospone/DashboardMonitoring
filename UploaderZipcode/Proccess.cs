using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace UploaderZipcode
{
    public class Proccess
    {
        public static void DeleteTarget(string Table_Name,string GetDate)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM " + Table_Name + 
                    " Where convert(varchar, DTM_CRT, 101) + LEFT(convert(varchar, DTM_CRT, 108),5) <> '" + GetDate + "'", con))
                {
                    con.Open();
                    cmd.ExecuteReader();
                }
                con.Close();
            }
        }

        public static string rootFolder
        {
            get
            {
                string folder = @"" + ConfigurationManager.AppSettings["Folder"];
                return folder;
            }           
        }
    }
}