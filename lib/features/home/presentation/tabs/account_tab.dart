import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class AccountTab extends StatelessWidget {
  String name = "koko";
  String email = "koko@gmail.com";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Welcome $name",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.textColor),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "$email",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.textColor),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text("Your full name",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff06004F),
                        )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.textColor,
                          ),
                          onPressed: () {},
                        ),
                        hintText: "your name",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text("Your E-mail",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff06004F),
                        )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.textColor,
                          ),
                          onPressed: () {},
                        ),
                        hintText: "your email",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text("Your Password",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff06004F),
                        )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.textColor,
                          ),
                          onPressed: () {},
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text("Your Phone Number",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff06004F),
                        )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.textColor,
                          ),
                          onPressed: () {},
                        ),
                        hintText: "your phone number",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
