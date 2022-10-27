function criarListaProdutos() {
  let main = document.getElementById("main");

  let listarProdutos = document.createElement("div");
  listarProdutos.classList.add("row");
  listarProdutos.id = "listarProdutos";

  main.appendChild(listarProdutos);

  return listarProdutos;
}

function listarTodosProdutos() {
  let listarProdutos = criarListaProdutos();
  let m = new Map();

  for (let i = 0; i < 12; i++) {
    let index = Math.floor(Math.random() * produtos.length);

    while (m.get(index)) {
      index = Math.floor(Math.random() * produtos.length);
    }

    m.set(index, true);

    let coluna = document.createElement("div");
    coluna.classList.add("col-3");

    let card = document.createElement("div");
    card.classList.add("card", "prod");

    let titulo = document.createElement("h1");
    titulo.innerText = produtos[index].nome.substring(0, 20);

    let imagem = document.createElement("img");
    imagem.src = "imagens/" + produtos[index].imagem;
    imagem.alt = produtos[index].nome;

    let valor = document.createElement("p");
    valor.innerText = produtos[index].valor.toLocaleString("pt-br", {
      style: "currency",
      currency: "BRL",
    });

    let botao = document.createElement("button");
    botao.classList.add("btn", "btn-primary");
    botao.value = index;
    botao.innerHTML = "Comprar";
    botao.onclick = function () {
      if (localStorage.getItem("produto") == undefined) {
        let objProdutoSelecionado = [
          {
            id: this.value,
            qtd: 1,
          },
        ];

        localStorage.setItem("produto", JSON.stringify(objProdutoSelecionado));
      } else {
        let vetorProd = JSON.parse(localStorage.getItem("produto"));
        let indice = vetorProd.findIndex((e) => {
          return e.id == this.value;
        });

        if (indice == -1) {
          let objProdutoSelecionado = {
            id: this.value,
            qtd: 1,
          };

          vetorProd.push(objProdutoSelecionado);

          localStorage.setItem("produto", JSON.stringify(vetorProd));
        } else {
          let objProdutoSelecionado = vetorProd[indice];
          objProdutoSelecionado.qtd++;

          vetorProd[indice] = objProdutoSelecionado;

          localStorage.setItem("produto", JSON.stringify(vetorProd));
        }
      }
    };

    card.appendChild(imagem);
    card.appendChild(titulo);
    card.appendChild(valor);
    card.appendChild(botao);
    coluna.appendChild(card);

    listarProdutos.appendChild(coluna);
  }
}

function pesquisar(e) {
  if (e.keyCode == 13) {
    pesquisarProdutos(document.getElementById("texto").value);
  }
}

function pesquisarProdutos(produto) {
  let listarProdutos = document.getElementById("listarProdutos");
  listarProdutos.remove();

  listarProdutos = criarListaProdutos();

  for (let i = 0; i < produtos.length; i++) {
    if (produtos[i].nome.toLowerCase().includes(produto.toLowerCase())) {
      let coluna = document.createElement("div");
      coluna.classList.add("col-3");

      let card = document.createElement("div");
      card.classList.add("card", "prod");

      let titulo = document.createElement("h1");
      titulo.innerText = produtos[i].nome.substring(0, 20);

      let imagem = document.createElement("img");
      imagem.src = "imagens/" + produtos[i].imagem;
      imagem.alt = produtos[i].nome;

      let valor = document.createElement("p");
      valor.innerText = produtos[i].valor.toLocaleString("pt-br", {
        style: "currency",
        currency: "BRL",
      });

      let botao = document.createElement("button");
      botao.classList.add("btn", "btn-primary");
      botao.innerHTML = "Comprar";

      card.appendChild(imagem);
      card.appendChild(titulo);
      card.appendChild(valor);
      card.appendChild(botao);
      coluna.appendChild(card);

      listarProdutos.appendChild(coluna);
    }
  }
}

function filtrarProdutos(segmento) {
  let listarProdutos = document.getElementById("listarProdutos");
  listarProdutos.remove();

  listarProdutos = criarListaProdutos();

  let subTitulo = document.createElement("h2");
  subTitulo.classList.add("subTitulo");

  subTitulo.innerText = segmento;

  listarProdutos.appendChild(subTitulo);

  for (let i = 0; i < produtos.length; i++) {
    if (produtos[i].segmento === segmento) {
      let coluna = document.createElement("div");
      coluna.classList.add("col-3");

      let card = document.createElement("div");
      card.classList.add("card", "prod");

      let titulo = document.createElement("h1");
      titulo.innerText = produtos[i].nome.substring(0, 20);

      let imagem = document.createElement("img");
      imagem.src = "imagens/" + produtos[i].imagem;
      imagem.alt = produtos[i].nome;

      let valor = document.createElement("p");
      valor.innerText = produtos[i].valor.toLocaleString("pt-br", {
        style: "currency",
        currency: "BRL",
      });

      let botao = document.createElement("button");
      botao.classList.add("btn", "btn-primary");
      botao.innerHTML = "Comprar";

      card.appendChild(imagem);
      card.appendChild(titulo);
      card.appendChild(valor);
      card.appendChild(botao);

      coluna.appendChild(card);

      listarProdutos.appendChild(coluna);
    }
  }
}

function salvarProdutosLocalStorage() {
  localStorage.setItem("produto", JSON.stringify(produtos[index]));
}

window.onload = function () {
  listarTodosProdutos();
};
