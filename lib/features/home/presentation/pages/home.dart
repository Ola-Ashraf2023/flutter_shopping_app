import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_images.dart';
import 'package:shopping_app/core/utils/app_strings.dart';
import 'package:shopping_app/features/home/presentation/pages/product_details.dart';
import 'package:shopping_app/features/home/presentation/tabs/account_tab.dart';
import 'package:shopping_app/features/home/presentation/tabs/categories_tab.dart';
import 'package:shopping_app/features/home/presentation/tabs/home_tab.dart';

import '../../../../core/api/api_manager.dart';
import '../bloc/home_bloc.dart';
import '../tabs/fav_tab.dart';

class HomeScreen extends StatelessWidget {
  bool selectedProduct = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            (ApiManager()),
          )
            ..add(GetCategoryEvent())
            ..add(GetBrandEvent()),
        ),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state.screenStatus == ScreenStatus.loading) {
        } else if (state.screenStatus == ScreenStatus.failure) {
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    title: Center(child: Text("An Error Occurred")),
                  ));
        } else if (state.screenStatus == ScreenStatus.success) {}
      }, builder: (context, state) {
        return HomeBloc.get(context).selectedProduct == false
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leadingWidth: 100.w,
                  leading: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: SvgPicture.asset(baseImage + AppImages.logoImage),
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  backgroundColor: AppColors.mainColor,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.blue,
                  currentIndex: HomeBloc.get(context).idx,
                  onTap: (value) {
                    HomeBloc.get(context).add(ChangeNavbarEvent(value));
                  },
                  items: const [
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
                      visible: HomeBloc.get(context).idx != 3,
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0).w,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: AppStrings.searchHint,
                                  prefixIcon: const Icon(
                                    Icons.search,
                                  ),
                                  prefixIconColor: AppColors.mainColor,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.mainColor),
                                      borderRadius:
                                          BorderRadius.circular(35).w)),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0).w,
                            child: const Icon(
                              Icons.shopping_cart,
                              color: AppColors.mainColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(child: tabs[HomeBloc.get(context).idx])
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
          imageList: const [
                  "https://upload.wikimedia.org/wikipedia/commons/0/01/Cat-1044750.jpg",
                  "https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg",
                  "https://wallpapers.com/images/featured/cat-g9rdx9uk2425fip2.jpg",
                ],
              );
      }),
    );
  }
}

List<Widget> tabs = [HomeTab(), CategoriesTab(), FavTab(), AccountTab()];
