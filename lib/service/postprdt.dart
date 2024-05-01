import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:productapp/model/productmodel.dart';

class ProductService {
  final Dio dio = Dio();
  final String baseUrl = "https://suncity.warmonks.com/api/prdtcat";

  Future<ProductModel> getProductsByCategoryId(int categoryId) async {
    try {
      String apiUrl = baseUrl + "?id=$categoryId"; // Adjusted URL for GET request

      Response response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        log('Success! Response: ${response.data}');
        return ProductModel.fromJson(response.data);
      } else {
        log('Failure! Response: ${response.statusCode}, ${response.statusMessage}, ${response.data}');
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      log("Error: $e");
      throw Exception('Failed to fetch products');
    }
  }

  Future<String> postProduct(int id) async {
    try {
      String apiUrl = baseUrl; // Adjusted URL for POST request

      // Assuming 'id' is sent as JSON data in the request body
      Response response = await dio.post(apiUrl, data: {'id': id});

      if (response.statusCode == 200) {
        log('Success! Response: ${response.data}');
        return 'Success!';
      } else {
        log('Failure! Response: ${response.statusCode}, ${response.statusMessage}, ${response.data}');
        return 'Failure! ${response.statusCode}, ${response.statusMessage}, ${response.data}';
      }
    } catch (e) {
      log("Error: $e");
      return 'Unknown error occurred';
    }
  }
}
