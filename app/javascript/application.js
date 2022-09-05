// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
console.log("Hello from app/javascript/application.js")

// Get the modal

document.addEventListener("turbo:load", () => {
  let buttons = document.querySelectorAll(".index-card-header");
  let myModal = document.querySelector(".modal");

  let modalName = document.querySelector(".show-cocktail-name");
  // let modalIngredients = document.querySelector(".show-card-ingredients");
  // let modalMethod = document.querySelector(".show-card-method");

  buttons.forEach((button) => {
    button.addEventListener('click', (event) => {
      myModal.id = button.id
      console.log(button.getElementsByClassName("index-card-ingredients"));
      modalName.innerHTML = button.getElementsByClassName("index-cocktail-name")[0].innerHTML

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
    })
  })
})
