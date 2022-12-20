import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_example/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        title: const Text("ProductPage"),
      ),
      body:  Consumer<ProductViewModel>(builder: (context,viewModel,child){
        if(viewModel.productModel==null){
          return const Center(child: CircularProgressIndicator());
        }
        return
          SizedBox(
            width: double.infinity,
            height:double.infinity ,

            child:  ListView(
              children: List.generate(viewModel.productModel!.data.length, (index) {
                var item = viewModel.productModel!.data[index];
                return Card(
                  color: Colors.lightGreen,
                  child: ListTile(
                    title: Text(item.name,style:const TextStyle(color: Colors.white),),
                    subtitle: Text(item.price.toString(),style:const TextStyle(color: Colors.white),),
                    trailing: Container(
                      width: 80,
                      height: 80,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(image: NetworkImage(item.imageUrl),fit: BoxFit.cover)
                      ),
                    ),
                    // SizedBox(
                    //   width: 80,
                    //   height: 80,
                    //   child: ClipRRect(
                    //     borderRadius: const BorderRadius.only(
                    //         topLeft: Radius.circular(16),
                    //         bottomLeft: Radius.circular(16),
                    //       bottomRight: Radius.circular(16),
                    //       topRight: Radius.circular(16),
                    //     ),
                    //     child: CachedNetworkImage(
                    //       imageUrl: item.imageUrl.toString(),
                    //       fit: BoxFit.cover,
                    //       placeholder: (context, url) {
                    //         return Shimmer.fromColors(
                    //           period: const Duration(seconds: 1),
                    //           baseColor: Colors.grey.shade300,
                    //           highlightColor: Colors.grey.shade100,
                    //           child: Container(
                    //             width: 80,
                    //             height: 80,
                    //             color: Colors.white,
                    //           ),
                    //         );
                    //       },
                    //       errorWidget: (context, url, error) => const Icon(Icons.error),
                    //     ),
                    //   ),
                    // ),
                  ),
                );
              }),
            ),
          );

      }
      ),
    );
  }
}
