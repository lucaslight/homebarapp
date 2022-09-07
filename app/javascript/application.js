// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
console.log("app/javascript/application.js is connected");

// Get the modal
document.addEventListener("turbo:load", () => {
  let myModal = document.querySelector(".modal");
  let buttons = document.querySelectorAll(".index-cocktail-name");
  let modalName = document.querySelector(".show-cocktail-name");
  let modalIngredients = document.querySelector(".show-card-ingredients");
  let modalBottom = document.querySelector(".show-card-bottom");

  buttons.forEach((button) => {
    // When the user clicks on the button, open the modal
    button.onclick = function() {
      myModal.style.display = "block";
    };

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == myModal) {
        myModal.style.display = "none";
      }
    };

    button.addEventListener('click', (event) => {
      // Test console.logging:
      // console.log(button.parentNode.parentNode.getElementsByClassName("index-card-bottom")[0].innerText)
      // console.log(button.parentNode.getElementsByClassName("index-measurements")[0].outerHTML)
      // console.log(button.parentNode.parentNode.getElementsByClassName("modal-bottom")[0])
      // console.log(button.parentNode.parentNode.getElementsByClassName("modal-bottom")[0])

      myModal.id = button.id;
      modalName.innerHTML = button.innerHTML;
      modalIngredients.innerHTML = button.parentNode.getElementsByClassName("index-measurements")[0].outerHTML;

      // Below makes "index-measurements" removes styling from the HTML, making it visible:
      modalIngredients.getElementsByClassName("index-measurements")[0].style = "none";
      // modalIngredients.getElementsByClassName("index-measurements")[0])
      // Need "modal-bottom" to have visibility, and remove height styling

      // modalBottom Displays the Method and whether the drink contains alcohol or not:
      modalBottom.innerHTML = button.parentNode.parentNode.getElementsByClassName("modal-bottom")[0].outerHTML;
      modalBottom.parentNode.parentNode.getElementsByClassName("modal-bottom")[0].style = "none";
    })
  })
})
