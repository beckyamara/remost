import { Controller } from "@hotwired/stimulus"


// WORK IN (SORT OF) PROGRESS

export default class extends Controller {

  connect() {
      console.log("hello from trip_dates_calendar controller")
    }

    static targets = ["start_date_input", "end_date_input"]

  setEndDate(e) {
      end_date.setAttribute("min", start_date.value)
      }

}
