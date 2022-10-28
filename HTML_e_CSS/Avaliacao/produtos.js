let produtos = []

produtos.push(
    {
        'codigo': 1,
        'nome': 'Hidratante facial',
        'imagem': 'hidratante-facial.jfif',
        'estoque': 50,
        'segmento': 'Beleza',
        'valor': 65.40
    },
    {
        'codigo': 2,
        'nome': 'Creme Vitamina C',
        'imagem': 'vitamina-c.jpg',
        'estoque': 80,
        'segmento': 'Beleza',
        'valor': 70.90
    },
    {
        'codigo': 3,
        'nome': 'Puro Gel de Aloe Vera',
        'imagem': 'gel-aloe-vera.jpg',
        'estoque': 100,
        'segmento': 'Beleza',
        'valor': 39.35
    },
    {
        'codigo': 4,
        'nome': 'Base BB Cream Hidratante',
        'imagem': 'Base-BB-Cream-Hidratante.jpeg',
        'estoque': 30,
        'segmento': 'Beleza',
        'valor': 27.00
    },
    {
        'codigo': 5,
        'nome': 'Água Thermal Vegetal Gerânio',
        'imagem': 'agua-termal.jpg',
        'estoque': 35,
        'segmento': 'Beleza',
        'valor': 26.99
    },
    {
        'codigo': 6,
        'nome': 'Oil Control Oily Skin Gel Plus',
        'imagem': 'gel-plus.webp',
        'estoque': 55,
        'segmento': 'Beleza',
        'valor': 246.79
    },
    {
        'codigo': 7,
        'nome': 'Protetor solar',
        'imagem': 'protetor-solar_1.webp',
        'estoque': 15,
        'segmento': 'Beleza',
        'valor': 69.90
    },
    {
        'codigo': 8,
        'nome': 'Loção Tônica Multifuncional',
        'imagem': 'tonico.webp',
        'estoque': 25,
        'segmento': 'Beleza',
        'valor': 43.40
    },
    {
        'codigo': 9,
        'nome': 'Tônico Principia 7%',
        'imagem': 'acido.jpg',
        'estoque': 12,
        'segmento': 'Beleza',
        'valor': 44.00
    },
    {
        'codigo': 10,
        'nome': 'Máscara Facial Mar Morto',
        'imagem': 'mascara.webp',
        'estoque': 12,
        'segmento': 'Beleza',
        'valor': 8.50
    },
    {
        'codigo': 11,
        'nome': 'Panela Sauté Grand',
        'imagem': 'panela.jpg',
        'estoque': 12,
        'segmento': 'Cozinha',
        'valor': 105.95
    },
    {
        'codigo': 12,
        'nome': 'Fritadeira Elétrica',
        'imagem': 'airfryer.webp',
        'estoque': 12,
        'segmento': 'Cozinha',
        'valor': 1040.99
    },
    {
        'codigo': 13,
        'nome': 'Faqueiro Inox 30pc',
        'imagem': 'faqueiro.webp',
        'estoque': 72,
        'segmento': 'Cozinha',
        'valor': 37.99
    },
    {
        'codigo': 14,
        'nome': 'Prato',
        'imagem': 'pratos.jpg',
        'estoque': 10,
        'segmento': 'Cozinha',
        'valor': 150.30
    },
    {
        'codigo': 15,
        'nome': 'Kit com 6 pratos fundos',
        'imagem': 'pratos.jpg',
        'estoque': 10,
        'segmento': 'Cozinha',
        'valor': 150.30
    },
    {
        'codigo': 16,
        'nome': 'Batedeira Planetária',
        'imagem': 'batedeira.webp',
        'estoque': 23,
        'segmento': 'Cozinha',
        'valor': 550.89
    },
    {
        'codigo': 17,
        'nome': 'Liquidificador Mondial',
        'imagem': 'liquidificador.webp',
        'estoque': 33,
        'segmento': 'Cozinha',
        'valor': 99.90
    },
    {
        'codigo': 18,
        'nome': 'Conjunto 6 Copos 300ml Oca Nadir',
        'imagem': 'copos.png',
        'estoque': 45,
        'segmento': 'Cozinha',
        'valor': 79.90
    },
    {
        'codigo': 19,
        'nome': 'Kit Panelas Ceramica',
        'imagem': 'panela-vermelha.webp',
        'estoque': 10,
        'segmento': 'Cozinha',
        'valor': 55.90
    },
    {
        'codigo': 20,
        'nome': 'Escorredor de louça',
        'imagem': 'escorredor-louca.jpg',
        'estoque': 10,
        'segmento': 'Cozinha',
        'valor': 55.90
    },
    {
        'codigo': 21,
        'nome': 'Vestido',
        'imagem': 'vestido.webp',
        'estoque': 10,
        'segmento': 'Vestuário',
        'valor': 279.90
    },
    {
        'codigo': 22,
        'nome': 'Vestido Midi Decote',
        'imagem': 'vestido-2.webp',
        'estoque': 10,
        'segmento': 'Vestuário',
        'valor': 259.90
    },
    {
        'codigo': 23,
        'nome': 'Sandália Salto',
        'imagem': 'sandalia.webp',
        'estoque': 32,
        'segmento': 'Vestuário',
        'valor': 149.90
    },
    {
        'codigo': 24,
        'nome': 'Sandália Salto',
        'imagem': 'sandalia-2.webp',
        'estoque': 15,
        'segmento': 'Vestuário',
        'valor': 219.90
    },
    {
        'codigo': 25,
        'nome': 'Top Cropped de Decote',
        'imagem': 'cropped.png',
        'estoque': 25,
        'segmento': 'Vestuário',
        'valor': 180.99
    },
    {
        'codigo': 26,
        'nome': 'Hope Top Regata',
        'imagem': 'hope.webp',
        'estoque': 10,
        'segmento': 'Vestuário',
        'valor': 180.75
    },
    {
        'codigo': 27,
        'nome': 'Camisa Estampada Acetinada',
        'imagem': 'camisa.jpg',
        'estoque': 10,
        'segmento': 'Vestuário',
        'valor': 179.90
    },
    {
        'codigo': 28,
        'nome': 'Blusa Estampada',
        'imagem': 'blusa.webp',
        'estoque': 10,
        'segmento': 'Vestuário',
        'valor': 279.90
    },
    {
        'codigo': 29,
        'nome': 'Calça Reta Malha',
        'imagem': 'calca.jpg',
        'estoque': 10,
        'segmento': 'Vestuário',
        'valor': 279.90
    },
    {
        'codigo': 30,
        'nome': 'Calça Estampada',
        'imagem': 'shorts.png',
        'estoque': 49,
        'segmento': 'Vestuário',
        'valor': 199.90
    },
    )