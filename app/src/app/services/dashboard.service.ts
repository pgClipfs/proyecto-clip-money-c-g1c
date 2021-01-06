/*import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {

  constructor() { }
}*/

import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http'
import {Operacion} from '../models/operacion.model'
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  url="https://localhost:44359/api/operacion";
  constructor( private http:HttpClient) { 
    console.log("Operacion service funcionando");
  }

  getOperaciones(): Observable<Operacion[]>{
    let header= new HttpHeaders().set('Content-Type','application/json');
    return this.http.get<Operacion[]>(this.url, {headers:header});
  }

  /*onDeletePersona(id:number):Observable<number>{
    let header=new HttpHeaders().set('Content-Type','application/json');
    return this.http.delete<number>(this.url + "/" + id, {headers:header});//arma la url agregando el id a eliminar
  }

  onCreatePersona(persona:Operacion):Observable<Persona>{
    let header=new HttpHeaders().set('Content-Type','application/json');
    return this.http.post<Operacion>(this.url, persona, {headers:header});//arma la url agregando el id a eliminar
  }

  onUpdatePersona(persona:Operacion):Observable<Persona>{
    let header=new HttpHeaders().set('Content-Type','application/json');
    return this.http.put<Operacion>(this.url, persona, {headers:header});
  }*/
}
