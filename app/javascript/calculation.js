function calculation (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const priceValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit")
    const commission = Math.floor(priceValue * 0.1);
    addTaxPrice.innerHTML = commission;
    profit.innerHTML = Math.floor(priceValue - commission);
  });
};

window.addEventListener('turbo:load', calculation);
