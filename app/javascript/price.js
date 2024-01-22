window.addEventListener('turbo:load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    const price = priceInput.value;
    const tax = Math.floor(price * 0.1);
    const profit = Math.floor(price * 0.9);
    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;
  });
})