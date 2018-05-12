Index page jQuery w/ ActiveModel Serialization JSON Backend (.serialize())
fetch animals with AJAX GET request, append to page with JSON POST
    All animals and zookeepers rendered by Zoo on their perspective index pages

Show page "  "
    On Zoo show page, adding 'next' and 'previous' button for every animal and keeper within the Zoo, and rendering with jQuery/AJAX

Rails API at least one has-many relationship in JSON that is rendered to page 
    Zoo has many animals, render on zoo show page

FORM to create new resource and render response without page refresh
    add comment form to keeper and animal show pages

JS Model Object. One Method on Prototype and add function to add another feature
    Not sure..

<script type="text/javascript" charset="utf-8">
  $(function () {
    $(".js-next").on("click", function () {
      var id = $(this).data("id");
      let nextID = parseInt($(".js-next").attr("data-id"));
      $.get("/users/" + <%= current_user.id %> + "/animals/" + nextID + ".json", function (data) {
        $(".animalName").text(data["name"]);
        $(".animalSpecies").text(data["species"]);
        $(".animalPersonality").text(data["personality"]);
        $(".animalNotes").text(data["comments"]);
        // re-set the id to current on link
        $(".js-next").attr("data-id", data["id"]);
      });
    });
  });
</script>

let values = $(this).serialize();
let posting = $.post("/users/" + <%= current_user.id %> + "/animals/" + <%= @animal.id %> + '/comments', values);

posting.done(function(data) {
  let comment = data;
  $(".animalNotes").text(comment["notes"]);
});