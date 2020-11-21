window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById('add-tax-price');
   const taxValue = Math.floor(inputValue*0.10);
    
    addTaxDom.innerHTML = taxValue
      const salesProfit = document.getElementById('profit');
      salesProfit.innerHTML = Math.floor(inputValue - taxValue);

  })


});