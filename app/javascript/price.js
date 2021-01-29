function price() {
  const item_price = document.getElementById("item-price");
  item_price.addEventListener("keyup", (e) => {
    const tax_price = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    tax_price.innerHTML = Math.round((item_price.value) * 0.1);
    profit.innerHTML = Math.round((item_price.value) * 0.9);
  })
}
window.addEventListener("load", price);