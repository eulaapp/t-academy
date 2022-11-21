import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
 // title = 'crud-produtos';

 // criar variáveis
 // let funciona apenas dentro de funções
 // para criar variável fora de função:
 texto = "Aprendendo Angular"

 //tipar variávels
 texto1: string = "Hello Angular!"
 
 exibir: boolean = true

 nomes: string[] = ['Aline', 'Bianca', 'Caio', 'Gustavo', 'Viviane']

 clientes: any[] = [
  {
    'nome':'Aline',
    'idade': 23
  },
  {
    'nome':'Bianca',
    'idade': 34
  },
  {
    'nome':'Caio',
    'idade': 17
  },
  {
    'nome':'Gustavo',
    'idade': 22
  },
  {
    'nome':'Viviane',
    'idade': 16
  },
 ]

 // função p/ exibir mensagem

 // como boas práticas é usado apóstrofo em vez de aspas
 mensagem(): void {
  alert('Hello World!');
 }

 // função para exibir ou ocultar o quadrado
 exibirOcultar(): void {
  this.exibir = !this.exibir
 }

}
