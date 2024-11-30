class ServiceModel {
  final String name;
  final String description;
  final String icon;
  final double price;
  bool isSelected;

  ServiceModel({
    required this.name,
    required this.description,
    required this.icon,
    required this.price,
    this.isSelected = false,
  });
}
