import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [
        "ingredient1",
        "ingredient2"
      ],
      loop: true,
      attr: 'placeholder',
      typeSpeed: 50,
      backSpeed: 30,
      backDelay: 500,
      startDelay: 100,
      bindInputFocusEvents: true,
    })
  }
}

// <p><span data-controller="typed-js"></span></p>

{/*
<input
  class="form-control typed string required"
  type="text"
  name="search[query]"
  id="typedhome"
  data-controller="typed-js"
  placeholder= "ingredient"
/>
*/}
