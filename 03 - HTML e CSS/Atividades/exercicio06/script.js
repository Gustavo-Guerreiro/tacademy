function getSigno() {
    let input = document.querySelector("#data").value
    let data = new Date(input)
    let signo;
    let mes = data.getMonth()+1
    let dia = data.getUTCDate()

    if ((dia <= 21 && mes == 3) || (dia <= 19 && mes == 4)) {
        signo = "Áries"
    } else if ((dia <= 20 && mes == 4) || (dia <= 20 && mes == 5)) {
        signo = "Touro"
    } else if ((dia <= 21 && mes == 5) || (dia <= 21 && mes == 6)) {
        signo = "Gêmeos"
    } else if ((dia <= 22 && mes == 6) || (dia <= 22 && mes == 7)) {
        signo = "Câncer"
    } else if ((dia <= 23 && mes == 7) || (dia <= 22 && mes == 8)) {
        signo = "Leão"
    } else if ((dia <= 23 && mes == 8) || (dia <= 22 && mes == 9)) {
        signo = "Virgem"
    } else if ((dia <= 23 && mes == 9) || (dia <= 22 && mes == 10)) {
        signo = "Libra"
    } else if ((dia <= 23 && mes == 10) || (dia <= 21 && mes == 11)) {
        signo = "Escorpião"
    } else if ((dia <= 22 && mes == 11) || (dia <= 21 && mes == 12)) {
        signo = "Sagitário "
    } else if ((dia >= 22 && mes == 12) || (dia <= 19 && mes == 1)) {
        signo = "Capricórnio"
    } else if ((dia >= 20 && mes == 1) || (dia <= 18 && mes == 2)) {
        signo = "Aquário"
    } else {
        signo = "Peixes"
    }

    document.querySelector("#signo").innerHTML = signo
}