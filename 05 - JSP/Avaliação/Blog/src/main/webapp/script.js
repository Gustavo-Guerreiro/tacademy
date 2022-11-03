function validaCadastro() {

    document.querySelector("#alerta").innerHTML = ''
    let email = document.querySelector("#email").value
    let confEmail = document.querySelector("#confEmail").value
    let senha = document.querySelector("#senha").value
    let confSenha = document.querySelector("#confSenha").value

    if (email === confEmail && senha === confSenha) {
        return true
    }
    if (email !== confEmail) {
        document.querySelector("#alerta").innerHTML =
            `<div class="alert alert-danger">Os e-mails não são iguais</div>`
        return false
    }

    document.querySelector("#alerta").innerHTML =
        `<div class="alert alert-danger">As senhas não são iguais</div>`
    return false



}