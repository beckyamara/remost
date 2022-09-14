import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["London", "Paris", "Dublin", "Madrid", "Lisbon", "Berlin"],
      typeSpeed: 100,
      loop: true
    })
  }
}
