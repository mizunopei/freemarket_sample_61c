$(function(){
  var images = [];
  var inputs =[];
  var dropbox = $(".image-dropzone");
  var preview = $("#preview");
  var inputbox = $(".input-zone");
  var image_data = $(".data-image");
  var select_burden = $("#select_burden");


  $(document).on("change", "#item_images", function(e){
    //選択したファイルの読み取り
    var file = $(this).prop("files")[0];
    // FileReaderのインスタンスを作成
    var reader = new FileReader();
    inputs.push($(this));
  
    var img = $('<div class="image-dropbox"><img></div>')
    reader.onload = function(e){
      var btn_wrapper  = $('<div class="delete-button">削除</div>')
       img.append(btn_wrapper);
       img.find("img").attr({src: e.target.result})
    }
     //ファイルをデータとして扱う
     reader.readAsDataURL(file);
     images.push(img);
      $.each(images, function(index, image){
        image.attr("data-image", index);
        preview.append(image[0]);
      })
      inputbox.css({
        'width': `calc(100% - (120px * ${images.length}))`,
        'display': `inline-block`
      })
      //新しいインプット作成
      var new_input = $(`<input class="sell-upload__file" multiple="multiple" type="file" name="item[images][]" id="item_images">`);
      inputbox.prepend(new_input);
    });

//要素の削除
  $(document).on("click", ".delete-button", function(e){
    var delete_image = $(this).parent();
    var num = delete_image.data("image");
     $.each(inputs, function(index, input){
       if ((num) == delete_image.data("image")){
        $(this).remove();
        delete_image.remove();
        inputbox.css({
          'width': `calc(100% - (120px * ${images.length}))`,
          'display': `inline-block`
        })
       
    //要素のリセット
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length ==0) {
          $("#item_images").attr({
            "data-image": 0
          })
        }
     };
     if (image_data.length == 0){
      $(this).remove();
      delete_image.remove();
      inputbox.css({
        'width': `100%`
      })
    };
    })
  });

   //配送料のセレクト
  
  $("#item_d_burden").change(function(){
    $("#d_way").remove();
    var select =  $("#item_d_burden").val();
    if (select == "送料込み(出品者負担)"){
     var exhibitor_select = `<div class="form-group", id = "d_way">
                              <label>配送の方法</label>
                              <span class="form-require">必須</span>
                              <div>
                                <div class="select-box">
                                  <i class="fa fa-chevron-down select-chevron"></i>
                                  <select class="select-bar" name="item[d_way]" id="item_d_way">
                                    <option>---</option>
                                    <option value ="未定">未定</option>
                                    <option value="らくらくメルカリ便">らくらくメルカリ便</option>
                                    <option value ="ゆうメール">ゆうメール</option>
                                    <option value="レターパック">レターパック</option>
                                    <option value ="普通郵便(定形、定形外)">普通郵便(定形、定形外)</option>
                                    <option value ="クロネコヤマト">クロネコヤマト</option>
                                    <option value ="ゆうパック">ゆうパック</option>
                                    <option value= "クリックポスト">クリックポスト</option>
                                    <option value ="ゆうパケット">ゆうパケット</option>
                                  </select>
                                </div>
                              </div>
                            </div>`
     select_burden.append(exhibitor_select)
    }
    else if(select == "着払い(購入者負担)"){
      var buyer_select =  `<div class="form-group", id ="d_way">
                            <label>配送の方法</label>
                            <span class="form-require">必須</span>
                            <div>
                              <div class="select-box">
                                <i class="fa fa-chevron-down select-chevron"></i>
                                <select class="select-bar" name="item[d_way]" id="item_d_way">
                                  <option>---</option>
                                  <option value ="未定">未定</option>
                                  <option value ="クロネコヤマト">クロネコヤマト</option>
                                  <option value ="ゆうパック">ゆうパック</option>
                                  <option value ="ゆうパケット">ゆうパケット</option>
                                </select>
                            </div>
                            </div>
                          </div>`
      select_burden.append(buyer_select)
    }
  })



  // 販売価格など
  $(".input-price").on("keyup", function(e){

  var price = $(".input-price").val();
  var fee = Math.floor(price * 0.1)
  var profit = price - fee

    if (300 <= price && price <= 9999999){
      $("#display-fee").text("¥"+ (Number(fee).toLocaleString()))
      $("#display-profit").text("¥"+ (Number(profit).toLocaleString()))
      }

    else {
      $("#display-fee").text("−")
      $("#display-profit").text("−")
    }
  });
})


