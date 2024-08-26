import 'package:flutter/material.dart';

class CustomLoginMethodContainuer extends StatelessWidget {
  final String logo;
  final void Function() onTap;
  const CustomLoginMethodContainuer(
      {super.key, required this.logo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Color(0xffDDDADA),
              ),
              borderRadius: BorderRadius.circular(14)),
        ),
        child: Image.asset(logo),
      ),
    );
  }
}
