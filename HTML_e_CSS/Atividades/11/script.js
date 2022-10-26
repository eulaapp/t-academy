let produtos = []

function cadastrar() {
    let nome = document.getElementById("nome-produto").value
    let marca = document.getElementById("marca-produto").value
    let valor = document.getElementById("valor").value

    let produto = {
        'nome': nome,
        'marca': marca,
        'valor': valor
    }

    produtos.push(produto)

    listarProdutos()
}

function listarProdutos() {
    let tabela = document.getElementById("table")

    tabela.innerHTML = ""

    for (let i = 0; i < produtos.length; i++) {
        let linha = tabela.insertRow(-1)

        let col1 = linha.insertCell(0)
        let col2 = linha.insertCell(1)
        let col3 = linha.insertCell(2)
        let col4 = linha.insertCell(3)

        col1.innerHTML = i+1;
        col2.innerHTML = produtos[i].nome;
        col3.innerHTML = produtos[i].marca;
        col4.innerHTML = produtos[i].valor;
        
    }
}