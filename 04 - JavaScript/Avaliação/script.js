// Cria um vetor para o carrinho
let carrinho = []

/*
    Assim que a página carregar o carrinho será pego do localStorage caso existir,
    se a página for o index serão carregados os produtos aleatórios
    se a página foi a pesquisa o termo salvo no localStorage será carregado e
    a grid será populada, se for o carrinho o carrinho será carregado
 */
window.onload = function () {
    if (localStorage.getItem("carrinho") != null) {
        carrinho = JSON.parse(localStorage.getItem("carrinho"))
    }
    if (window.location.pathname.includes("index.html")) {
        popularProdutosAleatorios()
    }
    if (window.location.pathname.includes("pesquisa.html")){
        popularPesquisa(localStorage.getItem("pesquisa"))
    }
    if (window.location.pathname.includes("carrinho.html")){
        popularCarrinho()
    }
}

/*
    Irá pegar produtos aleatórios definidos por uma array de números inteiros aleatórios
    que representam os índices do vetor de produtos
 */
function popularProdutosAleatorios() {
    let arrayAleatoria = gerarArrayAleatoria()
    let divProdutos = document.querySelector("#mainPrincipal .produtos-grid")
    divProdutos.innerHTML = ""
    for (let i of arrayAleatoria) {
        let produto = produtos[i]
        inserirCard(produto, divProdutos, i)
    }
}

/*
    Usa o set para guardar números únicos e aleatórios
 */
function gerarArrayAleatoria() {
    const numeros = new Set()
    while (numeros.size < 12) {
        numeros.add(Math.floor((Math.random()*produtos.length)))
    }
    return [...numeros]
}

/*
    Código para inserir um card padronizado a partir do objeto de produto
    da tabela onde este card será colocado e do índice daquele produto no vetor
 */
function inserirCard(produto, tabela, indice) {
    let nomeSegmento
    switch (produto.segmento){
        case "eletronico":
            nomeSegmento = "Eletrônicos"
            break
        case "automovel":
            nomeSegmento = "Automotivo"
            break
        case "alimento":
            nomeSegmento = "Alimentos"
            break
    }
    let tagPreco = `<p class="card-text">R$${produto.valor.toLocaleString("pt-BR", {minimumFractionDigits: 2})}</p>`
    if (produto.estoque === 0){
        tagPreco = '<p class="card-text">Esgotado :(</p>'
    }

    tabela.innerHTML += `
        <div class="card d-flex align-items-center text-center">
        <div>
            <img class="card-img-top" src="${produto.imagem}" alt="">
            <div class="card-body text-center">
                <h5 class="card-title">${produto.nome}</h5>
                <h6 class="card-subtitle">${nomeSegmento}</h6>
                ${tagPreco}
                <button class="btn btn-outline-dark align-bottom" onclick="addCarrinho(${indice})">Adicionar ao Carrinho</button>
            </div>
        </div>
            
        </div>
        `
}

/*
    Função que irá popular o grid do menu filtrando os produtos por seu segmento
 */
function popularMenu() {
    let segmento = document.querySelector("#segmento").value
    let gridMenu = document.querySelector("#mainMenu .produtos-grid")
    gridMenu.innerHTML = ""
    for (let i = 0; i < produtos.length; i++) {
        if (produtos[i].segmento === segmento) {
            inserirCard(produtos[i], gridMenu, i)
        }
    }
}

/*
    Irá guardar o termo da pesquisa no localStorage para ser acessada
    por outra página
 */
function setTermo() {
    let termo = document.querySelector('#termo').value
    localStorage.setItem("pesquisa", termo)
    localStorage.setItem("pesquisa", termo)
}

/*
    Irá popular a grid da pesquisa filtrando os nomes dos produtos pelo termo
    salvo no localStorage
 */
function popularPesquisa(termo) {
    if (termo.toUpperCase() === "BISCOITO") {
        termo = "BOLACHA"
    }
    let contador = 0
    if (termo != null) {
        let gridPesquisa = document.querySelector("#mainPesquisa .produtos-grid")
        for (let i = 0; i < produtos.length; i++) {
            if (produtos[i].nome.toUpperCase().includes(termo.toUpperCase())) {
                inserirCard(produtos[i], gridPesquisa, i)
                contador++
            }
        }
    }
    if (contador === 1) {
        document.querySelector("#mainPesquisa h1").innerHTML = "1 Produto Encontrado"
    } else {
        document.querySelector("#mainPesquisa h1").innerHTML = `${contador} Produtos Encontrados`
    }
}

/*
    Adiciona um produto ao carrinho, o produto é representado pelo seu índice no vetor
    de produtos e uma quantidade
 */
function addCarrinho(indice) {
    let produto = produtos[indice]
    console.log(produto.estoque)
    console.log(carrinho)

    for (let i = 0; i < carrinho.length; i++) {
        if (produtos[carrinho[i].idProduto] === produto) {
            if (produto.estoque > 0) {
                produto.estoque--
                carrinho[i].qtd++
                localStorage.setItem("carrinho", JSON.stringify(carrinho))
                return
            } else {
                alert("Produto esgotado")
                return
            }
        }
    }
    let itemPedido = {
        "idProduto": indice,
        "qtd": 0
    }
    carrinho.push(itemPedido)
    localStorage.setItem("carrinho", JSON.stringify(carrinho))
}

