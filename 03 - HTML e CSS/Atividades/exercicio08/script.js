function converterHora() {

        let input = document.querySelector("#tempo").value
        let fuso = document.querySelector("input[name='cidade']:checked").value

        let data = new Date("December 31, 1999 " + input)

        let dataConvertida = new Date(data.toLocaleString("en-US", {timeZone: fuso}))

        document.querySelector("#hora").innerHTML = dataConvertida.getUTCHours()
            + ":" + dataConvertida.getUTCMinutes()


}