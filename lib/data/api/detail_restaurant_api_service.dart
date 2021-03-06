import 'dart:convert';
import 'package:d2yrestaurant/data/models/detail_restaurant.dart';
import 'package:http/http.dart' as http;

class DetailRestaurantApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<DetailRestaurantResult> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/$id'));
    if (response.statusCode == 200) {
      return DetailRestaurantResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }
}
