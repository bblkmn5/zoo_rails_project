function Comment(attributes){
  this.id = attributes.id;
  this.notes = attributes.notes;
  this.animalId = attributes.animalId;
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
  // let $form = $(this);
  const action = $(this).attr("action");
  const params = $(this).serialize();

  $.post(`${action}.json`, params)
  .success(response => {
    const id = response.id;
    const userId = $(this).data("user-id");
    const animalId = $(this).data("animal-id");
    
    // console.log(response)
    $("#comment_notes").val("");
    const comment = new Comment(response);
    let commentLi = comment.renderLI();
    commentLi += `<a rel="nofollow" data-method="delete" href="/users/${userId}/animals/${animalId}/comments/${id}">(delete)</a></li>`
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
