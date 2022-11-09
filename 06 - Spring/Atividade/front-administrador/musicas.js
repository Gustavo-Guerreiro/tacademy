let vetor = []

let vetorPesquisa = []

window.onload = function (){
    obterMusicas()
}

function obterMusicas() {
    fetch("http://localhost:8080/musica")
        .then(retorno => retorno.json())
        .then(musicas => vetor = musicas)
        .then(() => listarMusicas())
}

function listarMusicas() {
    let tabela = document.querySelector("#listaMusicas tbody")
    tabela.innerHTML = ""
    for (let  i = 0; i < vetor.length; i++) {
        tabela.innerHTML +=
            `
           <tr>
                <td>${i+1}</td>
                <td>${vetor[i].nmMusica}</td>
                <td>
                    <button 
                        onclick="modoAlteracao(${vetor[i].cdMusica}, '${vetor[i].nmMusica}' )"
                        class="btn btn-warning">
                            Alterar
                    </button>
                </td>
                <td>
                    <button 
                        onclick="removerMusica(${vetor[i].cdMusica})"
                        class="btn btn-danger">
                            Remover
                    </button>
                </td>
           </tr>
            `
    }
}

function cadastrarMusica() {
    let nome = document.querySelector("#nomeMusica").value

    let obj = {
        "nmMusica": nome
    }

    fetch("http://localhost:8080/musica", {
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
    listarMusicas()
    limparFormulario()

}

function modoAlteracao(codigo, nome) {
    document.querySelector("#codigoMusica").value = codigo
    document.querySelector("#nomeMusica").value = nome
    document.querySelector("#alteracao").style.display = "inline-block"
    document.querySelector("#cadastro").style.display = "none"
}

function alterarMusica() {
    let codigo = parseInt(document.querySelector("#codigoMusica").value)
    let novoNome = document.querySelector("#nomeMusica").value

    let obj = {
        "cdMusica":codigo,
        "nmMusica":novoNome
    }
    fetch("http://localhost:8080/musica", {
        method:"PUT",
        headers: {
            "accept": "application/json",
            "content-type": "application/json"
        },
        body:JSON.stringify(obj)
    })
        .then(() => {
            obterMusicas()
            limparFormulario()
        })
}

function removerMusica(codigo) {

    fetch(`http://localhost:8080/musica/${codigo}`,{
        method:"DELETE"
    })
        .then(() => {
            let posicaoVetor = vetor.findIndex(objLinha => {
                return objLinha.cdMusica === codigo
            })

            vetor.splice(posicaoVetor, 1)

            listarMusicas()

            limparFormulario()
        })
}

function limparFormulario() {
    document.querySelector("#nomeMusica").value = ""

    document.querySelector("#cadastro").style.display = "inline-block"
    document.querySelector("#alteracao").style.display = "none"
}
