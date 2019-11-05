$(document).on('turbolinks:load', function(){
  Payjp.setPublicKey('pk_test_43ad001a4c8e49a18daa5471');

  var form = $("#card_form")

  $(document).on("click", "#card_submit", function(e){
    e.prevent
    form.find("input[type=submit]").prop("disabled", true);

    var card = {    
      number: $('input[name="number"]').val(),
      cvc: $('input[name="cvc"]').val(),
      exp_month: $('select[name="exp_month"]').val(),
      exp_year: $('select[name="exp_year"]').val()
    };

    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert(response.error.message);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        var token = response.id;

        form.append($('<input type="hidden" name="payjp-token" />').val(token));
        a = form.get(0)
        console.log(a);
        $("#card_form").submit();
      }
    });
  });
});