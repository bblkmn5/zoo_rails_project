

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
    let params = $form.serialize();
    
    $.post(action, params)
    .success(response => {
      console.log(response)
      $("#keeper_name").val("");
      debugger
      let $ol = $("div.container.keepers ol");
      
      $ol.append(response);
    })
    .error(response => {
      console.log(response)
    })
  })
})