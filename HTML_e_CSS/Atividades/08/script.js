function horarioLisboa() {
    let horaAtual = document.getElementById("hora-atual").value.split(":");

    let horaLisboa = (parseInt(horaAtual[0])+4);

    alert("Horário de Lisboa " + horaLisboa + ":" + horaAtual[1]);
}

function horarioNovaIorque() {
    let horaAtual = document.getElementById("hora-atual").value.split(":");

    let horaNovaIorque = (parseInt(horaAtual[0])-1);

    alert("Horário de Nova Iorque " + horaNovaIorque + ":" + horaAtual[1]);
}

function horarioCidadeMexico() {
    let horaAtual = document.getElementById("hora-atual").value.split(":");

    let horaCidadeMexico = (parseInt(horaAtual[0])-2);

    alert("Horário Cidade México " + horaCidadeMexico + ":" + horaAtual[1]);
}

function horarioToquio() {
    let horaAtual = document.getElementById("hora-atual").value.split(":");

    let horaToquio = (parseInt(horaAtual[0])+12);

    alert("Horário Tóquio " + horaToquio + ":" + horaAtual[1]);
}

function horarioBerlim() {
    let horaAtual = document.getElementById("hora-atual").value.split(":");

    let horaBerlim = (parseInt(horaAtual[0])+5);

    alert("Horário Berlim " + horaBerlim + ":" + horaAtual[1]);
}