import 'package:dio/dio.dart';
import 'package:productapp/model/category_model.dart';

class GetCategoryServices {
  final Dio _dio = Dio();

  Future<List<Datum>> fetchcategoryServices() async {
    final url = 'https://suncity.warmonks.com/api/category';

    try {
      final response = await _dio.get(
        url,
      );

      if (response.statusCode == 200) {
        final BranchesModel = GetCategoryModel.fromJson(response.data);
        return BranchesModel.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
