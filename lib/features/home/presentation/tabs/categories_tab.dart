import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/features/home/presentation/widgets/product_card.dart';

import '../bloc/home_bloc.dart';

class CategoriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.screenStatus == ScreenStatus.loading) {}
      },
      builder: (context, state) {
        return HomeBloc.get(context).selected == false
            ? Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: AppColors.borderColor),
                            child: ListView.builder(
                              itemCount: state.categories?.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          HomeBloc.get(context).add(
                                              ChangeCategoryEvent(index,
                                                  state.categories?[index].id));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(15.r),
                                                topRight:
                                                    Radius.circular(15.r)),
                                            color:
                                                HomeBloc.get(context).catIdx ==
                                                        index
                                                    ? Colors.white
                                                    : Colors.transparent,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(14.5.r),
                                            child: Text(
                                                state.categories?[index].name ??
                                                    "Error",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.textColor)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0).r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15).r,
                              child: CachedNetworkImage(
                                imageUrl: state
                                        .categories?[
                                            HomeBloc.get(context).catIdx]
                                        .image ??
                                    "",
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: state.subcategories?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    HomeBloc.get(context).add(
                                        SelectSubcategoryEvent(
                                            true,
                                            state
                                                    .categories?[
                                                        HomeBloc.get(context)
                                                            .catIdx]
                                                    .id ??
                                                "",
                                            state.subcategories?[index].id ??
                                                ""));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: AppColors.mainColor),
                                    padding: EdgeInsets.all(10.r),
                                    margin: EdgeInsets.all(3.r),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                                state.subcategories?[index]
                                                        .name ??
                                                    "",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                    )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ))
                      ],
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (191.w / 237.h), crossAxisCount: 2),
                    itemCount: state.products?.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          pname: state.products?[index].title ?? "Error",
                          price: state.products?[index].price ?? 0,
                          imageLink: state.products?[index].images?[0] ?? "",
                          rating: state.products?[index].ratingsAverage ?? 0);
                    },
                  ))
                ],
              );
      },
    );
  }
}
