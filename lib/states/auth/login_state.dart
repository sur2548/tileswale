import 'package:flutter/material.dart';
import 'package:tileswale/states/state.dart';
import 'package:tileswale/routes/routes.dart';

class LoginState extends ViewModel {
  late BuildContext context;

  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void init(BuildContext context) {
    this.context = context;
  }

  void login() {
    FocusScope.of(context).unfocus();
    if (!form.currentState!.validate()) return;

    final user = pref.getUser();

    if (user == null) return;

    if (user.email != emailController.text &&
        user.password != passwordController.text) {
      return;
    }

    context.router.replace(const MainScreenRoute());
  }
}
