using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using VirtualWallet.Models;

namespace VirtualWallet.Controllers
{
    public class RecuperarPasswordController : ApiController
    {
        // GET: api/RecuperarPassword
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/RecuperarPassword/5
        public RecuperarPassword Get(string email)
        {
            GestorRecuperarPassword gRecuperar = new GestorRecuperarPassword();
            return gRecuperar.ObtenerPorEmail(email);
        }

        // POST: api/RecuperarPassword
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/RecuperarPassword/5
        public void Put(RecuperarPassword pRecuperar)
        {
            GestorRecuperarPassword gRecuperar = new GestorRecuperarPassword();
            gRecuperar.GenerarNuevaPassword(pRecuperar);
        }

        // DELETE: api/RecuperarPassword/5
        public void Delete(int id)
        {
        }
    }
}