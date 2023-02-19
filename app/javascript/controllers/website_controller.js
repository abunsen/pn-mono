import { Controller } from "@hotwired/stimulus";
import { getHighlighter } from "shiki-es";

export default class extends Controller {
  static targets = [
    "revealImage",
    "revealBorder",
    "revealContainer",
    "revealCodeContainer",
    "nodeSampleCode",
    "pythonSampleCode",
    "rubySampleCode",
    "phpSampleCode",
    "homepageCodeTabs",
    "homepageCodeTabContent",
  ];

  connect() {
    this.clickedOn = false;
    this.highlightCodeSamples();
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
    let x = event.clientX - rect.left;
    let w = rect.width;
    let revealPct = (x / w) * 100;
    revealPct = revealPct > 100 ? 95 : revealPct;
    revealPct = revealPct < 0 ? 5 : revealPct;

    if (this.clickedOn) {
      this.revealImageTarget.style.clipPath = `polygon(0 0, ${revealPct}% 0, ${revealPct}% 100%, 0 100%)`;
      this.revealBorderTarget.style.left = `${revealPct}%`;
    }
  }

  codeSamples() {
    return [
      {
        sample: `curl https://api.passninja.com/v1/passes/ \\
--request POST \\
--header 'Content-Type: application/json' \\
--header 'x-api-key: YOUR_ACCOUNT_ID' \\
--data '{
  "passType": "com.passNinja.espana.SagradaPass",
  "pass":{
    "venue": "Sagrada Familia Basic Ticket",
    "ticketType": "General",
    "expiration": "2023-01-26T17:00:00Z",
    "memberName": "John Brown",
    "amount": "20,00",
    "access": null,
    "barcode": "loc.85267798"
  }
}'`,
        lang: "bash",
        target: "revealCodeContainerTarget",
      },
      {
        sample: `import { PassNinjaClient } from '@passninja/passninja-js';

const accountId = '**your-account-id**';
const apiKey = '**your-api-key**';
const passNinjaClient = new PassNinjaClient(accountId, apiKey);
const simplePassObject = await passNinjaClient.pass.create(
 'demo.coupon', // passType
 {discount: '50%', memberName: 'John'} // passData
);

console.log(simplePassObject.url);
console.log(simplePassObject.passType);
console.log(simplePassObject.serialNumber);`,
        lang: "js",
        target: "nodeSampleCodeTarget",
      },
      {
        sample: `require "passninja"

pass = Pass.create(
  "demo.coupon",
  discount: '50%',
  memberName: 'John'
)

puts pass.url
puts pass.passType
puts pass.serialNumber
`,
        lang: "rb",
        target: "rubySampleCodeTarget",
      },
      {
        sample: `import passninja

issued_pass = passninja.create(
    "demo.coupon",
    {
      "discount": "50%",
      "memberName": "John"
    }
)

print(issued_pass.url);
print(issued_pass.passType);
print(issued_pass.serialNumber);`,
        lang: "py",
        target: "pythonSampleCodeTarget",
      },
      {
        sample: `require __DIR__ . '/vendor/autoload.php';
use PassNinja;

try {
  // Connect to Ganache
  $pass = new Pass(
    'demo.coupon',
    array(
      "discount" => "50%",
      "memberName": "John"
    )
  );
  // Should return Int 63
  echo $pass->url;
  echo $pass->passType;
  echo $pass->serialNumber;
}
catch (\Exception $exception) {
  die ("Unable to connect.");
}`,
        lang: "php",
        target: "phpSampleCodeTarget",
      },
    ];
  }

  async highlightCodeSamples() {
    let codeSamples = this.codeSamples();
    let highlighter = await getHighlighter({
      theme: "nord",
      langs: codeSamples.map((s) => s.lang),
    });
    codeSamples.forEach((code) => {
      let capTarget =
        "has" + code.target[0].toUpperCase() + code.target.slice(1);

      if (this[capTarget])
        this[code.target].innerHTML = highlighter.codeToHtml(code.sample, {
          lang: code.lang,
        });
    });
  }

  toggleCodeSampleTab(e) {
    e.preventDefault();
    let link = e.target.closest("a");
    let lang = link.href.split("#")[1];

    // highlight clicked tab
    this.homepageCodeTabsTarget.querySelectorAll("a").forEach((tab) => {
      tab.classList.remove("border-b-4");
      tab.classList.remove("border-ninja-red");
      tab.classList.remove("text-ninja-red");
      tab.classList.add("text-white");
    });
    link.classList.remove("text-white");
    link.classList.add("border-b-4");
    link.classList.add("border-ninja-red");
    link.classList.add("text-ninja-red");
    // hide all tabs then show tab content
    this.homepageCodeTabContentTarget
      .querySelectorAll("code")
      .forEach((code) => {
        code.classList.add("hidden");
      });

    this[`${lang}SampleCodeTarget`]
      .querySelector("code")
      .classList.remove("hidden");
    this[`${lang}SampleCodeTarget`].classList.remove("hidden");
  }
}
