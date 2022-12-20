import 'package:dio_example/ui/product_page.dart';
import 'package:dio_example/ui/tab_box/category_page.dart';
import 'package:dio_example/view_models/tab_view_model.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(ProductPage());
    screens.add(CategoryPage());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var index = context.watch<TabViewModel>().activePageIndex;
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.lightGreen,
        selectedBackgroundColor: Colors.lightGreenAccent.withOpacity(0.4),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        borderRadius: 15,
        onTap: (value) => Provider.of<TabViewModel>(context, listen: false)
            .changePageIndex(value),
        items: [
          FloatingNavbarItem(
              customWidget: Icon(
                Icons.home,
                color: index == 0 ? Colors.white : Colors.black,
              ),
              title: 'Product'),
          FloatingNavbarItem(
              customWidget: Icon(
                Icons.home,
                color: index == 1 ? Colors.white : Colors.black,
              ),
              title: 'Category'),
        ],
        currentIndex: index,
      ),

    );
  }
}
