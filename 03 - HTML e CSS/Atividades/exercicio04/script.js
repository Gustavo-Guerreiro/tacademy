

function calcularValor (){

    let itens = document.querySelectorAll("input[type='checkbox']:checked")

    let total = 0;
    itens.forEach( (item) => {
            total += parseFloat(item.value)
        }
    )
    document.querySelector("#total").innerHTML = "Total: R$" + total
}