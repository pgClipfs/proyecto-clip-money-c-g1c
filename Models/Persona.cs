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
        private string direccion;
        private string provincia;
        private string ciudad;
        private string usuario;
        private string password;
        private string email;

        public Persona()
        {
        }

        public Persona(int id, string nombre, string apellido, string email, string usuario, string password, string direccion, string provincia, string ciudad)
        {
            this.id = id;
            this.nombre = nombre;
            this.apellido = apellido;
            this.direccion = direccion;
            this.provincia = provincia;
            this.ciudad = ciudad;
            this.usuario = usuario;
            this.password = password;
            this.email = email;
        }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Provincia { get => provincia; set => provincia = value; }
        public string Ciudad { get => ciudad; set => ciudad = value; }
        public string Password { get => password; set => password = value; }
        public string Usuario { get => usuario; set => usuario = value; }
        public string Email { get => email; set => email = value; }
    }
}
