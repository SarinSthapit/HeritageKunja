// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password1_screen.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password_failed_screen.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password_success_screen.dart';
import 'package:heritagekunja_app/screens/login_screen.dart';
import 'package:heritagekunja_app/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:heritagekunja_app/utils/utils.dart';

import 'package:heritagekunja_app/widgets/text_field_input.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
    _passwordController.dispose();
  }

  void resetPassword() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordChangeSuccess(),
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text(
                      'We have sent 6 digit pin to your email address.',
                      style: TextStyle(
                        fontSize: 17,
                        color: midGreyColor,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _pinController,
                hintText: 'Enter your pin',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _pinController,
                hintText: 'New password',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: resetPassword,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child:
                              CircularProgressIndicator(color: Colors.orange),
                        )
                      : const Text(
                          'Reset password',
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
                    onTap: navigateToChangePassword,
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
