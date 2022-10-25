let candidato1 = 0
let candidato2 = 0
let candidato3 = 0
let candidato4 = 0
let nulo = 0

function addCandidato1() {
    candidato1++
    document.querySelector("#candidato1").innerHTML = `O candidato 1 obteve ${candidato1} votos.`
    atualizarTotal()
    atualizarVencedores()

}
function addCandidato2() {
    candidato2++
    document.querySelector("#candidato2").innerHTML = `O candidato 2 obteve ${candidato2} votos.`
    atualizarTotal()
    atualizarVencedores()
}
function addCandidato3() {
    candidato3++
    document.querySelector("#candidato3").innerHTML = `O candidato 3 obteve ${candidato3} votos.`
    atualizarTotal()
    atualizarVencedores()
}

function addCandidato4() {
    candidato4++
    document.querySelector("#candidato4").innerHTML = `O candidato 4 obteve ${candidato4} votos.`
    atualizarTotal()
    atualizarVencedores()
}

function addNulo() {
    nulo++
    document.querySelector("#nulo").innerHTML = `Houveram ${nulo} votos nulos.`
    atualizarTotal()
    atualizarVencedores()
}

function atualizarTotal(){
    let soma = candidato4 + candidato3 + candidato2 + candidato1 + nulo
    document.querySelector('#total').innerHTML = `No total houveram ${soma} votos.`
}

function atualizarVencedores(){
    let votos = [nulo, candidato1, candidato2, candidato3, candidato4]
    let maiorVoto = Math.max(candidato1, candidato2, candidato3, candidato4)
    let str = ""
    for (let i = 1; i<votos.length; i++) {
        if (votos[i] === maiorVoto)  {
            str += `<li>Candidato ${i} com ${votos[i]} votos</li>`
        }
    }
    document.querySelector("#vencedores").innerHTML = str
}
