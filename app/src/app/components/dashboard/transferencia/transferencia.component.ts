import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { Cuenta } from '../../../models/cuenta.model'
import { Persona } from '../../../models/persona.model'
import { CuentaService } from '../../../services/cuenta.service';
import { PersonaService } from '../../../services/persona.service';


@Component({
  selector: 'app-transferencia',
  templateUrl: './transferencia.component.html',
  styleUrls: ['./transferencia.component.css']
})
export class TransferenciaComponent implements OnInit {  
  public SaldoPesos: any='0';
  public montoTransferencia: number = 0;
  public cuenta: Cuenta; 
  public cliente: Persona; 
  public cuentaDestino: Cuenta;

  @ViewChild('cvu', { static: false }) public cvu: ElementRef;
  @ViewChild('monto', { static: false }) public monto: ElementRef;
  @ViewChild('nombreDestinatario', { static: false }) public nombreDestinatario: ElementRef;
  @ViewChild('datosTransferencia', { static: false }) public datosTransferencia: ElementRef;
  @ViewChild('alertDestinatario', { static: false }) public alertDestinatario: ElementRef;
  @ViewChild('alertMonto', { static: false }) public alertMonto: ElementRef;
  @ViewChild('alertSuccess', { static: false }) public alertSuccess: ElementRef;
  @ViewChild('alertMonto2', { static: false }) public alertMonto2: ElementRef;
  @ViewChild('alertSaldo', { static: false }) public alertSaldo: ElementRef;

  constructor(private cuentaService: CuentaService, private personaService: PersonaService) { }

  ngOnInit(): void {
    this.cuenta=new Cuenta();
    this.cuenta.Saldo=0;
    this.cuentaDestino=new Cuenta();
    this.cuentaDestino.Saldo=0;
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
    if(this.monto.nativeElement.value>this.cuenta.Saldo){
      this.alertSaldo.nativeElement.style.display="block"; 
      this.datosTransferencia.nativeElement.style.display="none";
      return;
    } 
    if (this.monto.nativeElement.value > 0) {
      console.log("id número: " + this.cuenta.Id);
      console.log("cuenta destino: "+ this.cvu.nativeElement.value);
      console.log("monto" +this.monto.nativeElement.value);
      this.cuentaService
        .createTransferencia(this.cuenta.Id, this.cvu.nativeElement.value, this.monto.nativeElement.value)
        .subscribe((resp) => {
          console.log(resp);
          this.cuenta = resp;         
          this.alertMonto.nativeElement.style.display="none";
          this.alertDestinatario.nativeElement.style.display="none";  
          this.alertSuccess.nativeElement.style.display="block";
          this.alertMonto2.nativeElement.style.display="none";  
        });
    }
    else{
      this.alertMonto.nativeElement.style.display="block"; 
    }
  }

  obtenerNombre(){
    if(this.monto.nativeElement.value>this.cuenta.Saldo){
      this.alertSaldo.nativeElement.style.display="block"; 
      return;
    }
    if (this.monto.nativeElement.value > 0) {
    this.cuentaService
        .getCuenta(this.cvu.nativeElement.value)
        .subscribe((resp) => {
          if(resp===null){
            console.log("devuelve" + resp);
            this.alertDestinatario.nativeElement.style.display="block"; 
            this.datosTransferencia.nativeElement.style.display="none";
            this.alertMonto2.nativeElement.style.display="none"; 
            this.alertSaldo.nativeElement.style.display="none"; 
          }          
          this.cuentaDestino = resp;
          this.personaService
            .getPersona(this.cuentaDestino.IdCliente)
            .subscribe((resp) => {
              console.log(resp);
              this.cliente = resp;   
              this.nombreDestinatario.nativeElement.value=this.cliente.Nombre + this.cliente.Apellido;
              this.datosTransferencia.nativeElement.style.display="block"; 
              this.alertDestinatario.nativeElement.style.display="none";
              this.alertMonto2.nativeElement.style.display="none";        
              this.alertSaldo.nativeElement.style.display="none"; 
            });                           
        }); 
  }
  else{
    this.alertMonto2.nativeElement.style.display="block"; 
  }
}

}
