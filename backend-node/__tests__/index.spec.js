import request from 'supertest';
import express from 'express';
import router from '../src/app/routes/routes';

const app = express();

app.use('/', router);

describe('Test API CRUD /', function () {
  test('responds to /', async () => {
    process.env.NODE_ENV = 'undefined';
    let res = await request(app).get('/');
    let text = JSON.parse(res.text);
    let data = {
      environment: 'undefined',
      applicationName: 'node-starter-test',
      url: 'http://localhost:5002',
      port: 5002,
    };
    expect(text).toEqual(data);

    process.env.NODE_ENV = 'production';
    res = await request(app).get('/');
    text = JSON.parse(res.text);
    data = {
      environment: 'production',
      applicationName: 'node-starter-test',
      url: 'http://localhost:5002',
      port: 5002,
    };
    expect(text).toEqual(data);
  });

  test('responds to /', async () => {
    const res = await request(app).get('/notfound');
    const text = JSON.parse(res.text);
    const data = { error: 'notfound' };
    expect(text).toEqual(data);
  });
});
