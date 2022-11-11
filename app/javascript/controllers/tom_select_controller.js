import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = { options: Object };
  connect() {
    console.log("hello from tom-select controller"),
    new TomSelect("#select-state",{
      maxItems: 3
    });
    // new TomSelect(
    //   this.element ,
    //   this.optionsValue
    // );
  }
}
