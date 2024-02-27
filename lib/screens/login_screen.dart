// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password1_screen.dart';
import 'package:heritagekunja_app/screens/signup_screen.dart';
import 'package:heritagekunja_app/utils/colors.dart';
import 'package:heritagekunja_app/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
  }

  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  void navigateToChangePassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChangePasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HKWhite,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                'assets/logo_with_title.svg',
                height: 65.29,
                width: 303,
              ),
              const SizedBox(
                height: 51.71,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 212, 20),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        color: midGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              GestureDetector(
                onTap: navigateToChangePassword,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(210, 20, 0, 20),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: loginUser,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: HKWhite,
                          ),
                        )
                      : const Text(
                          'Sign in',
                          style: TextStyle(
                            color: HKWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  width: double.infinity,
                  height: 56,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    color: accentColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'or',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 400,
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    height: 32,
                    width: 32,
                  ),
                  label: Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: midGreyColor,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  backgroundColor: HKWhite,
                  foregroundColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Not registered? ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: midGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToSignup,
                    child: Container(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: accentColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 36.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
