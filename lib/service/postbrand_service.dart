import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:productapp/model/BrandModel.dart';

class BrandServices {
  final Dio dio = Dio();
  Future<List<Brand>?> ProductsByproductId(int productId) async {
    try {
      String apiUrl = "https://suncity.warmonks.com/api/brdcat?id=$productId";
      Response response = await dio.post(
        apiUrl,
      );
      if (response.statusCode == 200) {
        log('Success! Response: ${response.data}');
        final brandModel = BrandModel.fromJson(response.data);
        return brandModel.data;
      } else {
        log('Failure! Response: ${response.statusCode}, ${response.statusMessage}, ${response.data}');
        throw Exception('Failed to fetch Brand');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
    }
  }
}
