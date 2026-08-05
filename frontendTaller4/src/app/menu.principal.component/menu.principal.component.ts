import { Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { AuthService } from '../auth/auth.service';


@Component({
  selector: 'app-menu.principal.component',
  imports: [RouterLink],
  templateUrl: './menu.principal.component.html',
  styleUrl: './menu.principal.component.css',
})
export class MenuPrincipalComponent {

  private authService = inject(AuthService);

  rol: String | null = null;

  ngOnInit(){
    this.rol = this.authService.getRol();
    console.log("Rol actual:", this.rol);
  }


}
