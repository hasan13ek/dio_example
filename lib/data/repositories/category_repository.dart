import 'package:dio_example/data/api_service/api_service.dart';
import 'package:dio_example/data/models/category_model.dart';

class CategoryRepo {
  CategoryRepo({required ApiService apiService}): _apiService = apiService;
  final ApiService _apiService;

  Future<List<CategoryModel>?> getAllCategories()=>_apiService.getAllCategories();
}