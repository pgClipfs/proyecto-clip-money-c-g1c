import { Component, OnInit } from '@angular/core';
import { DashboardService } from '../../services/dashboard.service';
import { CuentaService } from '../../services/cuenta.service';
import { Operacion } from '../../models/operacion.model'
import { Cuenta } from '../../models/cuenta.model'
import { ThisReceiver } from '@angular/compiler';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  angular="https://angular.io";
  public operaciones: Operacion[]=[];
  public cuentas: Cuenta[]=[];
  public SaldoPesos: any='0';
  public SaldoDolares: any='0';

  selectedOperacion: Operacion = new Operacion();

  constructor(private dashboardService: DashboardService, private cuentaService: CuentaService) { }

  ngOnInit(): void {
    
    this.dashboardService.getOperaciones().subscribe(resp=>{
      console.log(resp);
      this.operaciones=resp;
      console.log(this.operaciones); 
    });

    this.cuentaService.getCuentas().subscribe(resp=>{

      console.log(resp);
      this.cuentas=resp;
      let cuentaPesos=this.cuentas.find(c=>c.Moneda.trim()=='ARS');
      let cuentaDolares=this.cuentas.find(c=>c.Moneda.trim()=='U$S');
      if (cuentaPesos !==undefined) 
      this.SaldoPesos=cuentaPesos.Saldo;
      if (cuentaDolares !==undefined) 
      this.SaldoDolares=cuentaDolares.Saldo;
    })
  }

  nuevaOperacion(){
  alert("Binding de evento funcionando")
}
}
