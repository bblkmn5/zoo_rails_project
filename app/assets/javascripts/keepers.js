function Keeper(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.zoo_id = attributes.zoo_id;
}

Keeper.ready = () => {
  Keeper.showForm()
  Keeper.formSubmitListener()
  Keeper.hideForm()
}

Keeper.prototype.renderLi = function() {
  return `<li>${this.name}</li>`
}

Keeper.error = function(response){
  console.log("Oh no! here is your" + response)
}

Keeper.formSubmit = function(e) {
  e.preventDefault();
  
  let $form = $(this);
  let action = $form.attr("action");
  let params = $form.serialize();

  $.post(`${action}.json`, params)
  .success(response => {
    $("#keeper_name").val("");
    let $ol = $("ol#show-keepers");
    let keeperName = new Keeper(response);
    console.log(keeperName)
    $ol.append(keeperName.renderLi());
  })
  .error(Keeper.error)
}

Keeper.formSubmitListener = function() {
  $("#new_keeper").on("submit", Keeper.formSubmit)
}

Keeper.showForm = function() {
  $('#js-show-keeper').on("click", function(e) {
    e.preventDefault();
    
    $(this).hide();
    $("div#show-keeper-form").show()
    
  })
}

Keeper.hideForm = function() {
  $("#new_keeper").on("submit", function(){
    $("div#show-keeper-form").hide()
    $("#js-show-keeper").show()
  })  
}

$(function() {
  Keeper.ready()
})
