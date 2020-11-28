import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { ListaCreditosComponent } from './creditos/lista-creditos/lista-creditos.component';
import { CuentasCreditoComponent } from './creditos/cuentas-credito/cuentas-credito.component';

import { AuthInterceptorService } from './interceptors/auth-interceptor.service';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { CreditosComponent } from './creditos/creditos.component';
import { FooterComponent } from './components/footer/footer.component';
import { from } from 'rxjs';

@NgModule({
  declarations: [
    AppComponent, 
    LoginComponent, 
    CreditosComponent, 
    FooterComponent, 
    ListaCreditosComponent,
    CuentasCreditoComponent
  ],

  imports: [
    BrowserModule, 
    AppRoutingModule, 
    HttpClientModule,
    //ReactiveFormsModule
  ],

  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptorService,
      multi: true,
    },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
