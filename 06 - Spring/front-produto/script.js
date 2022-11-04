// Vetor de produtos
let vetor = [];

// Ao carregar a página HTML
window.onload = function(){
    // Armazenar produtos no vetor e listar
    obterProdutos()

}

// Obter todos os produtos
function obterProdutos() {

    fetch("http://localhost:8080")
    .then(retorno => retorno.json())
    .then(produtos => vetor = produtos)
    .then(() => listarProdutos())

}

// Listar os produtos do vetor na tabela
function listarProdutos() {

    // Obter elemento de tabela
    let tabela = document.getElementById("tabela")

    // Limpar conteúdos da tabela
    tabela.innerHTML = ""

    // Laço de repetição
    for (let i = 0; i < vetor.length; i++) {

        // Criar linha
        let linha = tabela.insertRow(-1)

        // Criar as colunas
        let colunaCodigo = linha.insertCell(0)
        let colunaNome = linha.insertCell(1)
        let colunaValor = linha.insertCell(2)
        let colunaSelecionar = linha.insertCell(3)

        // Dados das colunas
        colunaCodigo.innerText = vetor[i].codigo 
        colunaNome.innerText = vetor[i].nome 
        colunaValor.innerText = vetor[i].valor 
        
        colunaSelecionar.innerHTML = '<button class="btn btn-success">Selecionar</button>'


    }

}