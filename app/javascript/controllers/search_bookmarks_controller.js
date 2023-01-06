import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bookmarks"
export default class extends Controller {
  static targets = [ "form", "list", "searchInput", "selectCity", "selectCategory" ]

  refresh() {
    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}&city=${this.selectCityTarget.value}&category=${this.selectCategoryTarget.value}`;
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data;
    })
  }
}
