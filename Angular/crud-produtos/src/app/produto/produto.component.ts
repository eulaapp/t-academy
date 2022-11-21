import { Component } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { Produto } from '../modelo/Produto';
import { ProdutoService } from '../servicos/produto.service';

@Component({
  selector: 'app-produto',
  templateUrl: './produto.component.html',
  styleUrls: ['./produto.component.css']
})
export class ProdutoComponent {

  // construtor
  constructor(private servico: ProdutoService) {}

  //vetor de produtos
  vetor: Produto[] = []

  //formulario
  formulario = new FormGroup({
    produto: new FormControl(),
    valor: new FormControl()
  })

  // inicialização (executa após carregar todo o componente)
  ngOnInit() {
    this.selecionar()
  }

  //função p/ retornar os valores contidos no formulário
  testarFormulario(): void {
    console.log(this.formulario.value)
  }

  // cadastrar um produto
  cadastrar(): void {
    //objeto do tipo produto
    let produto = new Produto

    // passar os dados do formulário para o objeto produto
    produto.produto = this.formulario.value.produto
    produto.valor = this.formulario.value.valor

    // executar serviço
    this.servico.cadastrar(produto)
    .subscribe(retorno => {
      // cadastrar o produto no vetor
      this.vetor.push(retorno)
  
      //limpar dados do formulário
      this.formulario.reset()
    }) 
  }

  // remover produto do vetor
  remover(id: number): void {
    // remover produto do back-end
    this.servico.remover(id)
    .subscribe(() => {
      let pesquisaId = this.vetor.findIndex(obj => {return obj.id === id})
      this.vetor.splice(id, 1)
    })    
  }

  //obter todos os produtos da API
  selecionar(): void {
    this.servico.selecionar()
    .subscribe({
      next: retorno => this.vetor = retorno,
      error: () => alert("Falha ao listar")
    })
  }

}
