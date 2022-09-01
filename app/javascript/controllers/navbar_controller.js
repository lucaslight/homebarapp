import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = [ "banner", "navbar"]
  connect() {
    if (!this.hasBannerTarget) {
      this.navbarTarget.classList.remove("navbar-transparent")
      this.navbarTarget.classList.add("navbar-white")
    }
  }
  updateNavbar() {
    if (!this.hasBannerTarget) {
      return
    }

    if (window.scrollY > 250) {
      this.navbarTarget.classList.remove("navbar-transparent")
      this.navbarTarget.classList.add("navbar-white")
    } else {
      this.navbarTarget.classList.remove("navbar-whte")
      this.navbarTarget.classList.add("navbar-transparent")
    }
  }
}
