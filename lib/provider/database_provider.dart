import 'package:d2yrestaurant/data/db/database_helper.dart';
import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:d2yrestaurant/helpers/state.dart';
import 'package:flutter/foundation.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    getFavorites();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Restaurant> _favorites = [];
  List<Restaurant> get favorites => _favorites;

  void getFavorites() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _favorites = await databaseHelper.getAllFavorites();
      if (_favorites.isNotEmpty) {
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
        _message = 'Empty Data';
      }
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  void addFavorite(Restaurant restaurant) async {
    try {
      await databaseHelper.insertFavorite(restaurant);
      getFavorites();
    } catch (err) {
      _state = ResultState.error;
      _message = 'Error: $err';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async {
    final favoritedRestaurant = await databaseHelper.getFavoriteById(id);
    return favoritedRestaurant.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      getFavorites();
    } catch (err) {
      _state = ResultState.error;
      _message = 'Error: $err';
      notifyListeners();
    }
  }
}
