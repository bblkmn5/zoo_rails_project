$(function() {
  $(".js-more").on('click', function() {
    $(this).hide();
    let id = $(this).data("id");
    let user_id = $(this).data("user-id");

    $.get(`/users/${user_id}/animals/${id}.json`, data => {
      let animal = data;
      let animalComments = $.map(animal.comments, function(comment) {
          return `<li>${comment.notes}</li>`
        })
      // console.log(animalComments) 
      let animalTraits = `<p>Species: ${animal.species}</p><p>Personality: ${animal.personality}</p><p>Notes: <ol>${animalComments.toString().replace(/,/g , '')}</ol>`;
      $("#animal-" + id).html(animalTraits);
      })
    });

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
});
