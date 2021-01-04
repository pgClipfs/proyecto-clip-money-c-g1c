import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import {Login} from '../models/login.model';
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  url="https://localhost:44359/api/login";
  
 

  constructor( private http:HttpClient) { 
    console.log("Persona service is running");
  }

      /*login(userLogin: Login):Observable<any>{
        let header=new HttpHeaders().set('Content-Type','application/json');
        return this.http.post<any>(this.url + "/authenticate", userLogin);
        }*/
        login(userLogin: Login):Observable<any>{

          return this.http.post(this.url + "/authenticate", userLogin).pipe(map(user => {
          
          localStorage.setItem('token', JSON.stringify(user));
          console.log(user);
          return user;
          }));
}
}