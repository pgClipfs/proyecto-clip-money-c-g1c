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

    [RoutePrefix("api/persona")]
    public class PersonaController : ApiController
    {
        //[Authorize]
        // GET: api/Persona
        public IEnumerable<Persona> Get()
        {
            GestorPersonas gPersona = new GestorPersonas();
            return gPersona.ObtenerPersonas();
        }

        public Persona Get(int id)
        {
            GestorPersonas gPersona = new GestorPersonas();
            return gPersona.ObtenerPorId(id);
        }

        // POST: api/Persona
        public Persona Post(Persona persona)
        {
            int id;
            GestorPersonas gPersona = new GestorPersonas();
            id = gPersona.AgregarPersona(persona);
            persona.Id = id;
            return persona;
        }

        // PUT: api/Persona
        public void Put(Persona persona)
        {
            GestorPersonas gPersona = new GestorPersonas();
            gPersona.ModificarPersona(persona);

        }

        // DELETE: api/Persona/5
        public void Delete(int id)
        {
            GestorPersonas gPersona = new GestorPersonas();
            gPersona.Eliminar(id);

        }
    }
}

