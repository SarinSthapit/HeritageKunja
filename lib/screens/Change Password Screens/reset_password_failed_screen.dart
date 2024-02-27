// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password1_screen.dart';
import 'package:heritagekunja_app/screens/Change%20Password%20Screens/reset_password2_screen.dart';
import 'package:heritagekunja_app/screens/login_screen.dart';
import 'package:heritagekunja_app/utils/colors.dart';

class PasswordChangeFailed extends StatefulWidget {
  const PasswordChangeFailed({Key? key}) : super(key: key);

  @override
  _PasswordChangeFailedState createState() => _PasswordChangeFailedState();
}

class _PasswordChangeFailedState extends State<PasswordChangeFailed> {
  bool _isLoading = false;

  void navigateToChangePassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChangePasswordScreen(),
      ),
    );
  }

  void continueChangePassword() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ResetPasswordScreen(),
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
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
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
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      'Sorry, we could not reset your password.',
                      style: TextStyle(
                        fontSize: 18,
                        color: midGreyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: navigateToChangePassword,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child:
                              CircularProgressIndicator(color: Colors.orange),
                        )
                      : const Text(
                          'Retry',
                          style: TextStyle(
                            color: Colors.white,
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
                    onTap: continueChangePassword,
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
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
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
