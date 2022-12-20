import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hidden-panel-controller"
export default class extends Controller {
  static targets = ["panel", "picture"]

  display(event) {
    event.preventDefault();
    this.panelTarget.classList.toggle("d-none");
    this.pictureTarget.classList.toggle("d-none");
  }
}
