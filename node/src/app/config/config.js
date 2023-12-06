const environments = {
  development: {
    appName: 'node-starter-dev',
    url: 'http://localhost:5001',
    port: 5001,
  },
  production: {
    appName: 'node-starter-prod',
    url: 'http://localhost:5002',
    port: 5002,
  },
  test: {
    appName: 'node-starter-test',
    url: 'http://localhost:5003',
    port: 5003,
  },
};

const env = process.env.NODE_ENV;
const config = typeof (environments[env]) === 'object' ? environments[env] : environments.development;

module.exports = config;
