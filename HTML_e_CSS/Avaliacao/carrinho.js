let carrinho = []

function criarListaProdutos() {
  let main = document.getElementById("main-carrinho")

  let listarProdutos = document.createElement("div")
  listarProdutos.classList.add("row")
  listarProdutos.id = "listarProdutos"

  main.appendChild(listarProdutos)

  return listarProdutos
}

function listarProdutosCarrinho() {
  let listarProdutos = criarListaProdutos()

  let subTitulo = document.createElement("h2")
  subTitulo.classList.add("total")

  subTitulo.innerText = "Total: " + totalCarrinho()

  listarProdutos.appendChild(subTitulo)

  for (let i = 0; i < carrinho.length; i++) {
    let coluna = document.createElement("div")
    coluna.classList.add("col-3")

    let card = document.createElement("div")
    card.classList.add("card", "prod")

    let titulo = document.createElement("h1")
    titulo.innerText = carrinho[i].produto.nome.substring(0, 20)

    let imagem = document.createElement("img")
    imagem.src = "imagens/" + carrinho[i].produto.imagem
    imagem.alt = carrinho[i].nome

    let valor = document.createElement("p")
    valor.innerText = carrinho[i].produto.valor.toLocaleString("pt-br", {
      style: "currency",
      currency: "BRL",
    });

    let botaoExcluir = document.createElement("button")
    botaoExcluir.classList.add("btn", "btn-primary")
    botaoExcluir.innerHTML = "Remover"
    botaoExcluir.value = i
    botaoExcluir.onclick = function () {
      removerProdutoCarrinho(this.value)
    };

    let aumentarQuantidade = document.createElement("button")
    aumentarQuantidade.classList.add("btn", "btn-primary", "add-remove")
    aumentarQuantidade.innerHTML = "+"
    aumentarQuantidade.value = i
    aumentarQuantidade.onclick = function () {
      adicionarProdutosCarrinho(this.value)
    };

    let diminuirQuantidade = document.createElement("button")
    diminuirQuantidade.classList.add("btn", "btn-primary", "add-remove")
    diminuirQuantidade.innerHTML = "-"
    diminuirQuantidade.value = i
    diminuirQuantidade.onclick = function () {
      removerQuantidadeProdutosCarrinho(this.value)
    };

    let qtdCarrinho = document.createElement("p")
    qtdCarrinho.classList.add("p");
    qtdCarrinho.innerHTML = carrinho[i].quantidade

    card.appendChild(imagem)
    card.appendChild(titulo)
    card.appendChild(valor)
    card.appendChild(botaoExcluir)
    card.appendChild(aumentarQuantidade)
    card.appendChild(diminuirQuantidade)
    card.appendChild(qtdCarrinho)

    coluna.appendChild(card)

    listarProdutos.appendChild(coluna)
  }
}

function totalCarrinho() {
  let total = 0

  for(let i = 0; i < carrinho.length; i++) {
    total = total + (carrinho[i].produto.valor * carrinho[i].quantidade)
  }
  return total.toLocaleString("pt-br", {
    style: "currency",
    currency: "BRL",
  });
}

function adicionarProdutosCarrinho(index) {
  let vetorTemp = JSON.parse(localStorage.getItem("produto"))

  if (vetorTemp[index].qtd < carrinho[index].produto.estoque) {
    vetorTemp[index].qtd++

    localStorage.setItem("produto", JSON.stringify(vetorTemp))

    location.reload()
  } else {
    alert(
      "O número de produtos adicionados é maior que o do estoque disponível"
    )
  }
}

function removerQuantidadeProdutosCarrinho(index) {
  let vetorTemp = JSON.parse(localStorage.getItem("produto"))

  if (vetorTemp[index].qtd > 0) {
    vetorTemp[index].qtd--
    localStorage.setItem("produto", JSON.stringify(vetorTemp))
    location.reload()

    if (vetorTemp[index].qtd == 0) {
        removerProdutoCarrinho(index)
    }
  }
}

function removerProdutoCarrinho(index) {
  let vetorTemp = JSON.parse(localStorage.getItem("produto"))

  vetorTemp.splice(index, 1)

  localStorage.setItem("produto", JSON.stringify(vetorTemp))

  location.reload()
}

window.onload = function () {
  let vetor = JSON.parse(localStorage.getItem("produto"))

  for (let i = 0; i < vetor.length; i++) {
    let indice = vetor[i].id
    carrinho.push({
      produto: produtos[indice],
      quantidade: vetor[i].qtd,
    });
  }

  listarProdutosCarrinho()
  totalCarrinho()
};

function pesquisar(e) {
  if (e.keyCode == 13) {
    pesquisarProdutos(document.getElementById("texto").value)
  }
}

