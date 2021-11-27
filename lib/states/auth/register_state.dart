import 'package:flutter/material.dart';
import 'package:tileswale/models/modesl.dart';
import 'package:tileswale/states/state.dart';
import 'package:tileswale/routes/routes.dart';

class RegisterState extends ViewModel {
  late BuildContext context;

  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void init(BuildContext context) {
    this.context = context;
  }

  void register() {
    FocusScope.of(context).unfocus();
    if (!form.currentState!.validate()) return;

    final data = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };

    final user = User.fromJson(data);
    pref.setUser(user);

    context.router.replace(const MainScreenRoute());
  }
}
