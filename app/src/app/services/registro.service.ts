/*import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class RegistroService {

  constructor() { }
}*/

import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http'
import {Registro} from '../models/registro.model'
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RegistroService {
  url="https://localhost:44359/api/persona";
  constructor( private http:HttpClient) { 
    console.log("Persona service funcionando");
  }
  onCreatePersona(registro:Registro):Observable<Registro>{
    let header=new HttpHeaders().set('Content-Type','application/json');
    return this.http.post<Registro>(this.url, registro, {headers:header});//arma la url agregando el id a eliminar
  }

  getRegistros(): Observable<Registro[]>{
    let header= new HttpHeaders().set('Content-Type','application/json');
    return this.http.get<Registro[]>(this.url, {headers:header});
  }

  /*

  onDeletePersona(id:number):Observable<number>{
    let header=new HttpHeaders().set('Content-Type','application/json');
    return this.http.delete<number>(this.url + "/" + id, {headers:header});//arma la url agregando el id a eliminar
  }

  

  onUpdatePersona(persona:Persona):Observable<Persona>{
    let header=new HttpHeaders().set('Content-Type','application/json');
    return this.http.put<Persona>(this.url, persona, {headers:header});
  }*/
}
