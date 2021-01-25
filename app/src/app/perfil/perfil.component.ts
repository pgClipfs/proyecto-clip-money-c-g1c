import { Component, OnInit } from '@angular/core';
import { Persona } from '../models/persona.model';
import { PersonaService } from '../services/persona.service';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.css'],
})
export class PerfilComponent implements OnInit {
  public persona: Persona=new Persona();
  constructor(private personaService: PersonaService) {}

  ngOnInit(): void {
    this.personaService.getUsuario().subscribe((resp) => {
      console.log(resp);
      this.persona = resp;
    });
  }
  savePersona(){
    this.personaService.updateUsuario(this.persona).subscribe((resp) => {
      console.log(resp);
      this.persona = resp;
    });
  }
}
