import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ListaCreditosComponent } from './creditos/lista-creditos/lista-creditos.component';
import { CuentasCreditoComponent } from './creditos/cuentas-credito/cuentas-credito.component';
import { AuthInterceptorService } from './interceptors/auth-interceptor.service';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { CreditosComponent } from './creditos/creditos.component';
import { FooterComponent } from './components/footer/footer.component';
import { from } from 'rxjs';
import { LoginService } from './services/login.service';
import { HomeComponent } from './components/home/home.component';
import { RegistroComponent } from './components/registro/registro.component';
import { RouterModule, Routes } from '@angular/router';

const router: Routes = [
  {
    path: 'home',
    component: HomeComponent
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'registro',
    component: RegistroComponent
  }
];

@NgModule({
  declarations: [
    AppComponent, 
    LoginComponent, 
    CreditosComponent, 
    FooterComponent, 
    ListaCreditosComponent,
    CuentasCreditoComponent,
    HomeComponent,
    RegistroComponent
  ],

  imports: [
    BrowserModule, 
    //AppRoutingModule, 
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule.forRoot(router)
  ],

  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptorService,
      multi: true,
      
    },
      LoginService
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
