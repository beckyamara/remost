import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmarktip"
export default class extends Controller {
  static targets = ["soildheart", "regularheart"]

  connect() {
    console.log(this.soildheartTarget)
    console.log(this.regularheartTarget)
  }

  unfav() {
    this.soildheartValue.classList.remove("fa-solid")
    this.soildheartValue.classList.add("fa-regular")
    fetch('/cities', { headers: { accept: "application/json" } })
  }
  fav() {
    this.soildheartValue.classList.remove("fa-regular")
    this.soildheartValue.classList.add("fa-solid")
  }
}
