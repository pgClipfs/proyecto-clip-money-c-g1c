using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using VirtualWallet.Models;

namespace VirtualWallet.Controllers
{
    //[Authorize]
    [RoutePrefix("api/operacion")]
    public class OperacionController : ApiController
    {
        //[Authorize]
        // GET: api/Operacion
        public IEnumerable<Operacion> Get()
        {
            GestorOperacion gOperacion = new GestorOperacion();
            return gOperacion.ObtenerOperaciones();
        }
    }
}
