exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['target/test/e2e/*.spec.js'],
  baseUrl: 'http://localhost:3000'
};