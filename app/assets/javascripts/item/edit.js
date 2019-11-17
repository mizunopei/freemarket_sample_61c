$(function(){
if (document.URL.match(/item/) && document.URL.match(/edit/)){


//削除する画像のクリックイベント発火
$(document).on("click", ".delete-button", function(e){
  //view上で削除するimageを見えなくする
  e.preventDefault;
  var delete_image = $(this).parent();
  delete_image.remove();

  //削除するimageのidを取得
  var num = delete_image.data("image");
  var url = $("#image_delete").attr("action");

  //クリックイベントで取得したimageのidをcontrollerに送る
  $.ajax({
    url:  url,
    type:     "GET",
    data:     {keyword: num},
    dataType: "json",
    success: function(data){
      console.log("ok")
    },
    error: function(data){
      console.log("error")
    }
  });
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