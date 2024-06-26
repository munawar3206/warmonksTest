import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:productapp/model/productmodel.dart';

class ProductServices {
  final Dio dio = Dio();
  Future<List<Product>?> ProductsByCategoryId(int categoryId) async {
    try {
      String apiUrl = "https://suncity.warmonks.com/api/prdtcat?id=$categoryId";
      Response response = await dio.post(
        apiUrl,
      );
      if (response.statusCode == 200) {
        log('Success! Response: ${response.data}');
        final prosuctModel = ProductModel.fromJson(response.data);
        return prosuctModel.data;
      } else {
        log('Failure! Response: ${response.statusCode}, ${response.statusMessage}, ${response.data}');
        throw Exception('Failed to fetch products');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
    }
  }
}
