import { Component, OnInit } from '@angular/core';
import { DashboardService } from '../../services/dashboard.service';
import { Operacion } from '../../models/operacion.model'
import { Saldo } from '../../models/saldo.model'

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  angular="https://angular.io";
  public operaciones: Operacion[]=[];
  public saldo: Saldo;

  selectedOperacion: Operacion = new Operacion();

  constructor(private dashboardService: DashboardService) { }

  ngOnInit(): void {
    this.dashboardService.getOperaciones().subscribe(resp=>{
      console.log(resp);
      this.operaciones=resp;
      console.log(this.operaciones); 

      /*this.dashboardService.getOperaciones().subscribe(resp=>{
        console.log(resp);
        this.operaciones=resp;
        console.log(this.operaciones);*/
    })
  }

  nuevaOperacion(){
  alert("Binding de evento funcionando")
}
}
