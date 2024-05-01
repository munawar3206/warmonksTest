
class ProductModel {
    bool success;
    String message;
    List<Products> data;

    ProductModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        message: json["message"],
        data: List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Products {
    int id;
    String name;
    String category;
    String brand;

    Products({
        required this.id,
        required this.name,
        required this.category,
        required this.brand,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["Name"],
        category: json["category"]!,
        brand: json["Brand"]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "category":category,
        "Brand": brand,
    };
}

