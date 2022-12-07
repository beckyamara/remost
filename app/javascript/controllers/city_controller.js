import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="city"
export default class extends Controller {

  static values = {
    apiKey: String,
    placesMarkers: Array,
    city: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    const config = {
      container: this.element,
      style: "mapbox://styles/jane-doronina/cl7ropavj000t15lckgo1ky9j",
    }

    if (this.placesMarkersValue.length == 0) {
      config.center = [this.cityValue.longitude, this.cityValue.latitude]
      config.zoom = 10
    }

    this.city = new mapboxgl.Map(config)

    this.#addPlacesMarkersToMap()
    this.#fitMapToPlacesMarkers()
  }

  #addPlacesMarkersToMap() {
    this.placesMarkersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.place_window)

      const customMarker = document.createElement("div")
      customMarker.className = "marker-dot"
      customMarker.style.borderRadius = "90%"

      customMarker.insertAdjacentHTML('afterbegin', marker.place_marker)

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.city)
    })
  }

  #fitMapToPlacesMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.placesMarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.city.fitBounds(bounds, { padding: 300, maxZoom: 15, duration: 0 })
  }
}
