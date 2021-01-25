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

        public Cuenta(int id, string moneda, string banco, long numeroCuenta, decimal saldo, string tipoCuenta, string estado, int idCliente)
        {
            this.Id = id;
            this.Moneda = moneda;
            this.Banco = banco;
            this.NumeroCuenta = numeroCuenta;
            this.Saldo = saldo;
            this.TipoCuenta = tipoCuenta;
            this.Estado = estado;
            this.IdCliente = idCliente;
        }

        public int Id { get; set; }
        public string Moneda { get; set; }
        public string Banco { get; set; }
        public long NumeroCuenta { get; set; }
        public decimal Saldo { get; set; }
        public string TipoCuenta { get; set; }
        public string Estado { get; set; }
        public int IdCliente { get; set; }
    }
}