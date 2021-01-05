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
    [Authorize]
    [RoutePrefix("api/cuenta")]
    public class CuentaController : ApiController
    {
        /**[Authorize]
        // GET: api/Persona
        //public IEnumerable<Cuenta> Get()
        {
            GestorCuenta gPersona = new GestorCuenta();
            return gPersona.ObtenerPersonas();
        }

        public Cuenta Get(int id)
        {
            GestorCuenta gPersona = new GestorCuenta();
            return gPersona.ObtenerPorId(id);
        }*/

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
        public void Put(Cuenta cuenta, int ope)
        {
            GestorCuenta gCuenta = new GestorCuenta();
            gCuenta.ModificarSaldo(cuenta, ope);
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
