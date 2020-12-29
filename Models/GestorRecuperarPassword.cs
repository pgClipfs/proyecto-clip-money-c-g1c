using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace VirtualWallet.Models
{
    public class GestorRecuperarPassword
    {
        public void GenerarNuevaPassword(RecuperarPassword pRecuperarPassword)
        {
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "modificar_password";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@contraseña", pRecuperarPassword.Password));                

                comm.ExecuteNonQuery();
            }
        }

        public RecuperarPassword ObtenerPorEmail(string pEmail)
        {
            RecuperarPassword pRecuperar = null;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("validar_email", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@email", pEmail));

                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    string email = dr.GetString(1);
                    string password = dr.GetString(2);

                    pRecuperar = new RecuperarPassword(email, password);
                }

                dr.Close();
            }

            return pRecuperar;

        }
    }
}