﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualWallet.Models
{
    public class Operacion
    {
        private int id;
        private DateTime fechaHora;
        private string tipoOperacion;
        private int idCuentaDestino;
        private int idCuenta;

        public Operacion() 
        { 
        }

        public Operacion(int id, DateTime fechaHora, string tipoOperacion, int idCuentaDestino, int idCuenta)
        {
            this.id = id;
            this.fechaHora = fechaHora;
            this.tipoOperacion = tipoOperacion;
            this.idCuentaDestino = idCuentaDestino;
            this.idCuenta = idCuenta;
        }


        public int Id { get => id; set => id = value; }
        public DateTime FechaHora { get => fechaHora; set => fechaHora = value; }
        public string TipoOperacion { get => tipoOperacion; set => tipoOperacion = value; }
        public int IdCuentaDestino { get => idCuentaDestino; set => idCuentaDestino = value; }
        public int IdCuenta { get => idCuenta; set => idCuenta = value; }
    }
}