window.addEventListener('turbo:load', function tax(){

  const itemPrice  = document.getElementById("item-price");
 
  const priceInput = document.getElementById('item-price');
  const addTax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTax.innerHTML = (Math.floor(inputValue/10));
    profit.innerHTML = inputValue - (Math.floor(inputValue/10));    
  });

});

window.addEventListener("turbo:render", tax);
