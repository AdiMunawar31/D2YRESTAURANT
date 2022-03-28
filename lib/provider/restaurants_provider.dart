import 'package:d2yrestaurant/data/api/restaurant_api_service.dart';
import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:flutter/foundation.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantsProvider extends ChangeNotifier {
  final RestaurantApiService restaurantApiService;

  RestaurantsProvider({required this.restaurantApiService}) {
    _fetchAllRestaurant();
  }

  late RestaurantResult _restaurantResult;
  late ResultState _state;
  late String _message = '';

  String get message => _message;

  RestaurantResult get result => _restaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await restaurantApiService.getRestaurantList();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch (err) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $err';
    }
  }
}
