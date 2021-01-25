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
  @ViewChild('alert2', { static: false }) public alert2: ElementRef;
  @ViewChild('success', { static: false }) public success: ElementRef;
  @ViewChild('saldoNegativo', { static: false }) public saldoNegativo: ElementRef;

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
    
    if (this.cuenta.Saldo<0){
      this.alert2.nativeElement.style.display="none";
      this.alert.nativeElement.style.display="none"; 
      this.success.nativeElement.style.display="none";
      this.saldoNegativo.nativeElement.style.display="block";
      return;
    }
    if ((this.montoGiro > this.cuenta.Saldo)&&(this.montoGiro <= this.cuenta.Saldo*0.1+this.cuenta.Saldo)) { 
      this.alert2.nativeElement.style.display="none";
      this.alert.nativeElement.style.display="none"; 
      this.success.nativeElement.style.display="block";      
      this.saldoNegativo.nativeElement.style.display="none";      
      this.cuentaService            
        .updateSaldo(this.cuenta.Id,3, this.montoGiro)
        .subscribe((resp) => {
          console.log(resp);
          this.cuenta = resp;
          this.montoGiro=0;        
        });
    }
    else if (this.montoGiro <= this.cuenta.Saldo) {
      this.alert2.nativeElement.style.display="block";
      this.alert.nativeElement.style.display="none"; 
      this.success.nativeElement.style.display="none"; 
      this.saldoNegativo.nativeElement.style.display="none";
    }
    else {
      this.alert2.nativeElement.style.display="none";
      this.alert.nativeElement.style.display="block"; 
      this.success.nativeElement.style.display="none";
      this.saldoNegativo.nativeElement.style.display="none";
    }
  }

}
