import 'package:flutter/material.dart';

class CustomUserInfo extends StatelessWidget {
  final String numinfo, text;
  const CustomUserInfo({super.key, required this.numinfo, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 11),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black),
          BoxShadow(color: Colors.grey)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$numinfo",
            style: TextStyle(
                color: Color(0xff92A3FD),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "${text}",
            style: TextStyle(
                color: Colors.black.withOpacity(.8),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }
}
