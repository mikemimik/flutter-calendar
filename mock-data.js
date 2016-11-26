'use strict';

const mockData = [];

for (let i = 1; i <= 16; i++) {
  if (i <= 5) {
    mockData.push({
      id: i,
      title: `Event ${i}`,
      url: `/events/${i}`,
      date_start: '2016-11-25 12:00:00.000',
      date_end: '2016-11-25 13:00:00.000',
      details: 'anything'
    });
  } else if (i <= 13) {
    mockData.push({
      id: i,
      title: `Event ${i}`,
      url: `/events/${i}`,
      date_start: '2016-11-21 12:00:00.000',
      date_end: '2016-11-21 13:00:00.000',
      details: {
        foo: 'bar'
      }
    });
  } else {
    mockData.push({
      id: i,
      title: `Event ${i}`,
      url: `/events/${i}`,
      date_start: '2016-11-23 12:00:00.000',
      date_end: '2016-11-23 13:00:00.000',
      details: 10
    })
  }
}

module.exports = mockData;
