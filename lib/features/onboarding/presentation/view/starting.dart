import 'package:fitness_app/features/onboarding/presentation/view/OnboardingView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/Appimages.dart';
import '../../../../core/widget/buttom.dart';
import '../../../../core/widget/logo.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    var h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoRow(),
                  Text(
                    'Everybody Can Train',
                    style: TextStyle(
                        color: Color(0xff7B6F72),
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            customButtom(
              w: w,
              ontap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => OnboardingView()));
              },
            )
          ],
        ),
      ),
    );
  }
}
