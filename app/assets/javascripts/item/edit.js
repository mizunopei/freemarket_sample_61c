$(function(){
  var images = [];
  var inputs =[];
  if (document.URL.match(/item/) && document.URL.match(/edit/)){


// //要素の削除
$(document).on("click", ".delete-button", function(e){
  var delete_image = $(this).parent();
  delete_image.remove();
  var num = delete_image.data("image");
   $.each(inputs, function(index, input){
     if ((num) == delete_image.data("image")){
      $(this).remove();
      delete_image.remove();
     
  //要素のリセット
      images.splice(num, 1);
      inputs.splice(num, 1);
      if(inputs.length ==0) {
        $("#item_images").attr({
          "data-image": 0
        })
      }
   };
   
  })
});

  //販売価格などの表示
    var price = $(".input-price").val();
    var fee = Math.floor(price * 0.1)
    var profit = price - fee

    if (300 <= price && price<=9999999){
      $("#display-fee").text("¥"+(Number(fee).toLocaleString()))
      $("#display-profit").text("¥"+(Number(profit).toLocaleString()))
    }

    else{
      $("#display-fee").text("-")
      $("#display-profit").text("−")
    }
}
})