function price() {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  item_price.addEventListener("input", () => {
    const value = item_price.value
    //Mathオブジェクトとメソッドを使って小数点以下の表示をなくす
    const tax = Math.trunc(value / 10)
    const p = value - tax
    
    add_tax_price.innerHTML = tax
    profit.innerHTML = p

  });
};

 window.addEventListener("load", price);
