using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Routing;
using VirtualWallet.Models;

namespace VirtualWallet.Controllers
{
    //[Authorize]
    [RoutePrefix("api/cuenta")]
    public class CuentaController : ApiController
    {
        /**[Authorize]
        // GET: api/Persona
        //public IEnumerable<Cuenta> Get()
        {
            GestorCuenta gPersona = new GestorCuenta();
            return gPersona.ObtenerPersonas();
        }*/

        public List<Cuenta> Get()
        {
            GestorCuenta gCuenta = new GestorCuenta();
            var cuentas = gCuenta.ObtenerDatosCuentas(User.Identity.Name);
            return cuentas;
        }

        //POST: api/Cuenta
        public Cuenta Post(Cuenta cuenta)
        {
            int id;
            GestorCuenta gCuenta = new GestorCuenta();
            id = gCuenta.AgregarCuenta(cuenta);
            cuenta.Id = id;
            return cuenta;
        }

        //PUT: api/Cuenta
        public Cuenta Put(int idCuenta, int operacion, decimal monto)
        {
            GestorCuenta gCuenta = new GestorCuenta();
            var cuenta = gCuenta.ObtenerDatosCuenta(idCuenta);
            if (cuenta != null)
            {
                if (operacion == 1)
                    cuenta.Saldo = cuenta.Saldo + monto;
                else if (operacion == 2)
                    cuenta.Saldo = cuenta.Saldo - monto;

                if (operacion == 1 || operacion == 2)
                    gCuenta.ModificarSaldo (cuenta, operacion, monto);
            }

            return cuenta;
        }

        //PUT: api/Cuenta        
        public Cuenta Put(int idCuenta, string usuario, decimal monto)
        {
            GestorCuenta gCuenta = new GestorCuenta();
            var cuentaOrigen = gCuenta.ObtenerDatosCuenta(idCuenta);
            var cuentaDestino = gCuenta.ObtenerDatosCuenta(usuario);

            if ((cuentaOrigen != null)&&(cuentaDestino!=null))
            { 
                cuentaOrigen.Saldo = cuentaOrigen.Saldo - monto;
                cuentaDestino.Saldo = cuentaDestino.Saldo + monto;
                
                gCuenta.RealizarTransferencia(cuentaOrigen, cuentaDestino, monto);
            }

            return cuentaOrigen;
        }

        /**
        // DELETE: api/Persona/5
        public void Delete(int id)
        {
            GestorCuenta gPersona = new GestorCuenta();
            gPersona.Eliminar(id);

        }*/
    }
}
