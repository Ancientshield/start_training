const { environment } = require("@rails/webpacker");
const nodeExternals = require("webpack-node-externals");

// environment.config.target = "node";

// environment.config.externals = [
//   { express: "commonjs express" },
//   nodeExternals()
// ];

const webpack = require("webpack");

environment.loaders.append("expose", {
  test: require.resolve("jquery"),
  use: [
    {
      loader: "expose-loader",
      options: "jQuery"
    },
    {
      loader: "expose-loader",
      options: "$"
    }
  ]
});

environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    Popper: ["popper.js", "default"]
  })
);

module.exports = environment;
