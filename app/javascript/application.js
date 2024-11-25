// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import morphdom from "morphdom"
import "controllers"

document.addEventListener("turbo:before-frame-render", (event) => {
    console.log("here")
    event.detail.render = (currentElement, newElement) => {
      morphdom(currentElement, newElement, { childrenOnly: true })
    }
  })