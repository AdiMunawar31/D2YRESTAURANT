import 'dart:convert';
import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:http/http.dart' as http;

class RestaurantApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantResult> getRestaurantList() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + 'list'));
      if (response.statusCode == 200) {
        return RestaurantResult.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load restaurant list');
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
