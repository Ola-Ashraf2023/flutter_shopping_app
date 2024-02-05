import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  String pname;
  int price;
  String imageLink;
  double rating;

  ProductCard(
      {required this.pname, required this.price, required this.imageLink, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.r),
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Color(0x4d004182))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(imageLink, fit: BoxFit.fill),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                      pname,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.textColor),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Text("$price",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textColor))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("$rating",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textColor)),
                    Icon(
                      Icons.star,
                      color: AppColors.starColor,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Icon(
                          Icons.add,
                          size: 20.r,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor),
                        // Set the icon color
                        onPressed: () {
                          // Add your button press logic here
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
