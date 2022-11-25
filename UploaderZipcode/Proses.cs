using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;

namespace UploaderZipcode
{
    public static class Proses
    {
        public static string[] UserInfo()
        {
            string[] Array = new string[4];

            GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_GetUser", con))
                {

                    DataTable dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USERNAME", principal.Identity.Name);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count > 0)
                    {
                        Array[0] = dtAll.Rows[0]["USERNAME"].ToString();
                        Array[1] = dtAll.Rows[0]["ROLE"].ToString();
                        Array[2] = dtAll.Rows[0]["OFFICE_CODE"].ToString();
                        Array[3] = dtAll.Rows[0]["REF_OFFICE_ID"].ToString();

                    }
                }
                con.Close();
            }

            return Array;

        }



        public static int MaxSeqNo()
        {
            int MaxSeqNo = 0;

            GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spDASHBOARD_MaxSeqNo_DeToValid", con))
                {

                    DataTable dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@USERNAME", principal.Identity.Name);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                    if (dtAll.Rows.Count > 0)
                    {
                        MaxSeqNo = Convert.ToInt32(dtAll.Rows[0]["MAX_SEQ_NO"].ToString());
                    }
                }
                con.Close();
            }

            return MaxSeqNo;

        }



        public static DataTable GetData(string paramSP, string paramWhere)
        {

            DataTable dtAll;
            dtAll = new DataTable();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(paramSP, con))
                {
                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();
            }
            return dtAll;

        }

        public static DataTable GetDataCDE(string spName, string dbType, string dbTime)
        {
            DataTable dtAll = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
                using (SqlCommand cmd = new SqlCommand(spName, con))
                {

                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AREA", dbType);
                    cmd.Parameters.AddWithValue("@PERIOD", dbTime);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();

                return dtAll;

            }
        }


        public static DataTable GetDataCA(string spName, string dbType)
        {
            DataTable dtAll = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionStringDASHBOARD"].ConnectionString))
            {
                GenericPrincipal principal = (GenericPrincipal)HttpContext.Current.User;
                using (SqlCommand cmd = new SqlCommand(spName, con))
                {

                    dtAll = new DataTable();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AREA", dbType);
                    //cmd.Parameters.AddWithValue("@PERIOD", dbTime);
                    con.Open();
                    dtAll.Clear();
                    dtAll.Load(cmd.ExecuteReader());
                }
                con.Close();

                return dtAll;

            }
        }


    }




}