import { Component, OnInit } from '@angular/core';
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
  constructor(private loginService: LoginService, private router: Router) { }
  
  ngOnInit(): void {
  }
  public login() {   
    this.loginService.login (this.userLogin).subscribe (resp =>{
      localStorage.setItem ('token',resp);
      this.router.navigate(['/dashboard']);
    });    
    }
}
