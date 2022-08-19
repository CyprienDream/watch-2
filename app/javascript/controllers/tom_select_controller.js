import { Controller } from "@hotwired/stimulus"
import "tom-select"

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    new TomSelect(this.element,
                  {
                    create: true,
                    sortField: {
                      field: "text",
                      direction: "asc"
                    }
                  })
  }
}
