import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/app_colors.dart';

class ProductDetails extends StatelessWidget {
  String title;
  double price;
  int amountSold;
  String description;
  double rating;
  List<String> imageList;
  int ratingQuantity;

  ProductDetails({required this.title,
    required this.price,
    required this.amountSold,
    required this.description,
    required this.rating,
    required this.imageList,
    required this.ratingQuantity});

  @override
  int quantity = 1;
  double totalPrice = 200;
  bool addToFav = false;

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
          CarouselSlider(
            options: CarouselOptions(
                height: 300.0, autoPlay: true, viewportFraction: 1),
            items: imageList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r)),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.r)),
                            child: Image.network(
                              i,
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: IconButton(
                            icon: addToFav == false
                                ? Icon(Icons.favorite_border_rounded)
                                : Icon(Icons.favorite),
                            color: AppColors.mainColor,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("$price EGP",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.textColor))
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.borderColor)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Text("$amountSold sold",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textColor)),
                    ),
                  ),
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
                      Text("($ratingQuantity)",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textColor)),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.mainColor
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: () {},
                            icon: Icon(Icons.add, color: Colors.white,)),
                        Text("$quantity"),
                        IconButton(onPressed: () {},
                            icon: Icon(Icons.remove, color: Colors.white,)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Row(
                children: [
                  Text("Description",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.textColor)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Row(
                children: [
                  Expanded(
                      child: Text("$description",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.borderColor)))
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
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
                      Icon(Icons.shopping_cart, color: Colors.white,),
                      Text("Add To Cart"),
                    ],),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
