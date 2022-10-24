let descricoes = new Map()

descricoes.set("blumenau", "essa é a descrição da bela cidade de Blumenau")
descricoes.set("pomerode", "esse é um texto que esta descrevendo pomerode")
descricoes.set("gaspar", "gaspar está sendo descrita aqui")

function pegarCidade() {
    let cidade = document.querySelector(".form-select").value
    let descricao = descricoes.get(cidade)
    document.querySelector("#descricao").innerHTML = descricao
}