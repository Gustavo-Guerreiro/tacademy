const REGISTROS = []

function addRegistro() {
    let nome = document.querySelector("#nome").value
    let marca = document.querySelector("#marca").value
    let valor = parseFloat(document.querySelector("#valor").value)

    REGISTROS.push({
        "nome": nome,
        "marca":marca,
        "valor":valor
    })

    atualizarTabela()
}

function atualizarTabela(){
    let tbody =  document.querySelector(".table tbody")
    tbody.innerHTML = ""
    let str = ''
    for (let registro of REGISTROS) {
        str += `<tr><td>${registro["nome"]}</td><td>${registro["marca"]}</td><td>R$${registro["valor"].toFixed(2)}</td></tr>`
    }

    tbody.innerHTML = str
}