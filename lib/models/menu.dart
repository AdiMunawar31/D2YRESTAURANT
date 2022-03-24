import 'package:d2yrestaurant/models/drink.dart';
import 'package:d2yrestaurant/models/food.dart';

class Menus {
  late List<Foods>? foods;
  late List<Drinks>? drinks;

  Menus({this.foods, this.drinks});

  Menus.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((food) {
        foods!.add(Foods.fromJson(food));
      });
    }
    if (json['drinks'] != null) {
      drinks = <Drinks>[];
      json['drinks'].forEach((drink) {
        drinks!.add(Drinks.fromJson(drink));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (foods != null) {
      data['foods'] = foods!.map((food) => food.toJson()).toList();
    }
    if (drinks != null) {
      data['drinks'] = drinks!.map((drink) => drink.toJson()).toList();
    }
    return data;
  }
}
