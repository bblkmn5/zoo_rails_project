$(function() {
  $("form#new_comment").on("submit", function(e){
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();

    $.post(action, params)
    .done(function(response){
      $("#comment_notes").val("");
        var $ol = $("div.comments ol");
        $ol.append(response);
    })
    // low-level ajax
    // $.ajax({
    //   type: "POST",
    //   url: this.action,
    //   data: $(this).serialize(),
    //   success: function(response) {
    //     $("#comment_notes").val("");
    //     var $ol = $("div.comments ol");
    //     $ol.append(response);
    //   }
    // });

  })
});
