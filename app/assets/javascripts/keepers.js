function Keeper(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.zoo_id = attributes.zoo_id;
}

$(function() {
  $("#new_keeper").on("submit", function(e) {
    e.preventDefault();
    
    let $form = $(this);
    let action = $form.attr("action");
    let params = $form.serialize();
    
    $.post(`${action}.json`, params)
    .success(response => {
      $("#keeper_name").val("");
      let $ol = $("ol#show-keepers");
      //debugger
      
      $ol.append(response.name);
    })
    .error(response => {
      console.log("Oh no! here is your" + response)
    })
  })
})

$(function() {
  $("div.container").on("click", '#js-show-keeper', function(e) {
    e.preventDefault();
    
    $(this).hide();
    $("div#show-keeper-form").show()
  })
})