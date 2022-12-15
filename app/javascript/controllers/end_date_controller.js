import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="end-date"
export default class extends Controller {
  static targets = ["start", "end"]

  setEndDate() {
    this.endTarget.setAttribute("min",this.startTarget.value)
  }
}
