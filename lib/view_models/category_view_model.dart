import 'package:dio_example/data/models/category_model.dart';
import 'package:dio_example/data/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier{
   CategoryViewModel ({required CategoryRepo categoryRepo}){
     _categoryRepo = categoryRepo;
     fetchAllCategories();
   }
  late CategoryRepo _categoryRepo;

   bool isLoading = false;

   List<CategoryModel>? categoryModel;

   fetchAllCategories() async {
     notify(true);
     categoryModel = await _categoryRepo.getAllCategories();
     notify(false);
   }

   notify(bool v){
     isLoading = v;
     notifyListeners();
   }
}