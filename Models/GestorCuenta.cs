using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace VirtualWallet.Models
{
    public class GestorCuenta
    {
        private string StrConn;
        public GestorCuenta()
        {
            this.StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
        }
            public int AgregarCuenta(Cuenta nueva)
        {

            int id = 0;

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "agregar_cuenta";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@Moneda", nueva.Moneda));
                //comm.Parameters.Add(new SqlParameter("@Banco", nueva.Banco));
                //comm.Parameters.Add(new SqlParameter("@NumeroCuenta", nueva.NumeroCuenta));
                comm.Parameters.Add(new SqlParameter("@Saldo", nueva.Saldo));
                comm.Parameters.Add(new SqlParameter("@TipoCuenta", nueva.TipoCuenta));
                comm.Parameters.Add(new SqlParameter("@Estado", nueva.Estado));
                comm.Parameters.Add(new SqlParameter("@IdCliente", nueva.Cliente.Id));

                id = Convert.ToInt32(comm.ExecuteScalar());
            }
            return id;
        }
    }
}