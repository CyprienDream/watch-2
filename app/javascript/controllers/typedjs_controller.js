import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="typedjs"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["First sentence.", "Second sentence."],
      typeSpeed: 30
    });
  }
}
