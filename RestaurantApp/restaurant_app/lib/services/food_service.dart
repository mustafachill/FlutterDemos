class Food {
  String name;
  String price;
  String imagePath;
  String rating;
  String describe;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.describe,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
  String get _describe => describe;
}
