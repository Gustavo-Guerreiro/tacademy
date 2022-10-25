function gerarTabela() {
    let numero = document.querySelector("#numero").value
    let str = ""
    for (let i = 0; i <= 10; i++) {
        str += `<li>${numero} x ${i} = ${numero*i} </li>`
    }
    document.querySelector("#tabuada").innerHTML = str
}