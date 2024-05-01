import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    bool success;
    String message;
    List<Product> data;

    ProductModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        message: json["message"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Product {
    String id;
    String name;
    String category;
    String brand;

    Product({
        required this.id,
        required this.name,
        required this.category,
        required this.brand,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["Name"],
        category: json["category"],
        brand:json["Brand"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "category": category,
        "Brand":brand,
};
}
