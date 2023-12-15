import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_images.dart';

class HomeScreen extends StatelessWidget {
  int homeIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
