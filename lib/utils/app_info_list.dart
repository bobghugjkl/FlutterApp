//对于不同的图片阅读不同的信息
List<Map<String, dynamic>> hotelList = [
  //dynamic动态的，可以是任何东西
  //用到map，键值对
  {
    'image': 'one.png',
    'place': 'Open Space',
    'destination': 'London',
    'price': 25
  },
  {
    'image': 'two.png',
    'place': 'Global Will',
    'destination': 'London',
    'price': 40
  },
  {
    'image': 'three.png',
    'place': 'Tallest Building',
    'destination': 'Dubai',
    'price': 68
  },
];
//对于不同的地点也可以这样优化
List<Map<String, dynamic>> ticketList = [
  {
    'from': {'code': "NYC", 'name': "New-Yoke"},
    'to': {
      'code': "LDN",
      'name': "London",
    },
    'flying_time': '8H 30M',
    'date': "1 MAY",
    'departure_time': "08:00 AM",
    "number": 23
  },
  {
    'from': {'code': "DK", 'name': "Dhaka"},
    'to': {
      'code': "SH",
      'name': "Shanghai",
    },
    'flying_time': "4H 20M",
    'date': "10 MAY",
    'departure_time': "09:00 AM",
    "number": 45
  },
];
