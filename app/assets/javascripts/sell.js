$(function(){
  $(".input-price").on("keyup", function(){

  var price = $(".input-price").val();
  var fee = Math.floor(price * 0.1)
  var profit = price - fee

    if (300 <= price && price <= 9999999){
      $("#display-fee").text("¥"+ fee)
      $("#display-profit").text("¥"+ profit)
      }

    else {
      $("#display-fee").text("−")
      $("#display-profit").text("−")
  }

  });
});


