let total = 0;


function valorTotal(tipo, cod) {
    
    if(cod == 1 && tipo == true) {
        total += 8;
    } else if (cod == 1 && tipo == false) {
        total -= 8;
    } else if (cod == 2 && tipo == true) {
        total += 8.5;
    } else if (cod == 2 && tipo == false) {
        total -= 8.5;
    } else if (cod == 3 && tipo == true) {
        total += 10
    } else if (cod == 3 && tipo == false) {
        total -= 10
    } else if (cod == 4 && tipo == true) {
        total += 5
    } else if (cod == 4 && tipo == false) {
        total -= 5
    } else if (cod == 5 && tipo == true) {
        total += 12
    } else if (cod == 5 && tipo == false) {
        total -= 12
    } else if (cod == 6 && tipo == true) {
        total += 4
    } else if (cod == 6 && tipo == false) {
        total -= 4
    } else if (cod == 7 && tipo == true) {
        total += 8.5
    } else if (cod == 7 && tipo == false) {
        total -= 8.5
    } else if (cod == 8 && tipo == true) {
        total += 7.9
    } else if (cod == 8 && tipo == false) {
        total -= 7.9
    } else if (cod == 9 && tipo == true) {
        total += 15
    } else if (cod == 9 && tipo == false) {
        total -= 15
    } else if (cod == 10 && tipo == true) {
        total += 12
    } else if (cod == 10 && tipo == false) {
        total -= 12
    }

    document.getElementById("total").innerHTML = total;

}