import 'dart:convert';
import 'package:d2yrestaurant/data/models/search_restaurant.dart';
import 'package:http/http.dart' as http;

class SearchRestaurantApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<SearchRestaurantResult> getRestaurantSearch(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=$query'));
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant search');
    }
  }
}
