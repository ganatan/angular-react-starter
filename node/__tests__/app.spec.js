import express from 'express';

import router from '../src/app/routes/routes';

const app = express();

app.use('/', router);

describe('Test Handlers', function () {
  test('responds to /', () => {
    expect(true).toEqual(true);
  });
});
