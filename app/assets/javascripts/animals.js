$(function() {
  $("a.load_comments").on("click", function(e) {
    e.preventDefault();

    $.get(this.href).success(function(response){
      var $ol = $("div.comments ol");
      $ol.html("")

      response.forEach(function(comment){
        $ol.append("<li>" + comment.notes + "</li>");
      })
    })
    //Requesting HTML
    // $.get(this.href).success(function(response){
    //   $("div.comments").html(response)
    // })
  })

  $("form#new_comment").on("submit", function(e){
    e.preventDefault();
    $.post(this.action, $(this).serialize())  .done(function(response){
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
