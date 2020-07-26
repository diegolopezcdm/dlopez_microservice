import { Component, OnInit } from '@angular/core';
import { LoginService } from './login.service';
import { Usuario } from './usuario';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'webapp';
  usuario:Usuario = new Usuario();
  
  constructor(private service:LoginService){}

  ngOnInit(){
    this.login();
  }
  public login(){
    this.usuario.username="admin";
    this.usuario.password="123456";
    //this.usuario = new Usuario("admin","123456");
    this.service.getToken(this.usuario).subscribe(
    usuario=>{
    console.log("usuario",usuario);
    sessionStorage.setItem("user",usuario);
    sessionStorage.setItem("token",usuario.token);
    },
    error=>{
    console.log(<any>error);
    //this.router.navigate(['/mlogin']);
    }
    );
    }
}