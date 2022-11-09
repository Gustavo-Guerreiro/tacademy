let vetor = []

let vetorPesquisa = []

window.onload = function (){
    obterArtistas()
}

function obterArtistas() {
    fetch("http://localhost:8080/artista")
        .then(retorno => retorno.json())
        .then(artistas => vetor = artistas)
        .then(() => listarArtistas())
}

function listarArtistas() {
    let tabela = document.querySelector("#listaArtistas tbody")
    tabela.innerHTML = ""
    for (let  i = 0; i < vetor.length; i++) {
        tabela.innerHTML +=
            `
           <tr>
                <td>${i+1}</td>
                <td>${vetor[i].nmArtista}</td>
                <td>
                    <button 
                        onclick="modoAlteracao(${vetor[i].cdArtista}, '${vetor[i].nmArtista}' )"
                        class="btn btn-warning">
                            Alterar
                    </button>
                </td>
                <td>
                    <button 
                        onclick="removerArtista(${vetor[i].cdArtista})"
                        class="btn btn-danger">
                            Remover
                    </button>
                </td>
           </tr>
            `
    }
}

function cadastrarArtista() {
    let nome = document.querySelector("#nomeArtista").value

    let obj = {
        "nmArtista": nome
    }

    fetch("http://localhost:8080/artista", {
        method:"POST",
        headers: {
            "accept": "application/json",
            "content-type": "application/json"
        },
        body:JSON.stringify(obj)
    })
        .then(retorno => retorno.json())
        .then(retorno_json => {
            vetor.push(retorno_json)
        })
    listarArtistas()
    limparFormulario()

}

function modoAlteracao(codigo, nome) {
    document.querySelector("#codigoArtista").value = codigo
    document.querySelector("#nomeArtista").value = nome
    document.querySelector("#alteracao").style.display = "inline-block"
    document.querySelector("#cadastro").style.display = "none"
}

function alterarArtista() {
    let codigo = parseInt(document.querySelector("#codigoArtista").value)
    let novoNome = document.querySelector("#nomeArtista").value

    let obj = {
        "cdArtista":codigo,
        "nmArtista":novoNome
    }
    fetch("http://localhost:8080/artista", {
        method:"PUT",
        headers: {
            "accept": "application/json",
            "content-type": "application/json"
        },
        body:JSON.stringify(obj)
    })
        .then(() => {
            obterArtistas()
            limparFormulario()
        })
}

function removerArtista(codigo) {

    fetch(`http://localhost:8080/artista/${codigo}`,{
        method:"DELETE"
    })
        .then(() => {
            let posicaoVetor = vetor.findIndex(objLinha => {
                return objLinha.cdArtista === codigo
            })

            vetor.splice(posicaoVetor, 1)

            listarArtistas()

            limparFormulario()
        })
}

function limparFormulario() {
    document.querySelector("#nomeArtista").value = ""

    document.querySelector("#cadastro").style.display = "inline-block"
    document.querySelector("#alteracao").style.display = "none"
}
