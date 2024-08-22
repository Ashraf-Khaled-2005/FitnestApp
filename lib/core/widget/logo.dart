import 'package:flutter/material.dart';

class LogoRow extends StatelessWidget {
  const LogoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Fitnest',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
        ),
        Text(
          'X',
          style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.w700,
              color: Color(0xffB8AAF5)),
        )
      ],
    );
  }
}
