import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Produto } from '../modelo/Produto';

@Injectable({
  providedIn: 'root'
})
export class ProdutoService {

  constructor(private http: HttpClient) { }

  // selecionar todos os produtos da api
  selecionar() {
    return this.http.get<Produto[]>('http://localhost:3000/produtos')
  }

  // remover produtos pelo id
  remover(id: number) {
    return this.http.delete('http://localhost:3000/produtos/' + id)
  }

  // cadastrar um produto
  cadastrar(p: Produto) {
    return this.http.post<Produto>('http://localhost:3000/produtos/', p)
  }

}
