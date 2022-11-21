import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password-change"
export default class extends Controller {
  static targets = ["password"]

  display(event) {
    event.preventDefault();
    this.passwordTarget.classList.toggle("d-none");
  }
}
