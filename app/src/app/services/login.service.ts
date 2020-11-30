import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import {Login} from '../models/login.model';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  url="https://localhost:44359/api/login";
  
 

  constructor( private http:HttpClient) { 
    console.log("Persona service is running");
  }

      login(userLogin: Login):Observable<any>{
        let header=new HttpHeaders().set('Content-Type','application/json');
        return this.http.post<any>(this.url + "/authenticate", userLogin);
        }
}