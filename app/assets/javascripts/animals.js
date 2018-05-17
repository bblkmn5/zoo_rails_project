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
      console.log(animalComments) 
      let animalTraits = `<p>Species: ${animal.species}</p><p>Personality: ${animal.personality}</p><p>Notes: <ol>${animalComments.toString().replace(/,/g , '')}</ol>`;
      $("#animal-" + id).html(animalTraits);
      })
    });

  $(".js-next").on("click", function (e) {
    e.preventDefault();
    let id = $(this).data("id");
    let zoo_id = $(this).data("zoo-id");
    let user_id = $(this).data("user-id");
    let nextID = parseInt($(".js-next").attr("data-id"));
    
    $.get(`/users/${user_id}/zoos/${zoo_id}.json`, function (data) {
      let animals = data.animals;
      
      for (animal of animals){
        $(".animalTraits").html(`${animal.name} the ${animal.species}`);
      $(".animalPersonality").html(`Personality: ${animal.personality}<br>`);
      }
      let animalComments = $.map(animal.comments, function(comment) {
        return `<li>${comment.notes}</li>`
      })
      $(".comments").html(`<ol>${animalComments.toString().replace(/,/g , '')}</ol>`)
      // re-set the id to current on link
      $(".js-next").attr("data-id", animal.id);
    });
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
