function Comment(attributes){
  this.id = attributes.id;
  this.notes = attributes.notes;
}

Comment.ready = () => {
  Comment.formSubmitListener()
}


Comment.prototype.renderLI = function(){
    return `<li>${this.notes}<a href="/users/${user_id}/animals/${animal_id}/comments/${this.id}">(delete)</a></li>`
}

Comment.formSubmitListener = function(){
  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    let $form = $(this);
    let action = $form.attr("action");
    let params = $form.serialize();

    $.post(`${action}.json`, params)
    .success(response => {
      console.log(response)
      $("#comment_notes").val("");
      let comment = new Comment(response);
      let commentLi = comment.renderLI();
      $("ol.comment-entry").append(commentLi);
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
}

$(function() {
  Comment.ready()
})