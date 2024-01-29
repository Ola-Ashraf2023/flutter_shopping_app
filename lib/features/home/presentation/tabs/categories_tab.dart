import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/app_colors.dart';

class CategoriesTab extends StatelessWidget {
  @override
  int selectedIdx = 1;

  Widget build(BuildContext context) {
    return Row(
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
                      color: Color(0x4d004182) //#0041824D
                      ),
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15.r),
                                      topRight: Radius.circular(15.r)),
                                  color: selectedIdx == index
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(14.5.r),
                                  child: Text("category name",
                                      style: TextStyle(
                                          color: AppColors.textColor)),
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
                    child: Image.network(
                        "https://img.freepik.com/free-photo/cute-domestic-kitten-sits-window-staring-outside-generative-ai_188544-12519.jpg"),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(15).r,
                            child: Image.network(
                                "https://mariebrownfineart.com/wp-content/uploads/2022/04/Green-eyed-cat-100x100.jpg"),
                          )),
                          Text("Subcategory",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.textColor))
                        ],
                      );
                    },
                  ))
            ],
          ),
        )
      ],
    );
  }
}
