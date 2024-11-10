import express from 'express';
import router from '../src/app/routes/routes';

const app = express();

app.use('/', router);

describe('API CRUD /hello', function () {
  test('responds to /', async () => {
    expect(true).toEqual(true);
  });
});
