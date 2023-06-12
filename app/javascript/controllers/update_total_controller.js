import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-total"
export default class extends Controller {
  static targets = ['startDate', 'endDate', 'pricePerNight', 'total']
  connect() {

  }

  refreshTotal() {
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);
    if (startDate && endDate && startDate <= endDate) {
      const pricePerNight = parseInt(this.pricePerNightTarget.textContent)
      const diffInTime = endDate.getTime() - startDate.getTime()
      const diffInDays = Math.ceil(diffInTime / (1000 * 3600 * 24))
      const total = diffInDays * pricePerNight
      this.totalTarget.textContent = total
    } else {
  //   console.log(startDate)
  //   console.log(endDate)
  // }
  this.totalTarget.textContent = "0"
}
}
}
