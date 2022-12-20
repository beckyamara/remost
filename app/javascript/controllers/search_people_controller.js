import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-people"
export default class extends Controller {
  static targets = [ "form", "list", "searchInput", "selectCity", "selectDepartment", "selectDate" ]

  refresh() {
    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}&department=${this.selectDepartmentTarget.value}&city=${this.selectCityTarget.value}&date=${this.selectDateTarget.value}`;
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data;
    })
  }
}
