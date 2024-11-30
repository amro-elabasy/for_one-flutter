class BarberModel {
  final String name;
  final String imageUrl;
  bool isSelected;

  BarberModel({
    required this.name,
    required this.imageUrl,
    this.isSelected = false,
  });
}
