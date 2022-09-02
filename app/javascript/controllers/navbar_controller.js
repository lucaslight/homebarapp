import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = [ "banner", "navbar"]
  connect() {
    console.log("sdsadasd")
    if (!this.hasBannerTarget) {
      this.navbarTarget.classList.remove("navbar-transparent")
      this.navbarTarget.classList.add("navbar-white")
    }
  }
  updateNavbar() {
    console.log("dankodanko")
    if (!this.hasBannerTarget) {
      return
    }

    if (window.scrollY > 60) {
      this.navbarTarget.classList.remove("navbar-transparent")
      this.navbarTarget.classList.add("navbar-white")
    } else {
      this.navbarTarget.classList.remove("navbar-white")
      this.navbarTarget.classList.add("navbar-transparent")
    }
  }
}
