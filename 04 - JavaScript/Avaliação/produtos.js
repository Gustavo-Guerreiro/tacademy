// Criação de um vetor contendo objetos de diferentes produtos

let produtos =  [
    // eletronico
    {
        "nome": "Computador",
        "valor": 3229.90,
        "estoque": 8,
        "segmento": "eletronico",
        "imagem": "https://cdn.leroymerlin.com.br/products/computador_completo_icc_intel_core_i5_8gb_hd_2tb_monitor_19_a_1567830131_86bd_600x600.png"
    },
    {
        "nome": "Celular",
        "valor": 2300.50,
        "estoque": 15,
        "segmento": "eletronico",
        "imagem": "https://brmotorolanew.vtexassets.com/arquivos/ids/162756/2021_KYOTO_Basic-Pack_Mystic-Lagoon_PDP-HERO-5G.png?v=1753181746"
    },
    {
        "nome": "Fone de ouvido",
        "valor": 250,
        "estoque": 6,
        "segmento": "eletronico",
        "imagem": "https://img.irroba.com.br/fit-in/600x600/filters:fill(transparent):quality(95)/adrianae/catalog/api/adrianae_mercosis/20886-1.png"
    },
    {
        "nome": "Mouse",
        "valor": 500,
        "estoque": 20,
        "segmento": "eletronico",
        "imagem": "https://www.lenovo.com/medias/GY50X79385-mouse.png?context=bWFzdGVyfHJvb3R8OTE3NTN8aW1hZ2UvcG5nfGg0NS9oOWIvMTE2MjQ0NDQ1OTIxNTgucG5nfDA4MmUwNGYwMjk3ZDk0YWM2YzlkNDlkYTEzNjg4YzZlYjRhZWFjMDliZTQyZGVmOGVlY2VlNTgyYzAyYzVlZjk"
    },
    {
        "nome": "Impressora",
        "valor": 800.0,
        "estoque": 20,
        "segmento": "eletronico",
        "imagem": "https://s2.glbimg.com/3nin_aqADQfrHNpmbVsqnA7CWrA=/0x0:695x521/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/t/z/uF609MQ5iRu8HiZRzXOA/2015-01-26-c04339303.png"
    },
    {
        "nome": "Smartwatch",
        "valor": 1000.0,
        "estoque": 14,
        "segmento": "eletronico",
        "imagem": "https://shopee.com.br/blog/wp-content/uploads/2022/01/smartwatch-a1.png"
    },
    {
        "nome": "Televisão",
        "valor": 8000.0,
        "estoque": 4,
        "segmento": "eletronico",
        "imagem": "https://img.global.news.samsung.com/br/wp-content/uploads/2018/05/MU6100.png"
    },
    {
        "nome": "Câmera Fotográfica",
        "valor": 700.0,
        "estoque": 16,
        "segmento": "eletronico",
        "imagem": "https://www.casadacamera.com/wp-content/uploads/homepage-camera.png"
    },
    {
        "nome": "Teclado",
        "valor": 1000.0,
        "estoque": 17,
        "segmento": "eletronico",
        "imagem": "https://static.wixstatic.com/media/71a6c2_a235cf823fb041d5a293b7dbbdc2a5da~mv2.png/v1/fill/w_1200,h_620,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/DARK%20AVENGER%20PNG.png"
    },
    {
        "nome": "Microfone",
        "valor": 500.0,
        "estoque": 22,
        "segmento": "eletronico",
        "imagem": "https://www.logitechstore.com.br/media/catalog/product/cache/1/image/634x545/9df78eab33525d08d6e5fb8d27136e95/y/e/yeti-blackout2.png"
    },
    {
        "nome": "Tablet",
        "valor": 1800.0,
        "estoque": 25,
        "segmento": "eletronico",
        "imagem": "https://brmotorolanew.vtexassets.com/arquivos/ids/161114/2021_Moto-Tab-G70--1-._Design_Modernist-Teal.png?v=637818443806770000"
    },

    // automoveis
    {
        "nome": "Pneu",
        "valor": 250.0,
        "estoque": 16,
        "segmento": "automovel",
        "imagem": "https://dunloppneus.vtexassets.com/arquivos/ids/155711/SP-Touring-R1.png?v=637424487673030000"
    },
    {
        "nome": "Limpador de Parabrisas",
        "valor": 37.5,
        "estoque": 20,
        "segmento": "automovel",
        "imagem": "https://images.tcdn.com.br/img/img_prod/1024593/palheta_do_limpador_de_parabrisa_dodge_e_ford_1336p_335_1_fcb2ff19e0018d2ba281b119436a77fb.png"
    },
    {
        "nome": "Retrovisor",
        "valor": 30.99,
        "estoque": 10,
        "segmento": "automovel",
        "imagem": "https://autovidrosdourados.com.br/wp-content/uploads/2018/02/Retrovisor-1.png"
    },
    {
        "nome": "Motor",
        "valor": 14999.99,
        "estoque": 13,
        "segmento": "automovel",
        "imagem": "https://bruscoautocenter.com.br/wp-content/uploads/2014/02/motor.png"
    },
    {
        "nome": "Escapamento",
        "valor": 119.99,
        "estoque": 19,
        "segmento": "automovel",
        "imagem": "https://images.tcdn.com.br/img/img_prod/718530/escapamento_completo_agile_1_4_8v_2009_a_2014_21587_1_78edf741a19fa36ca8be68893bdd978e.png"
    },
    {
        "nome": "Parabrisa",
        "valor": 700.0,
        "estoque": 9,
        "segmento": "automovel",
        "imagem": "https://pontualparabrisas.com.br/wp-content/uploads/2022/08/vigia.png"
    },
    {
        "nome": "Volante",
        "valor": 550,
        "estoque": 11,
        "segmento": "automovel",
        "imagem": "https://ae01.alicdn.com/kf/H2afb0fb8551344c495e4bd48169f01c59/Volante-do-carro-capa-de-couro-de-fibra-de-carbono-15-polegada-38cm-antiderrapante-para-peugeot.png_.webp"
    },
    {
        "nome": "Radio para Carro",
        "valor": 299.99,
        "estoque": 5,
        "segmento": "automovel",
        "imagem": "https://d3ugyf2ht6aenh.cloudfront.net/stores/001/239/875/products/3731_e7b11789-3d40-4974-bd11-b66b000a3dd7_1000x1000-0f694f251bd226440316133985421396-640-0.png"
    },
    {
        "nome": "Kit Lavagem de Carros",
        "valor": 399.99,
        "estoque": 8,
        "segmento": "automovel",
        "imagem": "https://trimais.vteximg.com.br/arquivos/ids/1000992-1000-1000/foto_original.jpg?v=637395778427370000"
    },
    {
        "nome": "Jogo de Tapete Automotivo",
        "valor": 59.99,
        "estoque": 12,
        "segmento": "automovel",
        "imagem": "https://www.luxcar.com.br/wp-content/uploads/2020/01/0192.png"
    },
    {
        "nome": "Protetor para Sol",
        "valor": 40.5,
        "estoque": 15,
        "segmento": "automovel",
        "imagem": "https://d3ugyf2ht6aenh.cloudfront.net/stores/001/273/855/products/10503_protetor_solar_retratil_para_carro_com_ventosas1-9fc96c7f1f225b874216031419009864-640-0.png"
    },

    // alimentos
    {
        "nome": "Banana",
        "valor": 2.23,
        "estoque": 50,
        "segmento": "alimento",
        "imagem": "https://bompreco.vtexassets.com/arquivos/ids/193251/Banana-Nanica-1unidade.png?v=637916119134400000"
    },
    {
        "nome": "Maçã",
        "valor": 5.5,
        "estoque": 26,
        "segmento": "alimento",
        "imagem": "https://ibassets.com.br/ib.item.image.big/b-f7451597952f4232bd9dab3f01e31726.png"
    },
    {
        "nome": "Feijão Carioca",
        "valor": 10.5,
        "estoque": 10,
        "segmento": "alimento",
        "imagem": "https://static.paodeacucar.com/img/uploads/1/603/23627603.png"
    },
    {
        "nome": "Arroz",
        "valor": 12.3,
        "estoque": 13,
        "segmento": "alimento",
        "imagem": "https://www.camil.com.br/wp-content/uploads/sites/12/2020/06/images-upload-uploaded-1344-arroz-organico-768x768.png"
    },
    {
        "nome": "Salgadinho",
        "valor": 8.5,
        "estoque": 16,
        "segmento": "alimento",
        "imagem": "https://trimais.vteximg.com.br/arquivos/ids/1011470-1000-1000/foto_original.jpg?v=637395863945030000"
    },
    {
        "nome": "Chocolate",
        "valor": 6,
        "estoque": 4,
        "segmento": "alimento",
        "imagem": "https://www.stuttgart.com.br/media/catalog/product/cache/55a240f7191edc46f444b981637989c2/s/c/schogetten_alpine_milk_chocolate_100g_1_1.png"
    },
    {
        "nome": "Iogurte",
        "valor": 8,
        "estoque": 7,
        "segmento": "alimento",
        "imagem": "https://static.paodeacucar.com/img/uploads/1/330/16375330.png"
    },
    {
        "nome": "Pão",
        "valor": 4.99,
        "estoque": 20,
        "segmento": "alimento",
        "imagem": "https://static.paodeacucar.com/img/uploads/1/511/19758511.png"
    },
    {
        "nome": "Cereal Matinal",
        "valor": 10.99,
        "estoque": 11,
        "segmento": "alimento",
        "imagem": "https://trimais.vteximg.com.br/arquivos/ids/1007017-1000-1000/foto_original.jpg?v=637395823087670000"
    },
    {
        "nome": "Bolacha",
        "valor": 5.99,
        "estoque": 18,
        "segmento": "alimento",
        "imagem": "http://cdn.shopify.com/s/files/1/0946/5368/products/isabela_maria_grande.png?v=1534818337"
    }
]

/*
    Se o localStorage possuir um produto este irá substituir a variável criado neste arquivo
    caso contrário, o vetor deste arquivo irá substituir ser inserido no localStorage
 */
window.onload = function () {
    if(localStorage.getItem("produtos") !== null) {
        produtos = JSON.parse(localStorage.getItem("produtos"))
    } else {
        localStorage.setItem("produtos", JSON.stringify(produtos))
    }
}