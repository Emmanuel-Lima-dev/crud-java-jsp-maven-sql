// variables td de libro diario 
const 
debe = document.querySelectorAll(".debe"),
haber = document.querySelectorAll(".haber"),
subtotalDebe=document.querySelector(".subtotalDebe"),
subtotalHaber=document.querySelector(".subtotalHaber"),
totalDebe = document.querySelector(".totalDebe"),
totalHaber = document.querySelector(".totalHaber"),
total = document.querySelector(".total");


// variables de formulario nuevo movimiento
const 
valorDebe = document.querySelector("#debe"),
valorHaber = document.querySelector("#haber");

//condicionar los input text a solo entrada numerica
function validateNumericInput(input) {
	input.value = input.value.replace(/,/g, '.');
  	input.value = input.value.replace(/[^0-9.]/g, '');
}

// funcion autocomplit partida doble
valorDebe.addEventListener("keyup", ()=>{
    if (valorDebe.value > 0) {
        valorHaber.value= 0;
    }
});

valorDebe.addEventListener("change", ()=>{
    if (valorDebe.value > 0) {
        valorHaber.value= 0;
    }
});

valorHaber.addEventListener("keyup", ()=>{
    if (valorHaber.value > 0) {
        valorDebe.value= 0;
    }
});

valorHaber.addEventListener("change", ()=>{
    if (valorHaber.value > 0) {
        valorDebe.value= 0;
    }
});


// funcion calcular resultado
let sumaHaber=0;

let sumaDebe = 0;

const resultadoLibro = () => {
    //subtotal debe
  debe.forEach((element) => {
	element.textContent = element.textContent.replace(".",",");
    let num = parseFloat(element.textContent.replace("$", ""));
    if (!isNaN(num)) {
      sumaDebe += num; 
    }
  });
  subtotalDebe.textContent = "$" + sumaDebe.toFixed(2).replace(".",","); 
  
  //subtotal haber
  haber.forEach((element) => {
	  element.textContent = element.textContent.replace(".",",");
    let num = parseFloat(element.textContent.replace("$", ""));
    if (!isNaN(num)) {
      sumaHaber += num; 
    }
  });
  subtotalHaber.textContent = "$" + sumaHaber.toFixed(2).replace(".",","); 
  
  //total
  const numSubtotalDebe = parseFloat(subtotalDebe.textContent.replace("$",""));
  const numSubtotalHaber = parseFloat(subtotalHaber.textContent.replace("$",""));
  const result= numSubtotalDebe - numSubtotalHaber;
  if (numSubtotalDebe > numSubtotalHaber) {
    totalDebe.textContent="$"+ result.toFixed(2).replace(".",",");
    totalDebe.classList.add("text-success");
    total.textContent = "total = saldo acreedor";
  } else if (numSubtotalDebe < numSubtotalHaber){
    totalHaber.textContent="$"+ result.toFixed(2).replace(".",",");
    totalHaber.classList.add("text-danger");
    total.textContent = "total = saldo deudor";
  } else if (numSubtotalDebe == numSubtotalHaber){
    totalDebe.textContent="saldos iguales";
    total.textContent = "total =";
  } 
};



resultadoLibro();







