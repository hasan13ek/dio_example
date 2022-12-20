import 'package:dio_example/data/api_service/api_service.dart';
import 'package:dio_example/data/models/product_model.dart';
import 'package:dio_example/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier{
  ProductViewModel({required ProductRepo productRepo}){
    _productRepo = productRepo;
    fetchAllProducts();
  }
  late  ProductRepo _productRepo;


  bool isLoading = false;

  ProductModel? productModel;

  fetchAllProducts() async{
    notify(true);
    productModel = await _productRepo.getAllProducts();
    notify(false);
  }

  notify(bool v){
    isLoading = v;
    notifyListeners();
  }
}