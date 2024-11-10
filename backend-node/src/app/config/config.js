const environments = {
  development: {
    appName: 'node-starter-dev',
    url: 'http://localhost:5000',
    port: 5000,
  },
  production: {
    appName: 'node-starter-prod',
    url: 'http://localhost:5001',
    port: 5001,
  },
  test: {
    appName: 'node-starter-test',
    url: 'http://localhost:5002',
    port: 5002,
  },
};

const env = process.env.NODE_ENV;
const config = typeof (environments[env]) === 'object' ? environments[env] : environments.development;

module.exports = config;
