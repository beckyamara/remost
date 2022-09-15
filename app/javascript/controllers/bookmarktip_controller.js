import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmarktip"
export default class extends Controller {
  static targets = ["unfav", "fav"]

  connect() {
    console.log("hello from bookmarktip controller")
    this.user = this.element.dataset.user
    console.log(this.user)
  }

  unfav(e) {
    //e.preventDefault()
    console.log("unfaving")
    this.unfavTarget.classList.add("d-none")
    this.favTarget.classList.remove("d-none")
    console.log(this.unfavTarget);
  }
  fav(e) {
    e.preventDefault()
    console.log("Faving")
    this.favTarget.classList.add("d-none")
    this.unfavTarget.classList.remove("d-none")
    console.log(this.favTarget.href);
    //this.favTarget.src
    console.log(`${this.favTarget.href}?user_id=${this.user}`)
    fetch(`${this.favTarget.href}?user_id=${this.user}`,
      { headers: {"Accept": "application/json"}}
    )
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      })

  }
}
