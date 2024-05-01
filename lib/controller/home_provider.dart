import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:productapp/model/BrandModel.dart';
import 'package:productapp/model/category_model.dart';
import 'package:productapp/model/productmodel.dart';
import 'package:productapp/service/getcategory.dart';
import 'package:productapp/service/postbrand_service.dart';
import 'package:productapp/service/postprdt.dart';

class CategoryProvider extends ChangeNotifier {
  TextEditingController categoryController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController brandController = TextEditingController();

  CategoryProvider() {
    fetchcategory();
  }
// category fetch
  GetCategoryServices getCategoryServices = GetCategoryServices();
  List<Datum> categoryList = [];
  int? selectedCategoryId;

  Future<void> fetchcategory() async {
    try {
      categoryList = await getCategoryServices.fetchcategoryServices();
      notifyListeners();
    } catch (e) {
      log('Failed to fetch categories: $e');
    }
  }
// product fetch
  ProductServices productServices = ProductServices();
  List<Product> productList = [];

  Future<void> fetchProducts(int categoryId) async {
    try {
      productList = (await productServices.ProductsByCategoryId(categoryId))!;
      notifyListeners();
    } catch (e) {
      log('Failed to fetch products: $e');
    }
  }
// brand fetch
  BrandServices brandServices = BrandServices();
  List<Brand> BrandList = [];

  Future<void> fetchBrand(int productId) async {
    try {
      BrandList = (await brandServices.ProductsByproductId(productId))!;
      notifyListeners();
    } catch (e) {
      log('Failed to fetch brand: $e');
    }
  }
}
