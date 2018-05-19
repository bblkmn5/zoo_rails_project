function Comment(attributes){
  this.id = attributes.id;
  this.notes = attributes.notes;
  this.animal_id = attributes.animal_id;
}

Comment.prototype.renderComment = function(){

}

$(function(){
  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    let $form = $(this);
    let action = $form.attr("action");
    let params = $form.serialize();

    $.post(action, params)
    .done(response => {
      $("#comment_notes").val("");
        let $ol = $("div.comments ol");
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
  });
})