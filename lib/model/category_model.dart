

class GetCategoryModel {
    bool success;
    String message;
    List<Datum> data;

    GetCategoryModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory GetCategoryModel.fromJson(Map<String, dynamic> json) => GetCategoryModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String catgName;
    String active;

    Datum({
        required this.id,
        required this.catgName,
        required this.active,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        catgName: json["catg_name"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "catg_name": catgName,
        "active": active,
    };
}
