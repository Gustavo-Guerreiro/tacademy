function converter() {
    let conversao = document.querySelector("input[name='conversao']:checked").id
    let valor = parseFloat(document.querySelector("#valor").value)

    let conversoes = {
        "dolar_real": 5.28,
        "real_dolar": 0.19,
        "euro_real": 5.21,
        "real_euro":  0.19,
        "libra_real": 5.96,
        "real_libra": 0.17
    }

    document.querySelector("#valorFinal").innerHTML = (valor * conversoes[conversao]).toFixed(2)
}