using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualWallet.Models
{
    public class Cuenta
    { 

        public Cuenta()
        {
        }

        public Cuenta(int id, char moneda, char banco, int numeroCuenta, float saldo, char tipoCuenta, char estado, Persona cliente)
        {
            this.Id = id;
            this.Moneda = moneda;
            this.Banco = banco;
            this.NumeroCuenta = numeroCuenta;
            this.Saldo = saldo;
            this.TipoCuenta = tipoCuenta;
            this.Estado = estado;
            this.Cliente = cliente;
        }

        public int Id { get; set; }
        public char Moneda { get; set; }
        public char Banco { get; set; }
        public int NumeroCuenta { get; set; }
        public float Saldo { get; set; }
        public char TipoCuenta { get; set; }
        public char Estado { get; set; }
        public Persona Cliente { get; set; }
    }
}