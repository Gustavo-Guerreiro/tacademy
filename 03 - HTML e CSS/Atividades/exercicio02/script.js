function exibirPreco() {
    let valor = parseFloat(document.querySelector("#valor").value)
    let formaPagamento = document.querySelector("input[name='forma-pagamento']:checked")
    let areaValor = document.querySelector("#valorFinal")

    if (formaPagamento.id === "vista" && valor < 100) {
        valor = (valor*0.9)
    }
    areaValor.innerHTML = `Valor final: R$ ${(valor).toFixed(2)}`
}