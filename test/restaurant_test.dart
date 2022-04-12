import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:flutter_test/flutter_test.dart';

var restaurantResult = {
  "error": false,
  "message": "success",
  "count": 20,
  "restaurants": [
    {
      "id": "rqdv5juczeskfw1e867",
      "name": "Melting Pot",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
      "pictureId": "14",
      "city": "Medan",
      "rating": 4.2
    }
  ]
};

void main() {
  test('memverifikasi proses parsing json telah berhasil', () {
    var restaurant = RestaurantResult.fromJson(restaurantResult).message;

    expect(restaurant, 'success');
  });
}
