import 'package:dio_example/data/api_service/api_service.dart';
import 'package:dio_example/data/models/product_model.dart';

class ProductRepo{
  ProductRepo({required ApiService apiService}):_apiService = apiService;
 final ApiService _apiService;

 Future<ProductModel?> getAllProducts()=>_apiService.getAllProducts();

}