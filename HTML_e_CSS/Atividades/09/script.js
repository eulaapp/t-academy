function multiplicar() {
    let number = document.getElementById("number").value;
    let numbers = []

    for (let i = 0; i <= 10; i++) {
        numbers.push(number * i);
    }

    alert("Resultados: " + numbers)
}