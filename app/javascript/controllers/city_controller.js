import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="city"
export default class extends Controller {

  static values = {
    apiKey: String,
    tipsMarkers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.city = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addTipsMarkersToMap()
  }

  #addTipsMarkersToMap() {
    this.tipsMarkersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.tips_window)
      console.log(marker.tips_window)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.city)
    })
  }
}
