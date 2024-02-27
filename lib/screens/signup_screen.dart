// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritagekunja_app/screens/add_details_screen.dart';
import 'package:heritagekunja_app/screens/login_screen.dart';
import 'package:heritagekunja_app/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:heritagekunja_app/utils/utils.dart';

import 'package:heritagekunja_app/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
  }

  void navigateToaddDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddDetailsScreen(),
      ),
    );
  }

  void navigateToSignin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HKWhite,
      resizeToAvoidBottomInset: false,
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
                height: 52,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 212, 0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32,
                        color: midGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: 'Full Name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Email Address',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: navigateToaddDetails,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: HKWhite,
                          ),
                        )
                      : const Text(
                          'Sign up',
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
                      "Already registered? ",
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
                    onTap: navigateToSignin,
                    child: Container(
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: accentColor,
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
