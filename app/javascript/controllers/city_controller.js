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
      style: "mapbox://styles/jane-doronina/cl7ropavj000t15lckgo1ky9j"
    })

    this.#addTipsMarkersToMap()
    this.#fitMapToTipsMarkers()
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

  #fitMapToTipsMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.tipsMarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.city.fitBounds(bounds, { padding: 300, maxZoom: 15, duration: 0 })
   }
}
