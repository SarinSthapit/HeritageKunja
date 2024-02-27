// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password2_screen.dart';
import 'package:heritagekunja_app/screens/login_screen.dart';
import 'package:heritagekunja_app/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:heritagekunja_app/utils/utils.dart';

import 'package:heritagekunja_app/widgets/text_field_input.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  void continueChangePassword() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ResetPasswordScreen(),
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
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset(
                'assets/logo_with_title.svg',
                height: 65.29,
                width: 303,
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 80, 0),
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 32,
                        color: midGreyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your email address',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: continueChangePassword,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child:
                              CircularProgressIndicator(color: Colors.orange),
                        )
                      : const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  width: double.infinity,
                  height: 55,
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
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: navigateToSignin,
                    child: Container(
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: accentColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 29.0,
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
