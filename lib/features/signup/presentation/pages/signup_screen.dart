import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/api/api_manager.dart';
import 'package:shopping_app/features/signup/presentation/bloc/sign_up_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(ApiManager()),
      child: BlocConsumer<SignUpBloc, SignUpState>(
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
                      title: Center(child: Text("Registered successfully")),
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
                          padding: EdgeInsets.only(top: 60.h, bottom: 50.h),
                          child: Text(
                            "Sign up",
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
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  hintText: "Enter your name",
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          SizedBox(height: 20.h),
                          Text(
                            "Mobile Number",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextFormField(
                              controller: mobileController,
                              decoration: InputDecoration(
                                  hintText: "Enter your phone number",
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
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
                                  SignUpBloc.get(context).add(RegisterEvent());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 12)
                                      .r,
                                  child: Text("Sign Up",
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
