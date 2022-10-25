let registros = []

window.onload = function () {
    let lsRegistro = JSON.parse(localStorage.getItem("registros"))
    if (lsRegistro != null) {
        registros = lsRegistro
    }

    atualizarTabela()
}

function addRegistro() {
    let nome = document.querySelector("#nome").value
    let marca = document.querySelector("#marca").value
    let valor = parseFloat(document.querySelector("#valor").value)

    registros.push({
            "nome": nome,
            "marca":marca,
            "valor":valor
        }
    )

    atualizarTabela()

    localStorage.setItem("registros", JSON.stringify(registros))
}

function atualizarTabela(){
    let tbody =  document.querySelector("tbody")

    tbody.innerHTML = ""

    for (let i = 0; i < registros.length; i++) {
        let linha = tbody.insertRow(-1)

        let col1 = linha.insertCell(0)
        col1.innerHTML = registros[i].nome

        let col2 = linha.insertCell(1)
        col2.innerHTML = registros[i].marca

        let col3 = linha.insertCell(2)
        col3.innerHTML = `R$${parseFloat(registros[i].valor).toFixed(2)}`

    }

    let tfoot = document.querySelector("tfoot tr td")
    tfoot.innerHTML = `${registros.length} registro(s) feito(s).`
}