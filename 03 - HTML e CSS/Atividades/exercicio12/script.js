let registros = []
let userId = -1

window.onload = function () {
    let lsRegistro = JSON.parse(localStorage.getItem("vetor"))
    if (lsRegistro != null) {
        registros = lsRegistro
    }

    atualizarTabela()
}

function cadastrar() {
    let nome = document.querySelector("#nome").value
    let nascimento = (new Date(document.querySelector("#data").value)).toLocaleDateString("pt-BR")
    let email = document.querySelector("#email").value
    let telefone = document.querySelector("#telefone").value

    if (nome !== "" && nascimento != null && email !== "" && telefone !== "") {
        registros.push({
                "nome": nome,
                "nascimento": nascimento,
                "email": email,
                "telefone": telefone
            }
        )

        localStorage.setItem("vetor", JSON.stringify(registros))

        atualizarTabela()
    }
}

function atualizarTabela() {
    let tbody = document.querySelector("tbody")

    tbody.innerHTML = ""

    for (let i = 0; i < registros.length; i++) {
        let linha = tbody.insertRow(-1)

        let diaNascimento = parseInt(registros[i].nascimento.split('/')[0])+1
        let mesNascimento = parseInt(registros[i].nascimento.split('/')[1])
        let anoNascimento = parseInt(registros[i].nascimento.split('/')[2])

        linha.insertCell(0).innerHTML = registros[i].nome
        linha.insertCell(1).innerHTML = `${diaNascimento}/${mesNascimento}/${anoNascimento}`
        linha.insertCell(2).innerHTML = registros[i].email
        linha.insertCell(3).innerHTML = registros[i].telefone
        linha.insertCell(4).innerHTML = `<button onclick="alterar(${i})" class="btn btn-warning">Alterar</button>`
        linha.insertCell(5).innerHTML = `<button onclick="remover(${i})" class="btn btn-danger">Remover</button>`
    }

    aniversariosMes()
}

function remover(indice) {
    registros.splice(indice,1)

    localStorage.setItem("vetor", JSON.stringify(registros))

    atualizarTabela()
}

function alterar(indice) {
    let user = registros[indice]

    document.querySelector("#nome").value = user.nome
    document.querySelector("#email").value = user.email
    document.querySelector("#telefone").value = user.telefone

    document.querySelector("#btnAlterar").classList.remove("esconder")

    userId = indice
}

function finalizarAlteracao() {
    let nome = document.querySelector("#nome").value
    let nascimento = (new Date(document.querySelector("#data").value)).toLocaleDateString("pt-BR")
    let email = document.querySelector("#email").value
    let telefone = document.querySelector("#telefone").value

    registros[userId] = {
        "nome": nome,
        "nascimento": nascimento,
        "email":email,
        "telefone": telefone
    }

    localStorage.setItem("vetor", JSON.stringify(registros))

    atualizarTabela()

    document.querySelector("#nome").value = ""
    document.querySelector("#email").value = ""
    document.querySelector("#telefone").value = ""

    document.querySelector("#btnAlterar").classList.add("esconder")
}

function aniversariosMes() {
    let presente = ""
    let passado = ""
    let futuro = ""
    for (let i = 0; i < registros.length; i++) {
        let hoje = (new Date()).toLocaleDateString("pt-BR")

        let diaNascimento = parseInt(registros[i].nascimento.split('/')[0]) +1
        let mesNascimento = parseInt(registros[i].nascimento.split('/')[1])

        let diaHoje = parseInt(hoje.split('/')[0])
        let mesHoje = parseInt(hoje.split('/')[1])

        if (mesHoje === mesNascimento) {
            if( diaHoje === diaNascimento ) {
                presente += `<li class="list-group-item">${registros[i].nome}</li>`
            }

            if( diaNascimento < diaHoje ) {
                passado += `<li class="list-group-item">${registros[i].nome}</li>`
            }

            if ( diaNascimento > diaHoje) {
                futuro += `<li class="list-group-item">${registros[i].nome}</li>`
            }
        }
    }
    document.querySelector("#aniversariantesDia").innerHTML = presente
    document.querySelector("#aniversariosPassados").innerHTML = passado
    document.querySelector("#proximosAniversariantes").innerHTML = futuro
}

