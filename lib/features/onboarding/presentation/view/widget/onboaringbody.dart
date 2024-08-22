import 'package:fitness_app/core/utils/Appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'OnBoardingPageview.dart';
import 'OnBoardingPageviewItem.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageview(
          controller: controller,
        )),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
              child: InkWell(
                  onTap: () {
                    controller.nextPage(
                        duration: Durations.medium1,
                        curve: Curves.easeInOutCubic);
                  },
                  child: SvgPicture.asset(Assets.assetsImagebuttom)),
            ))
      ],
    );
  }
}
