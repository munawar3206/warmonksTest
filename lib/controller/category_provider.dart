import 'package:flutter/material.dart';
import 'package:productapp/model/category_model.dart';
import 'package:productapp/service/getcategory.dart';

class CategoryProvider extends ChangeNotifier{
   GetCategoryServices getCategoryServices =
      GetCategoryServices();
  List<Datum> categoryList = [];

  Future<void> fetchcategory()async{
   categoryList=await getCategoryServices.fetchcategoryServices();
   notifyListeners();
  }


}