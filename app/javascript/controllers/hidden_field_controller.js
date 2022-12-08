import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hidden-field-controller"
export default class extends Controller {
  static targets = ["field"]

  display(event) {
    event.preventDefault();
    this.fieldTarget.classList.toggle("d-none");
  }
}
