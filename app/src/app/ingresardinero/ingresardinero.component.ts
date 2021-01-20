import { Component, OnInit } from '@angular/core';
import { CuentaService } from '../services/cuenta.service';
import { Cuenta } from '../models/cuenta.model';
// import { Ingresardinero } from '../models/ingresardinero.model'

@Component({
  selector: 'app-ingresardinero',
  templateUrl: './ingresardinero.component.html',
  styleUrls: ['./ingresardinero.component.css'],
})
export class IngresardineroComponent implements OnInit {
  public cuenta: Cuenta;
  public agregarMonto: number = 0;
  public extraerMonto: number = 0;

  constructor(private cuentaService: CuentaService) {}

  ngOnInit(): void {
    this.cuenta=new Cuenta();
    this.cuenta.Saldo=0;
    this.cuentaService.getCuentas().subscribe((resp) => {
      console.log(resp);
      let cuentas = resp;
      let cuenta = cuentas.find((c) => c.Moneda.trim() == 'ARS');
      if (cuenta !== undefined) this.cuenta = cuenta;
    });
  }

  agregarSaldo() {
    if (this.agregarMonto > 0) {
      this.cuentaService
        .updateSaldo(this.cuenta.Id, 1, this.agregarMonto)
        .subscribe((resp) => {
          console.log(resp);
          this.cuenta = resp;
          this.agregarMonto=0;

        });
    }
  }

  extraerSaldo() {
    if (this.extraerMonto > 0) {
      this.cuentaService
        .updateSaldo(this.cuenta.Id, 2, this.extraerMonto)
        .subscribe((resp) => {
          console.log(resp);
          this.cuenta = resp;
          this.extraerMonto=0;
        });
    }
  }
}
