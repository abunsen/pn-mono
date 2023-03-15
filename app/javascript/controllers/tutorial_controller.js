import { Controller } from "@hotwired/stimulus";
import { getHighlighter } from "shiki-es";

export default class extends Controller {
  connect() {
    this.highlightCodeSamples();
  }

  codeSamples() {
    let codeSamples = document.querySelectorAll("[data-tut-lang]");
    return [...codeSamples].map((s) => {
      return {
        sample: s.innerHTML,
        lang: s.dataset.tutLang,
        target: s.id,
      };
    });
  }

  async highlightCodeSamples() {
    let codeSamples = this.codeSamples();
    let highlighter = await getHighlighter({
      theme: "nord",
      langs: codeSamples.map((s) => s.lang),
    });
    codeSamples.forEach((code) => {
      if (document.getElementById(code.target))
        document.getElementById(code.target).innerHTML = highlighter.codeToHtml(
          code.sample,
          {
            lang: code.lang,
          }
        );
    });
  }
}
