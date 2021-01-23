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

        public void ModificarSaldo(Cuenta cuenta, int tipoOperacion, decimal monto)
        {

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "modificar_saldo";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@saldo", cuenta.Saldo));
                comm.Parameters.Add(new SqlParameter("@idCuenta", cuenta.Id));

                comm.ExecuteNonQuery();

                Operacion operacion = new Operacion();

                int id = 0;

                if (tipoOperacion == 1)
                {
                    operacion.TipoOperacion = "Ingreso de saldo";
                } 
                else
                {
                    operacion.TipoOperacion = "Retiro de saldo";
                }

                SqlCommand comm2 = conn.CreateCommand();
                comm2.CommandText = "agregar_operacion";
                comm2.CommandType = System.Data.CommandType.StoredProcedure;                
                comm2.Parameters.Add(new SqlParameter("@TipoOperacion", operacion.TipoOperacion));
                comm2.Parameters.Add(new SqlParameter("@IdCuenta", cuenta.Id));
                comm2.Parameters.Add(new SqlParameter("@Monto", monto));

                id = Convert.ToInt32(comm2.ExecuteScalar());
            }
        }

        public void RealizarTransferencia(Cuenta cuentaOrigen, Cuenta cuentaDestino, decimal monto)
        {
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "modificar_saldo";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@saldo", cuentaOrigen.Saldo));
                comm.Parameters.Add(new SqlParameter("@idCuenta", cuentaOrigen.Id));

                comm.ExecuteNonQuery();

                Operacion operacion = new Operacion();

                int idOp1 = 0;
                
                operacion.TipoOperacion = "Transferencia a usuario";

                SqlCommand comm2 = conn.CreateCommand();
                comm2.CommandText = "agregar_operacion";
                comm2.CommandType = System.Data.CommandType.StoredProcedure;
                comm2.Parameters.Add(new SqlParameter("@TipoOperacion", operacion.TipoOperacion));
                comm2.Parameters.Add(new SqlParameter("@IdCuenta", cuentaOrigen.Id));
                comm2.Parameters.Add(new SqlParameter("@Monto", monto));

                idOp1 = Convert.ToInt32(comm2.ExecuteScalar());


                SqlCommand comm3 = conn.CreateCommand();
                comm3.CommandText = "modificar_saldo";
                comm3.CommandType = System.Data.CommandType.StoredProcedure;
                comm3.Parameters.Add(new SqlParameter("@saldo", cuentaDestino.Saldo));
                comm3.Parameters.Add(new SqlParameter("@idCuenta", cuentaDestino.Id));

                comm3.ExecuteNonQuery();

                Operacion operacion2 = new Operacion();

                int idOp2 = 0;

                operacion2.TipoOperacion = "Recepción transferencia";

                SqlCommand comm4 = conn.CreateCommand();
                comm4.CommandText = "agregar_operacion";
                comm4.CommandType = System.Data.CommandType.StoredProcedure;
                comm4.Parameters.Add(new SqlParameter("@TipoOperacion", operacion2.TipoOperacion));
                comm4.Parameters.Add(new SqlParameter("@IdCuenta", cuentaDestino.Id));
                comm4.Parameters.Add(new SqlParameter("@Monto", monto));

                idOp2 = Convert.ToInt32(comm4.ExecuteScalar());

            }

        }

        public List<Cuenta> ObtenerDatosCuentas(string usuario)
        {
            var cuentas=new List<Cuenta>();
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_datos_cuentas";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@Usuario", usuario));

                SqlDataReader dr = comm.ExecuteReader();
                
                while (dr.Read())
                {

                    int id = dr.GetInt32(0);
                    string moneda = dr.GetString(1);
                    string banco = dr.GetString(2);
                    long numeroCuenta = dr.GetInt64(3);
                    decimal saldo = dr.GetDecimal(4);
                    string tipoCuenta = dr.GetString(5);
                    string estado = dr.GetString(6);


                    Cuenta p = new Cuenta(id, moneda, banco, numeroCuenta, saldo, tipoCuenta, estado, null);
                    cuentas.Add(p);
                }

                dr.Close();
            }
            return cuentas;
        }

        public Cuenta ObtenerDatosCuenta(int idCuenta)
        {
            Cuenta cuenta = null;
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_datos_cuenta";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@idCuenta", idCuenta));

                SqlDataReader dr = comm.ExecuteReader();

                while (dr.Read())
                {

                    int id = dr.GetInt32(0);
                    string moneda = dr.GetString(1);
                    string banco = dr.GetString(2);
                    long numeroCuenta = dr.GetInt64(3);
                    decimal saldo = dr.GetDecimal(4);
                    string tipoCuenta = dr.GetString(5);
                    string estado = dr.GetString(6);


                    cuenta = new Cuenta(id, moneda, banco, numeroCuenta, saldo, tipoCuenta, estado, null);
             
                }

                dr.Close();
            }
            return cuenta;
        }

        public Cuenta ObtenerDatosCuenta(string usuario)
        {
            Cuenta cuenta = null;
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_cuenta_por_usuario";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@usuario", usuario));

                SqlDataReader dr = comm.ExecuteReader();

                while (dr.Read())
                {

                    int id = dr.GetInt32(0);
                    string moneda = dr.GetString(1);
                    string banco = dr.GetString(2);
                    long numeroCuenta = dr.GetInt64(3);
                    decimal saldo = dr.GetDecimal(4);
                    string tipoCuenta = dr.GetString(5);
                    string estado = dr.GetString(6);


                    cuenta = new Cuenta(id, moneda, banco, numeroCuenta, saldo, tipoCuenta, estado, null);

                }

                dr.Close();
            }
            return cuenta;
        }
    }
}