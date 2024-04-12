// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

let plugin = require("tailwindcss/plugin");
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: ["./js/**/*.js", "./lib/**/*.ex", "_data/**/*.yaml", "./assets/**/*.css"],
  theme: {
    extend: {
      colors: {
        'gold': {
          '50': '#faf9ec',
          '100': '#f4f1cd',
          '200': '#ebe19d',
          '300': '#dfcb65',
          '400': '#d5b43a',
          '500': '#c59e2d',
          '600': '#b78727',
          '700': '#885c20',
          '800': '#724b21',
          '900': '#623f21',
          '950': '#382110',
        }
      },

      fontFamily: {
        'sans': ['"Inter"', ...defaultTheme.fontFamily.sans],
        'fancy': ['"Rubik"', ...defaultTheme.fontFamily.sans],
      },
      typography: {
        DEFAULT: {
          css: {
            pre: false,
          },
        },
      },
    },
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/forms"),
    require("@tailwindcss/container-queries"),
  ],
};
