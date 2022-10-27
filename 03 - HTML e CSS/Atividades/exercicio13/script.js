let alunos = []

window.onload = function () {
    let alunosStorage = localStorage.getItem("alunos")

    if(alunosStorage != null) {
        alunos = alunosStorage
    }
}

function addAluno() {
    let nome = document.querySelector("#nome").value
    let n1 = document.querySelector("#nota1").value
    let n2 = document.querySelector("#nota2").value
    let genero = document.querySelector("#genero").value

    let aluno = {
        "nome": nome,
        "nota1": n1,
        "nota2": n2,
        "genero": genero,
    }

    alunos.push(aluno)

    localStorage.setItem("alunos", alunos)

}

function atualizarTabela() {
    let tbody = document.querySelector("tbody")
    for (let aluno of alunos) {
        let linha = tbody.insertRow(-1)
        linha.insertCell(0).innerHTML = aluno.nome
        linha.insertCell(1).innerHTML = aluno.nota1
        linha.insertCell(2).innerHTML = aluno.nota2
        linha.insertCell(3).innerHTML = ( parseFloat(aluno.nota1) +  parseFloat(aluno.nota2)) / 2



    }
}
