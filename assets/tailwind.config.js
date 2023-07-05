// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

let plugin = require("tailwindcss/plugin");

module.exports = {
  content: ["./js/**/*.js", "./lib/**/*.ex"],
  theme: {
    extend: {
      typography: {
        DEFAULT: {
          css: {
            pre: false,
          },
        },
      },
    },
  },
  plugins: [require("@tailwindcss/typography"), require("@tailwindcss/forms")],
};
