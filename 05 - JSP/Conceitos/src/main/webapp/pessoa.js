function valida() {
	// Obter nome e idade
	let nome = document.getElementById("nome").value
	let idade = parseInt(document.getElementById("idade").value)
	
	// Teste
	alert(nome + "\n" + idade)
	
	// Condicional
	if(nome === "") {
		alert("Informa o nome!")
		return false
	} else if (idade < 0 || idade > 120) {
		alert("Idade inválida!")
		return false
	} else {
		return true
	}

}