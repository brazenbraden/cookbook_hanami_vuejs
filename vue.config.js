module.exports = {
  configureWebpack: {
    devServer: {
      proxy: {
        "^/api": {
          target: "http://localhost:2300",
          headers: { "Access-Control-Allow-Origin": "*" },
          changeOrigin: true,
          logLevel: "debug",
          pathRewrite: { "^/api": "/" },
        },
      },
    },
  },
};
