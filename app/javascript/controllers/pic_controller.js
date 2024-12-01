import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "pic" ]
  connect() {
    // this.element.textContent = "Hello World!"
  }

  loaded() {
    console.log("loaded:", this.picTarget)
    this.picTarget.classList.add("loaded")
  }
}
