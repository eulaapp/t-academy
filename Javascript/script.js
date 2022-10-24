// Vetor
let dados = [];

// ao carregar o projeto
window.onload = function() {
    dados = JSON.parse(localStorage.getItem('vetor'));

    selecionar();
}

// função para atualizar o vetor no local storage
function ls() {
    localStorage.setItem('vetor', JSON.stringify(dados))
}

// Função para efetuar o cadastro de usuários
function cadastrar() {
    // Manipular elementos HTML

    let nome = document.getElementById('nome');
    let cidade = document.getElementById('cidade');
    let alerta = document.getElementById('alerta');

    // remover as classes alert-danger e alert-success
    alerta.classList.remove('alert-danger')
    alerta.classList.remove('alert-success')

    if (nome.value == '') {
        alerta.innerHTML = 'Favor informar o nome';
        alerta.classList.add('alert-danger')
        nome.focus();
    } else if (cidade.value == '') {
        alerta.innerHTML = 'Favor informar o nome da cidade';
        alerta.classList.add('alert-danger')
        cidade.focus();
    } else {
        // Mensagem no alerta
        alerta.innerHTML = 'Cadastrado efetuado com sucesso!';

        alerta.classList.add('alert-success')

        // criar objeto json
        let obj = {
            'nome': nome.value,
            'cidade': cidade.value
        }

        // cadastrar no vetor
        dados.push(obj);

        // atualizar tabela
        selecionar();

        // LocalStorage
        ls()

    }
}

// função para listar os dados dos usuários
function selecionar() {
    // obter tbody
    let tabela = document.getElementById('tabela')

    // limpar os conteúdos da tabela
    tabela.innerHTML = '';

    // laço de repetição
    for (let i = 0; i < dados.length; i++) {
        // criar linha de tabela
        let linha = tabela.insertRow(-1)

        // criar colunas
        let col1 = linha.insertCell(0)
        let col2 = linha.insertCell(1)
        let col3 = linha.insertCell(2)
        let col4 = linha.insertCell(3)

        // conteúdo das colunas
        col1.innerHTML = i+1;
        col2.innerHTML = dados[i].nome;
        col3.innerHTML = dados[i].cidade;
        // col4.innerHTML = "<button class='btn btn-danger onclick='remover("+i+")'>Remover</button>"
        col4.innerHTML = `<button class="btn btn-danger" onclick="remover(${i})">Remover</button>`
    }
}

// função para remover usuário
function remover(index) {
    dados.splice(index, 1)

    selecionar()
    ls()
}