const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Open Sans", ...defaultTheme.fontFamily.sans],
        oswald: ["Oswald", ...defaultTheme.fontFamily.sans],
        code: ["Source Code Pro", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        "off-black": "#222629",
        "ninja-red": "#c75240",
        "code-gray": "#2e3440ff",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
  ],
};
