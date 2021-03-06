﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Routing;
using VirtualWallet.Models;

namespace VirtualWallet.Controllers
{
    //[Authorize]
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

        // GET: api/Persona/5
        public Persona Get(int id)
        {
            Persona persona = new Persona();
            GestorPersonas gPersona = new GestorPersonas();
            if (id > 0)
                persona = gPersona.ObtenerPorId(id);
            else
                persona = gPersona.ObtenerPorUsuario(User.Identity.Name);
            return persona;

        }

        //public Persona GetDatosPerfil(string usuario)
        //{
        //    string usuarioParam = string.IsNullOrEmpty(usuario) ? User.Identity.Name : usuario;
        //    GestorPersonas gPersona = new GestorPersonas();
        //    return gPersona.ObtenerPorUsuario(usuarioParam);
        //}

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
        public Persona Put(Persona persona)
        {
            GestorPersonas gPersona = new GestorPersonas();
            return gPersona.ModificarPersona(persona);

        }

        // PATCH: api/Persona
        public void Patch(Persona persona)
        {
            GestorPersonas gPersona = new GestorPersonas();
            gPersona.EditarPerfil(persona);
        }

        // DELETE: api/Persona/5
        public void Delete(int id)
        {
            GestorPersonas gPersona = new GestorPersonas();
            gPersona.Eliminar(id);

        }
        [System.Web.Http.HttpPost()]
        [System.Web.Http.Route("updatephotoclient")]
        public void UpdatePhotoClient([System.Web.Http.FromBody] PersonaActualizarFoto personaActualizarFoto)
        {
            GestorPersonas gPersona = new GestorPersonas();
            
            gPersona.ActualizarFotoPersona(personaActualizarFoto.Id, personaActualizarFoto.FotoFrente, personaActualizarFoto.FotoReverso);

        }

        private string ConvertToBase64(IFormFile file) {
            var photoStream = file.OpenReadStream();
            using (MemoryStream memStream = new MemoryStream())
            {
                photoStream.CopyTo(memStream);
                var PhotoBase64=Convert.ToBase64String( memStream.ToArray());
                return PhotoBase64;
            }
        }
    }
}

