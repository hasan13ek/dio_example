import 'package:dio_example/data/api_service/api_service.dart';
import 'package:dio_example/data/repositories/category_repository.dart';
import 'package:dio_example/data/repositories/product_repository.dart';
import 'package:dio_example/ui/product_page.dart';
import 'package:dio_example/ui/tab_box/main_page.dart';
import 'package:dio_example/view_models/category_view_model.dart';
import 'package:dio_example/view_models/product_view_model.dart';
import 'package:dio_example/view_models/tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(
            productRepo: ProductRepo(
              apiService: ApiService(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (context) => TabViewModel()),
        ChangeNotifierProvider(create: (context)=>CategoryViewModel(categoryRepo: CategoryRepo(apiService: ApiService())))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBox(),
    );
  }
}
