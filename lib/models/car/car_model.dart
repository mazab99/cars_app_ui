class CarModel {
  final String name;
  final String image;
  final int id;
  final double height;
  final double weight;
  final String description;

  CarModel({
    required this.name,
    required this.image,
    required this.id,
    required this.height,
    required this.weight,
    required this.description,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      name: json['name'],
      image: json['image'],
      id: json['id'],
      description: json['description'],
      height: json['height'].toDouble(),
      weight: json['weight'].toDouble(),
    );
  }
}
