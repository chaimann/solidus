import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "taxonomiesSelect"];

  updateParents(event) {
    const formData = new FormData(this.formTarget);
    const params = new URLSearchParams(formData);
    params.delete("authenticity_token");

    const url = new URL(event.params.url);
    for (const [key, value] of params.entries()) {
      url.searchParams.set(key, value);
    }
    // url.searchParams.set("taxon[name]", this.formTarget["taxon[name]"].value);
    // url.searchParams.set("taxon[taxonomy_id]", this.formTarget["taxon[taxonomy_id]"].value);

    window.Turbo.visit(url, { frame: "new_product_category" });
  }
}
