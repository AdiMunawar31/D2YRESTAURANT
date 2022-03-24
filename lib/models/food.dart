class Foods {
  late String name;

  Foods({required this.name});

  factory Foods.fromJson(Map<String, dynamic> foods) {
    return Foods(name: foods['name']);
  }

  toJson() {}
}
