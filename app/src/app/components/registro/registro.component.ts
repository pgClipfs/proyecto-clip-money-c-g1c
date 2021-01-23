/*import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}*/

import { Component, OnInit } from '@angular/core';
import {RegistroService} from '../../services/registro.service';
import { Registro } from '../../models/registro.model'
import { Router } from '@angular/router';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit {

  angular="https://angular.io";
  public registros: Registro[];

  selectedRegistro: Registro = new Registro();

  constructor(private registroService: RegistroService, private router: Router) { }
  
  ngOnInit(): void {
    /*this.registroService.getRegistros().subscribe(resp=>{
      console.log(resp);
      this.registros=resp;
    })*/
  }

  public onSubmit(registro: Registro)
  {
    if(registro.Id==0) //si el id es cero quiere decir que no hay ninguna persona seleccionada, por lo tanto crea una nueva
    {
      this.registroService.onCreatePersona(registro).subscribe(resp=>{
      console.log(resp);
      this.router.navigate(['/validarcuenta', resp.Id]);  
      })
    }
    /*else { //sino es cero, se selecciono una persona y se la va a modificar
      this.registroService.onUpdateRegistro(registro).subscribe(resp=>{        
      })

    }
    
    this.selectedRegistro=new Registro(); //limpia la variable selectedPersona*/
  }

  /*

  //elimina filas de la tabla personas
  public onDelete(id:number)
  {
    //el llamado a onDeletePersona hace las modificaciones en la base de datos
    //por el subscribe se modifica automáticamente en el Fron End
    this.personaService.onDeletePersona(id).subscribe(resp=>{
    this.personas = this.personas.filter(t => t.Id !== id);//filtra el id del array personas
    });
  }

  


  public onSelect(item: Persona)
  {
    this.selectedPersona=item; //le asigno a la propiedad selectedPersona el objeto que se seleccionó
  }*/
}
