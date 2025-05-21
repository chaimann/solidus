import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["focusable"]

  connect() {
    this.focusableTarget.focus();
  }

  remove() {
    this.element.remove();
  }
}
