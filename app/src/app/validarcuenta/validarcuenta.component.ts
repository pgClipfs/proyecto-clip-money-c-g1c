import { Component } from '@angular/core';
import { RegistroService } from '../services/registro.service'
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-validarcuenta',
  templateUrl: './validarcuenta.component.html',
  styleUrls: ['./validarcuenta.component.css']
})
export class ValidarcuentaComponent {

  public idCliente: number;
  public fileFront: any;
  public fileBack: any;

  constructor(private registroService: RegistroService, private activatedRoute: ActivatedRoute, private router: Router) {
    this.activatedRoute.params.subscribe(data=>{this.idCliente=data.id;});
  }

  savePhotos(){

    this.registroService.updateFoto(this.idCliente, this.fileFront, this.fileBack).subscribe(resp=>{
    console.log(resp);
    this.router.navigate(['/login']);  
    })

  }

  base(event: any, type: string) {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      if (type === "front") this.fileFront = reader.result;
      else if (type === "back") this.fileBack = reader.result;

      console.log(this.fileFront);
      console.log(this.fileBack);
    };
  }

}
