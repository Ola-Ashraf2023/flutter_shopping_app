import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/features/home/presentation/widgets/product_card.dart';

class CategoriesTab extends StatelessWidget {
  @override
  int selectedIdx = 1;
  int categorySelect = 0;

  Widget build(BuildContext context) {
    return categorySelect == 0
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
                      color: AppColors.borderColor //#0041824D
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
                  padding: EdgeInsets
                      .all(8.0)
                      .r,
                  child: ClipRRect(
                    borderRadius: BorderRadius
                        .circular(15)
                        .r,
                    child: Image.network(
                        "https://img.freepik.com/free-photo/cute-domestic-kitten-sits-window-staring-outside-generative-ai_188544-12519.jpg"),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius
                                    .circular(15)
                                    .r,
                                child: Image.network(
                                    "https://mariebrownfineart.com/wp-content/uploads/2022/04/Green-eyed-cat-100x100.jpg"),
                              )),
                          Text("Subcategory",
                              style: Theme
                                  .of(context)
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
    )
        : Column(
      children: [
        Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 12,
              itemBuilder: (context, index) {
                return ProductCard(
                    pname: "Product Name",
                    price: 200,
                    imageLink: "https://cdn-thumbs.ohmyprints.net/1/1caa356fb6ee107087da8e057c04e550/817x600/thumbnail/fit.jpg",
                    rating: 3.5);
              },
            ))
      ],
    );
  }
}
