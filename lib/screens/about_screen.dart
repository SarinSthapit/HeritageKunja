// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritagekunja_app/utils/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: midGreyColor,
          ),
          onPressed: () {},
          //onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: HKWhite,
        title: Text(
          'About',
          style: TextStyle(
            color: midGreyColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            SvgPicture.asset(
              'assets/logo.svg',
              height: 140.72,
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(47, 47, 47, 16),
              child: Text(
                'HeritageKunja  is a mobile app which provides a medium to learn and share information, facts, news, blogs, articles, and images, anything related to the cultural heritage, through social engagement.\nIt aims to connect the heritage experts, enthusiasts, students and locals for exploring, reviviving, preserving and promoting such heritages.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: midGreyColor,
                  height: 1.6,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(47, 0, 219, 0),
              child: Text(
                'Team members',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: midGreyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(47, 0, 181, 0),
              child: Text(
                'Sudhansu Koirala'
                '\nSwornim Nakarmi'
                '\nArya Shakya'
                '\nSarin Sthapit'
                '\n\nv0.9.0 - Beta Release',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: midGreyColor,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
