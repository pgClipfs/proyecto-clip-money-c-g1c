import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { Cuenta } from '../../../models/cuenta.model'
import { CuentaService } from '../../../services/cuenta.service';


@Component({
  selector: 'app-transferencia',
  templateUrl: './transferencia.component.html',
  styleUrls: ['./transferencia.component.css']
})
export class TransferenciaComponent implements OnInit {  
  public SaldoPesos: any='0';
  public montoTransferencia: number = 0;
  public cuenta: Cuenta;  

  @ViewChild('cvu', { static: false }) public cvu: ElementRef;
  @ViewChild('monto', { static: false }) public monto: ElementRef;

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

  transferir() {
    //if (this.montoTransferencia > 0) {
      console.log("id número: " + this.cuenta.Id);
      console.log("cuenta destino: "+ this.cvu.nativeElement.value);
      console.log("monto" +this.montoTransferencia);
      this.cuentaService
        .createTransferencia(this.cuenta.Id, this.cvu.nativeElement.value, this.monto.nativeElement.value)
        .subscribe((resp) => {
          console.log(resp);
          this.cuenta = resp;
          this.montoTransferencia=0;

        });
    //}
  }

}
