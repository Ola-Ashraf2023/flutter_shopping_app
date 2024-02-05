import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_images.dart';

import '../bloc/home_bloc.dart';

class HomeTab extends StatelessWidget {
  @override
  List<String> carouselImages = [
    baseImage + AppImages.splashImage1,
    baseImage + AppImages.splashImage2,
    baseImage + AppImages.splashImage3,
  ];

  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.screenStatus == ScreenStatus.failure) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Center(child: Text("An Error Occurred")),
                  ));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 200.0, autoPlay: true, viewportFraction: 1),
                items: carouselImages.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(i),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w500)),
                    Text(
                      "View all",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.mainColor),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 288.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: state.categories?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: NetworkImage(state
                                              .categories?[index].image ??
                                          "https://via.placeholder.com/398x200"),
                                      fit: BoxFit.fill,
                                    ))),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              state.categories?[index].name ?? "No Category",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.mainColor),
                            ),
                          )
                        ],
                      );
                    },
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Home Appliances",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Container(
                  height: 211.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                              height: 122.h,
                              width: 158.h,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10).r,
                                  child: Image(
                                      image: NetworkImage(
                                          "https://hips.hearstapps.com/hmg-prod/images/cat-captions-for-instagram-6595a058e956b.jpeg?crop=0.588xw:1.00xh;0.207xw,0&resize=100:*")))),
                          Text(
                            "Cat Pictures",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.mainColor),
                          )
                        ],
                      );
                    },
                  )),
            ],
          ),
        );
      },
    );
  }
}
