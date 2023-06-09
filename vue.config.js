const { defineConfig } = require("@vue/cli-service");
module.exports = {
  configureWebpack: {
    devServer: {
      proxy: "http://localhost:2300",
      headers: { "Access-Control-Allow-Origin": "*" }
    },
  }
}
