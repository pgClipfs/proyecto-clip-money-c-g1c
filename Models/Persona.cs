using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualWallet.Models
{
    public class Persona
    {
        private int id;
        private string nombre;
        private string apellido;

        public Persona()
        {
        }

        public Persona(int id, string nombre, string apellido)
        {
            this.id = id;
            this.nombre = nombre;
            this.apellido = apellido;
        }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
    }
}
