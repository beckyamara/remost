// app/javascript/controllers/movie_card_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmarktip"
export default class extends Controller {
  static targets = ["solidheart", "regularheart"]

  connect() {
    console.log("hello from bookmarktip")
  }
  unfav(e) {
    e.preventDefault()
    this.solidheartTarget.classList.remove("fa-solid")
    this.solidheartTarget.classList.add("fa-regular")

  }

  update(event) {
    event.preventDefault()
    const url = this.solidheartTarget.action
    fetch(url, {
      method: "DELETE",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      })
  }
}
// update() {
//   const url = `${this.olidheartTarget.action}?query=${this.inputTarget.value}`
//   fetch(url, {headers: {"Accept": "text/plain"}})
//     .then(response => response.text())
//     .then((data) => {
//       this.listTarget.outerHTML = data
//     })
// }

// const url = `${this.olidheartTarget.action}?query=${this.inputTarget.value}`
// fetch(url,
//   {
//       method: "DELETE",
//       headers: { 'Content-Type': 'application/json' },
//       body: JSON.stringify({password: '123'})
//   })
// }
