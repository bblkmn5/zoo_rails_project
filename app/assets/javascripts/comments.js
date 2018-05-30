function Comment(attributes){
  this.id = attributes.id;
  this.notes = attributes.notes;
  this.animal_id = attributes.animal_id;
}

Comment.ready = () => {
  Comment.formSubmitListener()
}

Comment.prototype.renderLI = function(){
    return `<li>${this.notes} `
}

Comment.formSubmitListener = function(){
  $("#new_comment").on("submit", Comment.formSubmit)
}
  
Comment.formSubmit = function(e) {
  e.preventDefault();
  let $form = $(this);
  let action = $form.attr("action");
  let params = $form.serialize();

  $.post(`${action}.json`, params)
  .success(response => {
    let id = response.id;
    let user_id = $(this).data("user-id");
    let animal_id = $(this).data("animal-id");
    
    // console.log(response)
    $("#comment_notes").val("");
    let comment = new Comment(response);
    let commentLi = comment.renderLI();
    commentLi += `<a rel="nofollow" data-method="delete" href="/users/${user_id}/animals/${animal_id}/comments/${id}">(delete)</a></li>`
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
};

$(function() {
  Comment.ready()
})

// Comment.destroyListener = function() {
//   $('ol.comment-entry li').on("click", function(e){
//     e.preventDefault();

//     let $form = $(this);
//     let action = $form.attr("action");
//     let params = $form.serialize();

//     $.ajax({
//       url: action,
//       data: params,
//       dataType: "json",
//       method: "DELETE"
//     })
//   })
// }