function pesquisarProdutos(produto) {
  let listarProdutos = document.getElementById("listarProdutos")
  listarProdutos.remove()

  listarProdutos = criarListaProdutos()
  let produtoEncontrado = false

  for (let i = 0; i < produtos.length; i++) {
    if (produtos[i].nome.toLowerCase().includes(produto.toLowerCase())) {
      produto = true
      let coluna = document.createElement("div")
      coluna.classList.add("col-3")

      let card = document.createElement("div")
      card.classList.add("card", "prod")

      let titulo = document.createElement("h1")
      titulo.innerText = produtos[i].nome.substring(0, 20)

      let imagem = document.createElement("img")
      imagem.src = "imagens/" + produtos[i].imagem
      imagem.alt = produtos[i].nome

      let valor = document.createElement("p")
      valor.innerText = produtos[i].valor.toLocaleString("pt-br", {
        style: "currency",
        currency: "BRL",
      });

      let botao = document.createElement("button")
      botao.classList.add("btn", "btn-primary")
      botao.innerHTML = "Comprar"
      botao.value = i
      botao.onclick = function () {
        if (localStorage.getItem("produto") == undefined) {
          let objProdutoSelecionado = [
            {
              id: this.value,
              qtd: 1,
            },
          ]
  
          localStorage.setItem("produto", JSON.stringify(objProdutoSelecionado))
        } else {
          let vetorProd = JSON.parse(localStorage.getItem("produto"))
          let indice = vetorProd.findIndex((e) => {
            return e.id == this.value
          })
  
          if (indice == -1) {
            let objProdutoSelecionado = {
              id: this.value,
              qtd: 1,
            }
  
            vetorProd.push(objProdutoSelecionado)
  
            localStorage.setItem("produto", JSON.stringify(vetorProd))
          } else {
            let objProdutoSelecionado = vetorProd[indice]
            objProdutoSelecionado.qtd++
  
            vetorProd[indice] = objProdutoSelecionado
  
            localStorage.setItem("produto", JSON.stringify(vetorProd))
          }
        }
      };

      card.appendChild(imagem)
      card.appendChild(titulo)
      card.appendChild(valor)
      card.appendChild(botao)
      coluna.appendChild(card)

      listarProdutos.appendChild(coluna)
    }
  }

  if (!produtoEncontrado) {
    alert("Produto não encontrado!")
  }
}

function filtrarProdutos(segmento) {
  let listarProdutos = document.getElementById("listarProdutos")
  listarProdutos.remove()

  listarProdutos = criarListaProdutos()

  let subTitulo = document.createElement("h2")
  subTitulo.classList.add("subTitulo")

  subTitulo.innerText = segmento

  listarProdutos.appendChild(subTitulo)

  for (let i = 0; i < produtos.length; i++) {
    if (produtos[i].segmento === segmento) {
      let coluna = document.createElement("div")
      coluna.classList.add("col-3")

      let card = document.createElement("div")
      card.classList.add("card", "prod")

      let titulo = document.createElement("h1")
      titulo.innerText = produtos[i].nome.substring(0, 20)

      let imagem = document.createElement("img")
      imagem.src = "imagens/" + produtos[i].imagem
      imagem.alt = produtos[i].nome

      let valor = document.createElement("p")
      valor.innerText = produtos[i].valor.toLocaleString("pt-br", {
        style: "currency",
        currency: "BRL",
      });

      let botao = document.createElement("button")
      botao.classList.add("btn", "btn-primary")
      botao.innerHTML = "Comprar"
      botao.value = i
      botao.onclick = function () {
        if (localStorage.getItem("produto") == undefined) {
          let objProdutoSelecionado = [
            {
              id: this.value,
              qtd: 1,
            },
          ]
  
          localStorage.setItem("produto", JSON.stringify(objProdutoSelecionado))
        } else {
          let vetorProd = JSON.parse(localStorage.getItem("produto"))
          let indice = vetorProd.findIndex((e) => {
            return e.id == this.value
          })
  
          if (indice == -1) {
            let objProdutoSelecionado = {
              id: this.value,
              qtd: 1,
            }
  
            vetorProd.push(objProdutoSelecionado)
  
            localStorage.setItem("produto", JSON.stringify(vetorProd))
          } else {
            let objProdutoSelecionado = vetorProd[indice]
            objProdutoSelecionado.qtd++
  
            vetorProd[indice] = objProdutoSelecionado
  
            localStorage.setItem("produto", JSON.stringify(vetorProd))
          }
        }
      }

      card.appendChild(imagem)
      card.appendChild(titulo)
      card.appendChild(valor)
      card.appendChild(botao)

      coluna.appendChild(card)

      listarProdutos.appendChild(coluna)
    }
  }
}

