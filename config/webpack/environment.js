const { environment } = require("@rails/webpacker");
const webpack = require("webpack");

environment.loaders.append("expose", {
  test: require.resolve("jquery"),
  use: [
    {
      loader: "expose-loader",
      options: "jQuery",
    },
    {
      loader: "expose-loader",
      options: "$",
    },
  ],
});

environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    Popper: ["popper.js", "default"],
    "jQuery.bootstrap-tagsinput": "tagsinput.js",
  })
);

module.exports = environment;
