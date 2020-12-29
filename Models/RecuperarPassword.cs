using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualWallet.Models
{
    public class RecuperarPassword
    {
        private string email;
        private string password;

        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }

        public RecuperarPassword (string email, string password)
        {
            this.email = email;
            this.password = password;            
        }
    }
}