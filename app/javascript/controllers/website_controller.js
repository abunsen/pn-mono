import { Controller } from "@hotwired/stimulus";
import _ from "lodash";

export default class extends Controller {
  static targets = ["revealImage", "revealBorder", "revealContainer"];

  connect() {
    this.clickedOn = false;
    // this.revealSlide = _.debounce(this.revealSlide, 10).bind(this);
  }

  revealClick(event) {
    event.preventDefault();
    this.clickedOn = true;
  }

  revealUnclick(event) {
    event.preventDefault();
    this.clickedOn = false;
  }

  revealSlide(event) {
    let rect = this.revealContainerTarget.getBoundingClientRect();
    console.log("event.srcElement", event.srcElement);
    let x = event.clientX - rect.left;
    console.log("x", x);
    let w = rect.width;
    console.log("w", w);
    let revealPct = (x / w) * 100;
    revealPct = revealPct > 100 ? 95 : revealPct;
    revealPct = revealPct < 0 ? 5 : revealPct;

    console.log("revealPct", revealPct);
    if (this.clickedOn) {
      this.revealImageTarget.style.clipPath = `polygon(0 0, ${revealPct}% 0, ${revealPct}% 100%, 0 100%)`;
      this.revealBorderTarget.style.left = `${revealPct}%`;
    }
  }
}
