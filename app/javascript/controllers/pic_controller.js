import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "pic" ]
  
  loaded() {
    this.picTarget.classList.add("loaded")
  }
}
