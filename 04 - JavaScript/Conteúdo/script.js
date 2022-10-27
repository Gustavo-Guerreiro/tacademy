// Vetor
let dados = [];

window.onload = function() {
    dados = JSON.parse(localStorage.getItem("vetor"))

    selecionar()
}

//Função para atualizar o vetor no local storage
function ls(){
    localStorage.setItem("vetor", JSON.stringify(dados))
}

// Função para efetuar o cadastro dos usuários
function cadastrar(){
    // Manipular Elementos
    let nome = document.getElementById("nome")
    let cidade = document.getElementById("cidade")
    let alerta = document.getElementById("alerta")

    // Remover as classes alert-danger e alert-success
    alerta.classList.remove("alert-danger")
    alerta.classList.remove("alert-success")

    if (nome.value == "") {
        alerta.innerText = "Favor informar o nome"
        alerta.classList.add("alert-danger")
        nome.focus()
    } else if (cidade.value == "") {
        alerta.innerText = "Favor informar a cidade"
        alerta.classList.add("alert-danger")
        cidade.focus()
    } else {
        // Mensagem do alerta
        alerta.innerHTML = "Cadastro efetuado com sucesso"

        //Alterar cor do sucesso
        alerta.classList.add("alert-success")

        // Criar objeto JSON
        let obj = {
            "nome":nome.value,
            "cidade":cidade.value
        }

        // Cadastrar no vetor
        dados.push(obj)

        // Atualizar tabela de usuários
        selecionar()

        // LocalStorage
        ls()

    }
    
}

// Função para listar os dados dos usuários
function selecionar() {

    // Obter o tbody
    let tabela = document.getElementById("tabela")

    // Limpar tabela
    tabela.innerHTML = ""

    // Laço de repetição
    for (let i = 0; i<dados.length; i++) {
        // Criar linha de tabela
        let linha = tabela.insertRow(-1)

        // Criar colunas na tabela
        let col1 = linha.insertCell(0)
        let col2 = linha.insertCell(1)
        let col3 = linha.insertCell(2)
        let col4 = linha.insertCell(3)

        // Conteúdos das colunas
        col1.innerHTML = i+1
        col2.innerHTML = dados[i].nome
        col3.innerHTML = dados[i].cidade
        col4.innerHTML = `<button class='btn btn-danger' onclick='remover(${i})'>Remover</button>`
    }

}

function remover(indice) {
    dados.splice(indice, 1)

    selecionar()

    ls()
}