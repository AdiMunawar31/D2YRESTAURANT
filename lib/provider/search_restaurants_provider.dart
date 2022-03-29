import 'dart:io';

import 'package:d2yrestaurant/data/api/search_restaurant_api_service.dart';
import 'package:d2yrestaurant/data/models/search_restaurant.dart';
import 'package:flutter/foundation.dart';

enum ResultState { Loading, NoData, HasData, Error }

class SearchRestaurantsProvider extends ChangeNotifier {
  final SearchRestaurantApiService searchRestaurantApiService;

  SearchRestaurantsProvider({required this.searchRestaurantApiService}) {
    fetchRestaurantSearch(query);
  }

  late SearchRestaurantResult _searchRestaurantResult;
  late ResultState _state;
  late String _message = '';
  final String _query = '';

  String get message => _message;

  SearchRestaurantResult get result => _searchRestaurantResult;

  ResultState get state => _state;

  String get query => _query;

  Future<dynamic> fetchRestaurantSearch(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurants =
          await searchRestaurantApiService.getRestaurantSearch(query);
      if (restaurants.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _searchRestaurantResult = restaurants;
      }
    } on SocketException {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "No Internet Connection";
    } catch (err) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $err';
    }
  }
}
