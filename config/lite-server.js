const historyFallback = require('connect-history-api-fallback');

module.exports = {
  port: 3000,
  files: [
    './app/**/*.*',
  ],
  server: {
    baseDir: './dist/',
    middleware: {
      // overrides the second middleware default with new settings
      1: historyFallback({
        index: '/',
        verbose: true,
      }),
    }
  }
};
