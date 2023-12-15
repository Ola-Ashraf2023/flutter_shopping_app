import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/api/api_manager.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_strings.dart';

import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(ApiManager()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.Loading) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(child: CircularProgressIndicator()),
                ));
          } else if (state.screenStatus == ScreenStatus.Success) {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(child: Text("Signed In successfully")),
                ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.mainColor,
            body: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 100.h, bottom: 100.h),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.r, right: 20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.welcome,
                              style: Theme.of(context).textTheme.bodyLarge),
                          Text(AppStrings.signInText,
                              style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(height: 20.h),
                          Text(
                            "Email",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: "Enter your Email",
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          SizedBox(height: 20.h),
                          Text(
                            "Password",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Enter your password",
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          SizedBox(
                            height: 75.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  LoginBloc.get(context).add(SignInEvent());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 12)
                                      .r,
                                  child: Text("Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: AppColors.mainColor,
                                              fontSize: 30)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Text(AppStrings.createAccount,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
