import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tileswale/repo/auth_repo.dart';
import 'package:tileswale/styles/styles.dart';

import 'auth_screen.dart';

class Register extends ConsumerWidget {
  Register({Key? key}) : super(key: key);

  final form = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const padding = EdgeInsets.only(
      top: 20.0,
      bottom: 20.0,
      left: 25.0,
      right: 25.0,
    );

    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Form(
                  key: form,
                  child: SizedBox(
                    width: 300.0,
                    height: 360.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: padding,
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            validator: ValidationBuilder().required().build(),
                            textCapitalization: TextCapitalization.words,
                            autocorrect: false,
                            style: loginStyle,
                            decoration: loginDecoration(
                              Icons.person,
                              'Name',
                            ),
                          ),
                        ),
                        const CustomDivider(),
                        Padding(
                          padding: padding,
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: ValidationBuilder().email().build(),
                            autocorrect: false,
                            style: loginStyle,
                            decoration: loginDecoration(
                              Icons.email,
                              'Email Address',
                            ),
                          ),
                        ),
                        const CustomDivider(),
                        Padding(
                          padding: padding,
                          child: TextFormField(
                            controller: passwordController,
                            validator: ValidationBuilder().required().build(),
                            obscureText: true,
                            autocorrect: false,
                            style: loginStyle,
                            decoration: loginDecoration(
                              Icons.lock,
                              'Password',
                            ),
                          ),
                        ),
                        const CustomDivider(),
                        Padding(
                          padding: padding,
                          child: TextFormField(
                            controller: confirmPasswordController,
                            validator: ValidationBuilder().required().build(),
                            obscureText: true,
                            autocorrect: false,
                            style: loginStyle,
                            decoration: loginDecoration(
                              Icons.lock,
                              'Confirmation',
                            ),
                            textInputAction: TextInputAction.go,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AuthButton(
                title: 'SIGN UP',
                onPressed: () {
                  ref.read(authProvider).register({
                    'name': nameController.text,
                    'email': emailController.text,
                    'password': passwordController.text,
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
