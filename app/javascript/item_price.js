function price (){
  const priceInput = document.getElementById("item-price");
  const feeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit")
  if (priceInput) {
      priceInput.addEventListener("input", function() {
        const price = parseInt(priceInput.value);
        if (isNaN(price) || price <= 0) {
            feeDisplay.textContent = "手数料: -- 円";
            profitDisplay.textContent = "利益: -- 円";
            return;
        }

        const fee = Math.floor(price * 0.1); 
        const profit = price - fee;

        feeDisplay.textContent = `手数料: ${fee} 円`;
        profitDisplay.textContent = `利益: ${profit} 円`;
    });
  }
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);

