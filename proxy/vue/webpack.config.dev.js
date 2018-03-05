module.exports = {
  entry: './src/app.ts',
  output: {
    filename: './vue-bundle.js'
  },
  resolve: {
    extensions: ['.ts', '.tsx', '.js']
  },
  module: {
    rules: [
      { 
        test: /\.ts?$/,
        use: [
          {loader: 'ts-loader'}
        ]
      }
    ]
  }
};
