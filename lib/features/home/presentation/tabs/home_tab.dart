import 'package:cached_network_image/cached_network_image.dart';
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
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          state.categories?[index].image ?? "",
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Brands",
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
                  height: 200.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(10).r,
                                  height: 122.h,
                                  width: 158.h,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10).r,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            state.brands?[index].image ?? "",
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      )))),
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
