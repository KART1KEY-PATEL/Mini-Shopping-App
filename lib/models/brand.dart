// lib/models/brand.dart

class Brand {
  final String name;
  final String assetPath;

  Brand({
    required this.name,
    required this.assetPath,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'],
      assetPath: json['assets'],
    );
  }
}