const path = require('path');

module.exports = {
  mode: 'development',
  entry: './src/app.js',
  output: {
    path: path.join(__dirname, 'dist'),
    publicPath: '/',
    filename: 'app.js',
  },
  target: 'node',
};
