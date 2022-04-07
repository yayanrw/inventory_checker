import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_input_decoration_theme.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';
import 'package:inventory_checker/core/utils/request_state.dart';
import 'package:inventory_checker/core/widgets/button/my_button.dart';
import 'package:inventory_checker/features/login/presentation/provider/login_notifier.dart';
import 'package:inventory_checker/features/login/presentation/widgets/dont_have_account.dart';
import 'package:inventory_checker/features/login/presentation/widgets/forgot_password.dart';
import 'package:inventory_checker/features/login/presentation/widgets/login_text.dart';
import 'package:inventory_checker/features/login/presentation/widgets/login_with_google_button.dart';
import 'package:inventory_checker/features/login/presentation/widgets/or_text.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  final _email = TextEditingController();
  final _password = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  loginText(),
                  Consumer<LoginNotifier>(builder: (context, value, child) {
                    if (value.loginState == RequestState.loading) {
                      EasyLoading.show(status: 'Logging in...');
                    } else if (value.loginState == RequestState.loaded) {
                      EasyLoading.dismiss();
                      if (value.login.status) {
                      } else {
                        EasyLoading.showError(value.login.message);
                      }
                    } else {
                      EasyLoading.dismiss();
                    }
                    return const SizedBox();
                  }),
                  const SizedBox(
                    height: 48,
                  ),
                  emailTextFormField(),
                  const SizedBox(
                    height: 32,
                  ),
                  passwordTextFormField(),
                  const SizedBox(
                    height: 8,
                  ),
                  forgotPassword(context),
                  const SizedBox(
                    height: 32,
                  ),
                  loginButton(context),
                  const SizedBox(
                    height: 24,
                  ),
                  orText(),
                  const SizedBox(
                    height: 24,
                  ),
                  loginWithGoogleButton(context),
                  const SizedBox(
                    height: 50,
                  ),
                  dontHaveAccount(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return MyButton(
      buttonColor: MyColors.primary,
      textValue: MyStrings.login,
      textColor: Colors.white,
      onPressed: () => _authenticate(),
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      controller: _email,
      // validator: (value) {
      //   return Validations.isEmpty(value!)
      //       ? Strings.fieldRequired
      //       : Validations.isValidEmail(value)
      //           ? null
      //           : Strings.invalidEmail;
      // },
      keyboardType: TextInputType.emailAddress,
      cursorColor: MyColors.primary,
      decoration: emailInputDecoration(),
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      controller: _password,
      // validator: (value) {
      //   return Validations.isEmpty(value!)
      //       ? Strings.fieldRequired
      //       : Validations.isLengthGreaterThan(value, 6)
      //           ? null
      //           : Strings.fieldTooShort;
      // },
      cursorColor: MyColors.primary,
      obscureText: !_passwordVisible,
      decoration:
          passwordInputDecoration(_passwordVisible, _togglePasswordVisibility),
    );
  }

  Future<void> _authenticate() async {
    if (_formKey.currentState!.validate()) {
      await Provider.of<LoginNotifier>(context, listen: false)
          .fetchLogin(_email.text, _password.text);
    }
  }

  @override
  void dispose() {
    _formKey.currentState!.dispose();
    _email.dispose();
    _password.dispose();
    _passwordVisible = false;
    super.dispose();
  }
}
