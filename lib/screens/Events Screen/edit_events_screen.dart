// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritagekunja_app/screens/signup_screen.dart';
import 'package:heritagekunja_app/utils/colors.dart';
import 'package:heritagekunja_app/utils/utils.dart';
import 'package:heritagekunja_app/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

class EditEventsScreen extends StatefulWidget {
  const EditEventsScreen({Key? key}) : super(key: key);

  @override
  _EditEventsScreenState createState() => _EditEventsScreenState();
}

class _EditEventsScreenState extends State<EditEventsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _timeController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _venueController.dispose();
    _detailsController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: 600,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              TextFieldInput(
                textEditingController: _titleController,
                hintText: 'Title',
                textInputType: TextInputType.text,
              ),
              Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 5, 16),
                        child: TextFieldInput(
                          textEditingController: _dateController,
                          hintText: 'Date',
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 16, 0, 16),
                        child: TextFieldInput(
                          textEditingController: _timeController,
                          hintText: 'Time',
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextFieldInput(
                textEditingController: _venueController,
                hintText: 'Venue',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                textEditingController: _detailsController,
                hintText: 'Details',
                textInputType: TextInputType.emailAddress,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 24, 236, 24),
                child: DottedBorder(
                  color: midGreyColor,
                  strokeWidth: 1, //
                  dashPattern: [5, 5],
                  child: Container(
                    height: 50,
                    width: 65,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/Vectoradd_image.png',
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: const Text(
                            "Cancel",
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
                      SizedBox(
                        width: 19.68,
                      ),
                      Expanded(
                        child: Container(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                  : const Text(
                                      'Update',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                      ),
                                    ),
                              height: 36.52,
                              width: 91.31,
                              alignment: Alignment.center,
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
                        ),
                      ),
                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}
