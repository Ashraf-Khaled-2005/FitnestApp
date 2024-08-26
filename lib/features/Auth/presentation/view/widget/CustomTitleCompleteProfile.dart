import 'package:flutter/material.dart';

class CustomTitleCompleteProfile extends StatelessWidget {
  final String title;
  const CustomTitleCompleteProfile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Color(0xffC58BF2), Color(0xffEEA4CE)],
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.white),
      ),
    );
  }
}
