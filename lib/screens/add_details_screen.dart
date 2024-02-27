// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritagekunja_app/screens/signup_screen.dart';
import 'package:heritagekunja_app/utils/colors.dart';
import 'package:heritagekunja_app/utils/utils.dart';
import 'package:heritagekunja_app/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({Key? key}) : super(key: key);

  @override
  _AddDetailsScreenState createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();

    _bioController.dispose();
    _addressController.dispose();
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

  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'assets/logo_horizontal.svg',
                height: 80,
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: HKWhite,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                      iconSize: 55,
                      onPressed: selectImage,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: 'Bio\n',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _addressController,
                hintText: 'Address',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 245, 0),
                child: Text(
                  'Preferences',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: midGreyColor,
                      fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 76,
              ),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: HKWhite,
                          ),
                        )
                      : const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(29),
                      ),
                    ),
                    color: accentColor,
                  ),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: navigateToSignup,
                    child: Container(
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
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
