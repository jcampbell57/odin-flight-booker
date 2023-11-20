import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = [ 'error',
                     'passengerInfo',
                     'passengerTemplate' ]

  connect() {
    console.log('Hello from passenger controller!')
    this.passengerCount = this.passengerInfoTarget.childElementCount
  }

  add() {
    // if statement checks to see if HTML template is supported
    if ("content" in document.createElement("template")) {
      this.errorTarget.textContent = ''
      this.passengerCount++

      const template = this.passengerTemplateTarget;
      const clone = template.content.cloneNode(true)
      clone.querySelector('legend').textContent = `Passenger #${this.passengerCount}`
      this.passengerInfoTarget.appendChild(clone);
    } else {
      this.errorTarget.textContent = 'New passenger template not supported.'
    }
  } 

  remove() {
    if (this.passengerCount > 1) {
      this.errorTarget.textContent = ''
      this.passengerCount--

      this.passengerInfoTarget.children[this.passengerCount].remove()
    } else {
      this.errorTarget.textContent = 'There must be at least one passenger.'
    }
  }
}
