import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "passTemplateCount",
    "activePassCount",
    "activePassCountSlider",
    "monthlyTotalNumber",
    "monthlyTotalWrapper",
    "sum",
    "sumContact",
    "signupLink",
  ];

  connect() {}

  handlePassCountSlide(e) {
    e.preventDefault();
    this.activePassCountTarget.value = this.activePassCountSliderTarget.value;
    this.updateTotal();
  }

  handlePassCountUpdate(e) {
    e.preventDefault();
    this.activePassCountSliderTarget.value = this.activePassCountTarget.value;
    this.updateTotal();
  }

  handleTemplateCountUpdate(e) {
    this.updateTotal();
  }

  updateTotal() {
    let templateCost = this.passTemplateCountTarget.value * 5;
    let passCost = this.activePassCountTarget.value * 0.11;
    let total = templateCost + passCost;

    // format total
    if (total > 10000) {
      this.sumTarget.classList.remove("text-9xl");
      this.sumTarget.classList.add("text-7xl");
      this.sumTarget.classList.add("mt-1");
      this.monthlyTotalWrapperTarget.classList.add("hidden");
      this.sumContactTarget.innerHTML = "Contact us!";
      this.signupLinkTarget.href = `/#enterprise-signup`;
      return;
    } else if (total > 1000) {
      total = (total / 1000).toFixed(1) + "k";
    } else {
      total = total.toLocaleString("en-US");
    }
    this.sumContactTarget.innerHTML = "";
    this.sumTarget.classList.remove("text-7xl");
    this.sumTarget.classList.remove("mt-36");
    this.monthlyTotalWrapperTarget.classList.remove("hidden");
    this.sumTarget.classList.add("text-8xl");

    this.monthlyTotalNumberTarget.innerHTML = total;
    this.signupLinkTarget.href = `/#with-card:${total}`;
  }
}
