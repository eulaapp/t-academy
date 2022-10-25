function signo() {
    let dataAniversario = document.getElementById("data").value;

    let d = new Date(dataAniversario);
    let dia = d.getDate()+1
    let mes = d.getMonth()+1

    if (mes == 3) {
        if (dia >= 21) {
            alert("aries")
        } else {
            alert("Peixes")
        }
    } else if (mes == 4) {
        if (dia >= 20) {
            alert("Touro")
        } else {
            alert("Aries")
        }
    } else if (mes == 5) {
        if (dia >= 21) {
            alert("Gêmeos")
        } else {
            alert("Touro")
        }
    } else if (mes == 6) {
        if (dia >= 22) {
            alert("Câncer")
        } else {
            alert("Gêmeos")
        }
    } else if (mes == 7 ) {
        if (dia >= 23) {
            alert("Leão")
        } else {
            alert("Câncer")
        }
    } else if (mes == 8) {
        if (dia >= 23) {
            alert("Virgem")
        } else {
            alert("Leão")
        }
    } else if (mes == 9) {
        if (dia >= 23) {
            alert("Libra")
        } else {
            alert("Virgem")
        }
    } else if (mes == 10) {
        if (dia >= 23) {
            alert("Escorpião")
        } else {
            alert("Libra")
        }
    } else if (mes == 11) {
        if (dia >= 22) {
            alert("Sagitário")
        } else {
            alert("Escorpião")
        }
    } else if (mes == 12) {
        if (dia >= 22) {
            alert("Capricórnio")
        } else {
            alert("Sagitário")
        }
    } else if (mes == 1) {
        if (dia >= 20) {
            alert("Aquario")
        } else {
            alert("Capricórnio")
        }
    } else if (mes == 2) {
        if (dia >= 19) {
            alert("Peixes")
        } else {
            alert("Aquario")
        }
    }
}