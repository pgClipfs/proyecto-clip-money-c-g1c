import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { Cuenta } from '../../../models/cuenta.model'
import { CuentaService } from '../../../services/cuenta.service';



@Component({
  selector: 'app-girar-descubierto',
  templateUrl: './girar-descubierto.component.html',
  styleUrls: ['./girar-descubierto.component.css']
})



export class GirarDescubiertoComponent implements OnInit {
  public cuenta: Cuenta;  
  public SaldoPesos: any='0';
  public montoGiro: number = 0;

  @ViewChild('alert', { static: false }) public alert: ElementRef;

  constructor(private cuentaService: CuentaService) { }

  ngOnInit(): void {   
    this.cuenta=new Cuenta();
    this.cuenta.Saldo=0;
    this.cuentaService.getCuentas().subscribe((resp) => {
      console.log(resp);
      let cuentas = resp;
      let cuenta = cuentas.find((c) => c.Moneda.trim() == 'ARS');
      console.log(this.cuenta.Id);
      if (cuenta !== undefined) {
        this.cuenta = cuenta;
        console.log(this.cuenta);        
      }
    });
   
  }

  girar() {
    console.log(this.montoGiro);
    console.log(this.cuenta.Saldo);
    if ((this.montoGiro > this.cuenta.Saldo)&&(this.montoGiro < this.cuenta.Saldo*0.1+this.cuenta.Saldo)) {      
      this.cuentaService
        .updateSaldo(this.cuenta.Id,3, this.montoGiro)
        .subscribe((resp) => {
          console.log(resp);
          this.cuenta = resp;
          this.montoGiro=0;        
        });
    }
  }

}
