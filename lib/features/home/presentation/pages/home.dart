import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_images.dart';
import 'package:shopping_app/core/utils/app_strings.dart';
import 'package:shopping_app/features/home/presentation/pages/product_details.dart';
import 'package:shopping_app/features/home/presentation/tabs/account_tab.dart';
import 'package:shopping_app/features/home/presentation/tabs/categories_tab.dart';
import 'package:shopping_app/features/home/presentation/tabs/home_tab.dart';

import '../tabs/fav_tab.dart';

class HomeScreen extends StatelessWidget {
  int homeIdx = 2;
  bool selectedProduct = true;

  @override
  Widget build(BuildContext context) {
    return selectedProduct == false
        ? Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 100.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(baseImage + AppImages.logoImage),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: AppColors.mainColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue,
        currentIndex: homeIdx,
        onTap: (value) {
          homeIdx = value;
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "",
              backgroundColor: AppColors.mainColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: "",
              backgroundColor: AppColors.mainColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: "",
              backgroundColor: AppColors.mainColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
              backgroundColor: AppColors.mainColor),
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: homeIdx != 3,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).w,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: AppStrings.searchHint,
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            prefixIconColor: AppColors.mainColor,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius
                                    .circular(35)
                                    .w)),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: Icon(
                    Icons.shopping_cart,
                    color: AppColors.mainColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(child: tabs[homeIdx])
        ],
      ),
    )
        : ProductDetails(
      title: "White Cat",
      rating: 5,
      price: 200,
      amountSold: 2,
      description: "Best Friend Ever",
      ratingQuantity: 10,
      imageList: [
        "https://upload.wikimedia.org/wikipedia/commons/0/01/Cat-1044750.jpg",
        "https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg",
        "https://wallpapers.com/images/featured/cat-g9rdx9uk2425fip2.jpg",
      ],
    );
  }
}

List<Widget> tabs = [HomeTab(), CategoriesTab(), FavTab(), AccountTab()];