/*
    Itera sobre os produtos do carrinho e calcula o valor total da compra multiplicando
    todos os preços pelas suas respectivas quantiades e as somando ao total
 */
function calcularValorTotal() {
    let valorFinal = 0
    for (let i = 0; i < carrinho.length; i++) {
        valorFinal += produtos[carrinho[i].idProduto].valor * carrinho[i].qtd
    }
    return valorFinal
}

/*
    Itera sobre o vetor de carrinhos pegando os produtos e os exibindo
 */
function popularCarrinho() {
    let mainCarrinho = document.querySelector("#mainCarrinho .produtos-grid")
    mainCarrinho.innerHTML = ""
    if (carrinho.length !== 0) {
        for (let i = 0; i < carrinho.length; i++) {
            mainCarrinho.innerHTML += `
            <div class="card">
                <div class="card-header">
                    <h5> &zwnj;  </h5>
                    <p class="card-text d-flex text-dark" onclick="removerItemCarrinho(${i})">X</p>
                </div>
                
                <div class="card-body text-center">
                    <h5 class="card-title">${produtos[carrinho[i].idProduto].nome}</h5>
                    <img src="${produtos[carrinho[i].idProduto].imagem}" alt="">
                    <label for="quantidade" class="card-text">Quantidade:</label>
                    <input class="form-control" onchange=" alterarQuantidade( ${i} ) " type="number" id="quantidade${i}" value="${carrinho[i].qtd}">
                    <p class="card-text" id="valor${i}">Valor: R$${(produtos[carrinho[i].idProduto].valor * carrinho[i].qtd).toLocaleString("pt-BR", {minimumFractionDigits: 2})}</p>
                    <p class="card-text" id="qtdDisponivel${i}">Quantidade disponível: ${produtos[carrinho[i].idProduto].estoque}</p>
                </div>
            </div>
            `
        }

        mainCarrinho.innerHTML += `
        <div id="valorFinal" class="text-end">
            <p>Valor Final: R$${calcularValorTotal().toLocaleString("pt-BR", {minimumFractionDigits: 2})}</p>
            <button class="btn btn-dark" onclick="confirmarCompra()">Confirmar Compra</button>
        </div>
        `
    } else {
        mainCarrinho.innerHTML += '<h1>Não há produtos no carrinho</h1>'
    }
}

/*
    Altera a quantidade de um item no carrinho, fazendo todas as validações possíveis para
    que erros não ocorram, incluindo comparação com a quantidade do estoque, validação de negativos
    e números "quebrados", bem como atualizando todas as informações visuais como preços para
    estarem condizentes com a nova quantidade dequele produto
 */
function alterarQuantidade(id) {
    let newQtd = document.querySelector("#quantidade"+id).value
    let oldQtd = carrinho[id].qtd
    let diferenca = Math.abs(oldQtd - newQtd)

    if (newQtd >= 0 && (newQtd - Math.floor(newQtd)) === 0) {
        if (newQtd >= oldQtd) {
            if (produtos[carrinho[id].idProduto].estoque - diferenca >= 0) {
                produtos[carrinho[id].idProduto].estoque -= diferenca
                carrinho[id].qtd = newQtd
            } else {
                alert("Quantidade máxima excedida")
                document.querySelector("#quantidade"+id).value = carrinho[id].qtd
            }
        } else {
            produtos[carrinho[id].idProduto].estoque += diferenca
            carrinho[id].qtd = newQtd
        }
    } else {
        alert("Quantidade inválida")
        document.querySelector("#quantidade"+id).value = carrinho[id].qtd
    }
    document.querySelector("#valor"+id).innerHTML = "Valor: R$" + (produtos[carrinho[id].idProduto].valor * carrinho[id].qtd).toLocaleString("pt-BR", {minimumFractionDigits: 2})
    document.querySelector("#qtdDisponivel"+id).innerHTML = "Quantidade disponível: " + produtos[carrinho[id].idProduto].estoque
    document.querySelector("#valorFinal p").innerHTML = "Valor Final: R$"+ calcularValorTotal().toLocaleString("pt-BR", {minimumFractionDigits: 2})
}

/*
    Remove um produto do vetor e atualiza o carrinho
 */
function removerItemCarrinho(id) {
    let qtd = carrinho[id].qtd
    produtos[carrinho[id].idProduto].estoque += qtd
    carrinho.splice(id,1)
    localStorage.setItem("carrinho", JSON.stringify(carrinho))
    popularCarrinho()
}

/*
    Confirma a compra, modificando em definitivo os estoques dos produtos
    no localStorage, apagando o vetor do carrinho no localStorage e
    após 5 segundos a página será automaticamente redirecionada
    para a inicial
 */
function confirmarCompra() {
    localStorage.setItem("produtos", JSON.stringify(produtos))
    document.querySelector("#mainCarrinho").innerHTML = '<h1>Compra Efetuada</h1>'
    carrinho = []
    localStorage.setItem("carrinho", JSON.stringify(carrinho))
    setTimeout(() => {
        window.location.href = 'index.html'
    }, 5000)
}