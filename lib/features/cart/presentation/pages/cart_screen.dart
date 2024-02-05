import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/cart_row.dart';
import '../../../../core/shared/product_row.dart';
import '../../../../core/utils/app_colors.dart';

class CartScreen extends StatelessWidget {

  @override
  double totalPrice = 200;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Product Details",
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.textColor),
        ),
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: IconButton(
                  icon: Icon(Icons.search),
                  color: AppColors.mainColor,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: AppColors.mainColor,
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CartRow(
                    name: "product name",
                    link:
                    "https://cdn-thumbs.ohmyprints.net/1/1caa356fb6ee107087da8e057c04e550/817x600/thumbnail/fit.jpg",
                    price: 200,);
                },
              )),
          Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Total Price",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.borderColor)),
                    Text("$totalPrice EGP",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textColor)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.r, horizontal: 16.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.mainColor
                  ),
                  child: Row(children: [
                    Text("Check Out"),
                    Icon(Icons.arrow_forward, color: Colors.white,),
                  ],),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
