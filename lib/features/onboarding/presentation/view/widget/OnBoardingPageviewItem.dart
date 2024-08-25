import 'package:fitness_app/features/Auth/data/presentation/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/Appimages.dart';

class OnBoardingPageviewItem extends StatelessWidget {
  final bool islast;
  final String title, subtitle, image;
  const OnBoardingPageviewItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      this.islast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        islast
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text("Go to Signup")),
                ),
              )
            : SizedBox(
                height: 0,
                width: 0,
              ),
        Expanded(child: SvgPicture.asset(image)),
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins'),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            subtitle,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff7B6F72)),
          ),
        )
      ],
    );
  }
}
