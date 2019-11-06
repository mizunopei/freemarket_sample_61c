$(document).on('turbolinks:load', function(){
  Payjp.setPublicKey('pk_test_43ad001a4c8e49a18daa5471');

  var form = $("#card_form")

  $(document).on("click", "#card_submit", function(e){
    e.preventDefault
    form.find("input[type=submit]").prop("disabled", true);

    var card = {    
      number: $('input[name="number"]').val(),
      cvc: $('input[name="cvc"]').val(),
      exp_month: $('select[name="exp_month"]').val(),
      exp_year: $('select[name="exp_year"]').val()
    };

    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("入力した情報に誤りがあります。");
        form.find("input[type=submit]").prop("disabled", false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        var token = response.id;

        form.append($('<input type="hidden" name="payjp-token" />').val(token));
        $("#card_form").submit();
      }
    });
  });
});