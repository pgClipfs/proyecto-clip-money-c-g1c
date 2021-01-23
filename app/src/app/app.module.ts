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
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { HeaderComponent } from './components/header/header.component';
import { IngresardineroComponent } from './ingresardinero/ingresardinero.component';
import { ValidarcuentaComponent } from './validarcuenta/validarcuenta.component';
import { PerfilComponent } from './perfil/perfil.component';
import { TransferenciaComponent } from './components/dashboard/transferencia/transferencia.component';
import { GirarDescubiertoComponent } from './components/dashboard/girar-descubierto/girar-descubierto.component';

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
  },
  {
    path: 'dashboard',
    component: DashboardComponent
  },
  {
    path: 'ingresardinero',
    component: IngresardineroComponent
  },
  {
    path: 'validarcuenta/:id',
    component: ValidarcuentaComponent
  },
  {
    path: 'perfil',
    component: PerfilComponent
  },
  {
    path: 'transferencia',
    component: TransferenciaComponent
  },
  {
    path: 'girar-descubierto',
    component: GirarDescubiertoComponent
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
    RegistroComponent,
    DashboardComponent,
    HeaderComponent,
    IngresardineroComponent,
    ValidarcuentaComponent,
    PerfilComponent,
    TransferenciaComponent,
    GirarDescubiertoComponent
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
