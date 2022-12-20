import 'package:dio_example/view_models/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        title: const Text("Category Screen"),
      ),
      body: Consumer<CategoryViewModel>(builder: (context,viewModel,child){
        if(viewModel.categoryModel==null){
          return const Center(child: CircularProgressIndicator(),);
        }
        return SizedBox(
          width: double.infinity,
          height:double.infinity ,

          child:  ListView(
            children: List.generate(viewModel.categoryModel!.length, (index) {
              var item = viewModel.categoryModel![index];
              return Card(
                color: Colors.lightGreen,
                child: ListTile(
                  title: Text(item.name,style:const TextStyle(color: Colors.white),),
                  subtitle: Text(item.id.toString(),style:const TextStyle(color: Colors.white),),
                  trailing:
                  Container(
                    width: 80,
                    height: 80,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: NetworkImage(item.imageUrl),fit: BoxFit.cover)
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
