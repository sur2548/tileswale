import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tileswale/base/base.dart';
import 'package:tileswale/get.dart';
import 'package:tileswale/screens/screens.dart';
import 'package:tileswale/services/services.dart';
import 'package:tileswale/states/states.dart';
import 'package:tileswale/styles/custom_colors.dart';
import 'package:tileswale/styles/styles.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final pref = locate<PreferenceService>();

  late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    if (pref.isLoggedIn) return const MainScreen();

    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  CColors.loginGradientStart,
                  CColors.loginGradientEnd
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: <double>[0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 75.0),
                child: Image(
                    height: 100,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/auth.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const Login(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: Register(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: _onSignInButtonPress,
              child: Text(
                'Existing',
                style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                    fontFamily: 'WorkSansSemiBold'),
              ),
            ),
          ),
          //Container(height: 33.0, width: 1.0, color: Colors.white),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: _onSignUpButtonPress,
              child: Text(
                'New',
                style: TextStyle(
                    color: right,
                    fontSize: 16.0,
                    fontFamily: 'WorkSansSemiBold'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Content<LoginState>(
      onStateReady: (state) => state.init(context),
      create: (context, state, child) {
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
                      key: state.form,
                      child: SizedBox(
                        width: 300.0,
                        height: 190.0,
                        child: Column(
                          children: [
                            Padding(
                              padding: padding,
                              child: TextFormField(
                                controller: state.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: ValidationBuilder().email().build(),
                                style: loginStyle,
                                decoration: loginDecoration(
                                  Icons.email,
                                  'Email Address',
                                ),
                              ),
                            ),
                            Container(
                              width: 250.0,
                              height: 1.0,
                              color: Colors.grey[400],
                            ),
                            Padding(
                              padding: padding,
                              child: TextFormField(
                                controller: state.passwordController,
                                validator:
                                    ValidationBuilder().required().build(),
                                obscureText: true,
                                style: loginStyle,
                                decoration: loginDecoration(
                                  Icons.lock,
                                  'Password',
                                ),
                                textInputAction: TextInputAction.go,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 170.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: CColors.loginGradientStart,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                        BoxShadow(
                          color: CColors.loginGradientEnd,
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                      ],
                      gradient: LinearGradient(
                          colors: <Color>[
                            CColors.loginGradientEnd,
                            CColors.loginGradientStart
                          ],
                          begin: FractionalOffset(0.2, 0.2),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                      onPressed: state.login,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class Register extends ConsumerWidget {
  Register({Key? key}) : super(key: key);

  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _register(WidgetRef ref) {
    if (!form.currentState!.validate()) return;
  }

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
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
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
                onPressed: () => _register(ref),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 1.0,
      color: Colors.grey[400],
    );
  }
}

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AuthButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 340.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: CColors.loginGradientStart,
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
          ),
          BoxShadow(
            color: CColors.loginGradientEnd,
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
          ),
        ],
        gradient: LinearGradient(
            colors: <Color>[
              CColors.loginGradientEnd,
              CColors.loginGradientStart
            ],
            begin: FractionalOffset(0.2, 0.2),
            end: FractionalOffset(1.0, 1.0),
            stops: <double>[0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: CColors.loginGradientEnd,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 25.0),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
