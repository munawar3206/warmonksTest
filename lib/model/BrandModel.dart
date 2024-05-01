class BrandModel {
  bool success;
  String message;
  List<Brand> data;

  BrandModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        success: json["success"],
        message: json["message"],
        data: List<Brand>.from(json["data"].map((x) => Brand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Brand {
  String id;
  String category;
  String brand;

  Brand({
    required this.id,
    required this.category,
    required this.brand,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        category: json["category"],
        brand: json["Brand"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "Brand": brand,
      };
}
