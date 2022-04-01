import 'dart:io';

import 'package:d2yrestaurant/data/api/detail_restaurant_api_service.dart';
import 'package:d2yrestaurant/data/models/detail_restaurant.dart';
import 'package:d2yrestaurant/helpers/state.dart';
import 'package:flutter/foundation.dart';

class DetailRestaurantsProvider extends ChangeNotifier {
  final DetailRestaurantApiService detailRestaurantApiService;
  final String id;

  DetailRestaurantsProvider(
      {required this.detailRestaurantApiService, required this.id}) {
    _fetchRestaurantDetail();
  }

  late DetailRestaurantResult _detailRestaurantResult;
  late ResultState _state;
  late String _message = '';

  String get message => _message;

  DetailRestaurantResult get result => _detailRestaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchRestaurantDetail() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurants =
          await detailRestaurantApiService.getRestaurantDetail(id);
      if (restaurants.message.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detailRestaurantResult = restaurants;
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
