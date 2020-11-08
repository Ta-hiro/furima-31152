window.addEventListener('load',() => {
  console.log("ok");

const priceInput = document.getElementById("item-price");
const saleFee = document.getElementById("add-tax-price");
const saleProfit = document.getElementById("profit");

priceInput.addEventListener("input",() => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  saleFee.innerHTML = inputValue
  saleProfit.innerHTML
});
});