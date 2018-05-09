$(function() {
  $("a.load_comments").on("click", function(e) {
    //Fire ajax
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response) {
      console.log(response);
    });
    // get response

    //load response
    e.preventDefault();
  });
});