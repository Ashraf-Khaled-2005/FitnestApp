import 'package:fitness_app/core/utils/Appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class customButtom extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  const customButtom({
    super.key,
    required this.w,
    required this.ontap,
    this.text = "Get Started",
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: w,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
                colors: [Color(0xff92A3FD), Color(0xff9DCEFF)])),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class customAuthButtom extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  const customAuthButtom({
    super.key,
    required this.w,
    required this.text,
    required this.ontap,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: w,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
                colors: [Color(0xff92A3FD), Color(0xff9DCEFF)])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.assetsImageLogin),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
