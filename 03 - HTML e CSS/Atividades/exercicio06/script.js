function getSigno{
    let input = document.querySelector("#data").value
    let data = new Date(input)
    let signo;
    let mes = data.getMonth()
    let dia = data.getDay()


    if ((dia<=21 && mes == 3) || (dia<=20 && mes ==4)){
        signo = "Áries"
    } else if ((dia<=21 && mes == 4) || (dia<=20 && mes == 5)){
        signo = "Touro"
    } else if ((dia<=21 && mes == 5) || (dia<=20 && mes == 6)) {
        signo = "Gêmeos"
    } else if ((dia<=21 && mes == 6) || (dia<=22 && mes == 7)) {
        signo = "Câncer"
    } else if ((dia<=23 && mes == 7) || (dia<=22 && mes == 8)) {
        signo = "Leão"
    } else if ((dia<=23 && mes == 8) || (dia<=22 && mes == 9)) {
        signo = "Virgem"
    } else if ((dia<=23 && mes == 9) || (dia<=22 && mes == 10)) {
        signo = "Libra"
    } else if ((dia<=23 && mes == 10) || (dia<=21 && mes == 11)) {

    }

    //
    // if (mes == 1) {
    //     if (dia >= 20){
    //         signo = "Capricórnio"
    //     } else {
    //         signo = "Aquário"
    //     }
    // } else if (mes == 2) {
    //     if (dia>=18) {
    //         signo = "Aquário"
    //     } else {
    //         signo = "Peixes"
    //     }
    // } else if (mes == 3) {
    //     if(dia>=20) {
    //         signo = "Peixes"
    //     } else {
    //         signo = "Áries"
    //     }
    // }

}