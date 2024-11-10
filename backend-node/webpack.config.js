const path = require('path');

module.exports = {
  mode: 'production',
  entry: './src/app.js',
  output: {
    path: path.join(__dirname, 'dist'),
    publicPath: '/',
    filename: 'app.js',
  },
  target: 'node',
};
