import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/api/api_manager.dart';
import 'package:shopping_app/features/signup/presentation/bloc/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            appBar: AppBar(
              title: Text("SignUp"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                SignUpBloc.get(context).add(RegisterEvent());
              },
            ),
          );
        },
      ),
    );
  }
}
