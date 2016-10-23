const webpack = require('webpack');
const CopyWebpackPlugin = require("copy-webpack-plugin");

module.exports = {
  devtool: "source-map",
  entry: {
    "app": ["./web/static/js/app.js"],
  },
  output: {
    path: "./priv/static/",
    filename: "js/[name].js"
  },
  resolve: {
    modulesDirectories: [ "node_modules", __dirname + "/web/static/js" ],
    extensions: ['', '.js', '.vue'],
    fallback: [__dirname +  "/node_modules"],
    alias: {
      'vue': 'vue/dist/vue.js',
    }
  },
  resolveLoader: {
    fallback: [__dirname +  "/node_modules"]
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: "babel",
        exclude: /node_modules/,
      },
      {
        test: /\.vue$/,
        loader: 'vue',
      },
    ]
  },
  babel: {
    presets: ['es2015'],
    plugins: ['transform-runtime']
  },
  vue: {
    loaders: {
      css: "vue-style-loader!css-loader",
      less: "vue-style-loader!css-loader!less-loader",
      postcss: "vue-style-loader!css-loader",
      sass: "vue-style-loader!css-loader!sass-loader?indentedSyntax",
      scss: "vue-style-loader!css-loader!sass-loader",
      styl: "vue-style-loader!css-loader!stylus-loader",
      stylus: "vue-style-loader!css-loader!stylus-loader"
    }
  },

  plugins: [
    new CopyWebpackPlugin([{ from: "./web/static/assets" }]),
    new webpack.ProvidePlugin({
      'fetch': 'imports?this=>global!exports?global.fetch!whatwg-fetch'
    }),
  ]
}
