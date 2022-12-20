import 'package:dio/dio.dart';
import 'package:dio_example/data/api_service/api_client.dart';
import 'package:dio_example/data/models/category_model.dart';
import 'package:dio_example/data/models/product_model.dart';

class ApiService extends ApiClient{

  // Future<ProductModel?>  getAllProducts() async{
  //   Dio dio = Dio();
  //   try{
  //   Response response = await  dio.get("https://third-exam.free.mockoapp.net/products");
  //   if(response.statusCode==200){
  //     return  ProductModel.fromJson(response.data);
  //   }
  //   } catch(e){
  //     throw Exception(e);
  //   }
  // }

  Future<ProductModel?>  getAllProducts() async{
    try{
      Response response = await  dio.get("${dio.options.baseUrl}/products");
      if(response.statusCode==200){
        return  ProductModel.fromJson(response.data);
      }
    } catch(e){
      throw Exception(e);
    }
  }

  // Future<List<CategoryModel>?>  getAllCategories() async{
  //   Dio dio = Dio();
  //   try{
  //     Response response = await  dio.get("https://third-exam.free.mockoapp.net/categories");
  //     if(response.statusCode==200){
  //       return  (response.data as List?)?.map((e) => CategoryModel.fromJson(e)).toList()??[];
  //     }
  //   } catch(e){
  //     throw Exception(e);
  //   }
  // }

  Future<List<CategoryModel>?>  getAllCategories() async{
    try{
      Response response = await  dio.get("${dio.options.baseUrl}/categories");
      if(response.statusCode==200){
        return  (response.data as List?)?.map((e) => CategoryModel.fromJson(e)).toList()??[];
      }
    } catch(e){
      throw Exception(e);
    }
  }

}