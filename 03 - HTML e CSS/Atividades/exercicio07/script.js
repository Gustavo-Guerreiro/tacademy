function descobrirMenor () {
    let n1 = parseInt(document.querySelector("#numero1").value)
    let n2 = parseInt(document.querySelector("#numero2").value)
    let n3 = parseInt(document.querySelector("#numero3").value)

    document.querySelector("#menor").innerHTML =
        "O menor número é " + Math.min(n1,n2,n3)
}