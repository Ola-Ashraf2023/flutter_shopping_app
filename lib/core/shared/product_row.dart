import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/app_colors.dart';

class ProductRow extends StatelessWidget {
  String name, link;
  int price;

  ProductRow({required this.name,
    required this.link,
    required this.price,});

  @override
  bool fav = false;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.r),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.borderColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(link, fit: BoxFit.fill, height: 120.h),
              ),
            ],
          ),
          Expanded(
            child:
            Padding(
              padding: EdgeInsets.only(left: 8.0.r),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textColor)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(fav == false ?
                          Icons.favorite_border_rounded : Icons.favorite,
                            color: AppColors.mainColor,
                          ))
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$price",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textColor)),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Add to cart",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
