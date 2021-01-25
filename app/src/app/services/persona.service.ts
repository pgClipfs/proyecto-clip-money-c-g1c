import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http'
import {Persona} from '../models/persona.model'
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PersonaService {
  url="https://localhost:44359/api/";
  constructor( private http:HttpClient) { 
    console.log("Persona service funcionando");
  }

  getPersona(idCliente:number): Observable<Persona>{
    let header= new HttpHeaders().set('Content-Type','application/json');
    return this.http.get<Persona>(this.url+"persona"+ "/" + idCliente, {headers:header});
  }

}
