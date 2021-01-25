import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http'
import { Observable } from 'rxjs';
import { Cuenta } from '../models/cuenta.model';

@Injectable({
  providedIn: 'root'
})
export class CuentaService {
  url="https://localhost:44359/api/";
  constructor( private http:HttpClient) { 
    
  }

  getCuentas(): Observable<Cuenta[]>{
    let header= new HttpHeaders().set('Content-Type','application/json');
    return this.http.get<Cuenta[]>(this.url+"cuenta", {headers:header});
  }

  getCuenta(idCuenta:number): Observable<Cuenta>{
    let header= new HttpHeaders().set('Content-Type','application/json');
    return this.http.get<Cuenta>(this.url+"cuenta"+ "/" + idCuenta, {headers:header});
  }

  updateSaldo(idCuenta:number, operacion:number, monto:number): Observable<Cuenta>{
    let header= new HttpHeaders().set('Content-Type','application/json');
    let urlParams=`${this.url}cuenta?idcuenta=${idCuenta}&operacion=${operacion}&monto=${monto}`;
    return this.http.put<Cuenta>(urlParams, {headers:header});
  }

  createTransferencia(idCuentaOrigen:number, idCuentaDestino:number, monto:number): Observable<Cuenta>{
    let header= new HttpHeaders().set('Content-Type','application/json');
    let urlParams=`${this.url}cuenta?idcuentaorigen=${idCuentaOrigen}&idCuentaDestino=${idCuentaDestino}&monto=${monto}`;
    return this.http.patch<Cuenta>(urlParams, {headers:header});
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
