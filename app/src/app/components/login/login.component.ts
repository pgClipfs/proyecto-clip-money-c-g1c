import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { from } from 'rxjs';
import {LoginService} from '../../services/login.service';
import {Login} from '../../models/login.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  userLogin: Login = new Login ();
  @ViewChild('alert', { static: false }) public alert: ElementRef;
  constructor(private loginService: LoginService, private router: Router) { }
  
  ngOnInit(): void {
  }
  public login() {   
    this.loginService.login (this.userLogin).subscribe (resp =>{
      localStorage.setItem ('token',resp);
      this.router.navigate(['/dashboard']);
    },(err)=>{      
      console.log('error from service',err);
      this.alert.nativeElement.style.display="block"; 
    });    
    }
}
