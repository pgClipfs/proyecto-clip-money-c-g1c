using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace VirtualWallet.Models
{
    public class GestorOperacion
    {
        private string StrConn;
        public GestorOperacion()
        {
            this.StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
        }
        public List<Operacion> ObtenerOperaciones()
        {
            List<Operacion> lista = new List<Operacion>();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "top10operaciones";
                comm.CommandType = System.Data.CommandType.StoredProcedure;

                //DataTable result = new DataTable();
                SqlDataReader dr = comm.ExecuteReader();
                //result.Load(dr);
                //foreach (DataRow row in result.Rows)
                //{
                //    Persona p = new Persona(row.Field<int>(0), row.Field<string>(1), row.Field<string>(2));
                //    lista.Add(p);
                //}
                while (dr.Read())
                {

                    int id = dr.GetInt32(0);
                    DateTime fechaHora = dr.GetDateTime(1);
                    string tipoOperacion = dr.GetString(2);
                    //int idCuentaDestino = dr.GetInt32(3);
                    //int idCuentaOrigen = dr.GetInt32(4);
                    decimal monto = dr.GetDecimal(3);


                    //Operacion p = new Operacion(id, fechaHora, tipoOperacion,idCuentaDestino,idCuentaOrigen);
                    Operacion p = new Operacion(id, fechaHora, tipoOperacion, 0, 0, monto);
                    lista.Add(p);
                }

                dr.Close();
            }

            return lista;
        }
    }
}