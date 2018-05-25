

$(function(){
  $("#show-keeper").on("click", function(e){
    e.preventDefault();
    $(this).hide();
    $("#keeper-form").show()
  })
})

$(function(){
  $("#new_keeper").on("submit", function(e) {
    e.preventDefault();
    
    let $form = $(this);
    let action = $form.attr("action");
    console.log(action)
    let params = $form.serialize();
    console.log(params)
    
    $.post(`${action}.json`, params, function(response){
      console.log(response)
      $("#keeper_name").val("");
      let $ol = $("ol.this-better-work");
      console.log($ol)
      //debugger
      
      $ol.append('<li>Hello</li>');
    })
    
    //.error(response => {
      //console.log("Oh no! here is your" + response)
    //})
  })
})