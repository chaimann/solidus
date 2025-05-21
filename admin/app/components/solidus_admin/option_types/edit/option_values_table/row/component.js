import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["focusable"]

  connect() {
    this.focusableTarget.focus();
  }

  remove() {
    this.element.remove();
  }

  applyOnEnter(event) {
    const submitter = event.target.form.elements.apply
    if (submitter) {
      event.preventDefault();
      event.target.form.requestSubmit(submitter);
    }
  }
}
