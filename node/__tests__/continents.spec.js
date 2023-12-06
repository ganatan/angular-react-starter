import request from 'supertest';
import express from 'express';
import router from '../src/app/routes/routes';

const app = express();

const ITEMS_CONTINENTS_COUNT = { count: 7 };

const ITEMS_CONTINENTS = [
  {
    id: 1000,
    code: 'AF',
    name: 'Africa',
    area: 30370000,
    countriesNumber: 61,
  },
  {
    id: 1001,
    code: 'NA',
    name: 'North America',
    area: 24709000,
    countriesNumber: 23,
  },
  {
    id: 1002,
    code: 'SA',
    name: 'South America',
    area: 17840000,
    countriesNumber: 14,
  },
  {
    id: 1003,
    code: 'AN',
    name: 'Antarctica',
    area: 14200000,
    countriesNumber: 0,
  },
  {
    id: 1004,
    code: 'AS',
    name: 'Asia',
    area: 44579000,
    countriesNumber: 55,
  },
  {
    id: 1005,
    code: 'OC',
    name: 'Australia',
    area: 8600000,
    countriesNumber: 2,
  },
  {
    id: 1006,
    code: 'EU',
    name: 'Europe',
    area: 10180000,
    countriesNumber: 56,
  },
];

app.use('/', router);

describe('Test Handlers', function () {
  test('responds to /', async () => {
    const res = await request(app).get('/continents');
    const text = JSON.parse(res.text);
    expect(text).toEqual(ITEMS_CONTINENTS);
  });

  test('responds to /', async () => {
    const res = await request(app).get('/continents/count');
    const text = JSON.parse(res.text);
    expect(text).toEqual(ITEMS_CONTINENTS_COUNT);
  });
});
