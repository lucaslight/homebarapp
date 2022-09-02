// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
console.log("Hello from app/javascript/application.js")

// Get the modal

let buttons = document.querySelectorAll(".index-card-wrap");
let myModal = document.querySelector(".modal");
let modalName = document.querySelector(".show-cocktail-name");
// let modalIngredients = document.querySelector(".show-card-ingredients");
// let modalMethod = document.querySelector(".show-card-method");

buttons.forEach((button) => {
  // When the user clicks on <span> (x), close the modal
  button.onclick = function() {
    myModal.style.display = "none";
  }

  // When the user clicks on the button, open the modal
  button.onclick = function() {
    myModal.style.display = "block";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == myModal) {
      myModal.style.display = "none";
    }
  }

  button.addEventListener('click', (event) => {
    myModal.id = button.id
    console.log(button.getElementsByClassName("index-card-ingredients"));
    modalName.innerHTML = button.getElementsByClassName("index-cocktail-name")[0].innerHTML
    // modalIngredients.innerHTML = button.getElementsByClassName("index-card-ingredients")[0].innerHTML
    // modalMethod.innerHTML = button.getElementsByClassName("show-card-method")[0].innerHTML

    // Interpolation: (`myModal-${button.id}`)
    // Get the button that opens the modal
    var btn = document.getElementById(`myBtn-${button.id}`);
    console.log(button.id);
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
  })
})
