import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/api/api_manager.dart';

import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            appBar: AppBar(
              title: Text("Login"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                LoginBloc.get(context).add(SignInEvent());
              },
            ),
          );
        },
      ),
    );
  }
}
