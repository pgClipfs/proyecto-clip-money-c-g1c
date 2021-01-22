using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualWallet.Models
{
    public class PersonaActualizarFoto
    {

        public PersonaActualizarFoto()
        {
        }

        public int Id { get; set; }
        public string FotoFrente { get; set; }
        public string FotoReverso { get; set; }

    }
}
