class Drinks {
  late String name;

  Drinks({required this.name});

  factory Drinks.fromJson(Map<String, dynamic> drinks) {
    return Drinks(name: drinks['name']);
  }

  toJson() {}
}
