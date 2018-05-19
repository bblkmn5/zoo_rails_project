function Animal(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.species = attributes.species;
  this.personality = attributes.personality;
  this.comments = attributes.comments;
}

// Animal.ready = function(){
  
// }

Animal.prototype.renderAnimal = function(){
  const animalHTML = `<li>${this.name} the ${this.species}</li>`
  return animalHTML;
}


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
      let animalTraits = `<p>Species: ${animal.species}</p><p>Personality: ${animal.personality}</p><p>Notes: `
      if (animal.comments < 1)
        animalTraits += "You have no notes for this animal!</p>"
      else
        animalTraits += `<ol>${animalComments.toString().replace(/,/g , '')}</ol>`;
      $("#animal-" + id).html(animalTraits);
      })
    });
});

$(function() {
  $("button.js-show").on('click', function() {
    $(this).hide();
    let zoo_id = $(this).data("zoo-id");
    let user_id = $(this).data("user-id");

    $.get(`/users/${user_id}/zoos/${zoo_id}.json`, function (data) {
      let animals = data.animals;
      let showAnimals = $.map(animals, animal => { 
       return `<li>${animal.name} the ${animal.species}</li>`
      })
      
      $('#animals').html(showAnimals)
    })
  })
})

// $(function(){
//   Animal.ready()
// })
