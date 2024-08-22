import 'package:fitness_app/core/utils/Appimages.dart';
import 'package:flutter/material.dart';

import 'OnBoardingPageviewItem.dart';

class OnBoardingPageview extends StatelessWidget {
  final PageController controller;
  const OnBoardingPageview({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnBoardingPageviewItem(
          image: Assets.assetsImageFrame,
          title: 'Track Your Goal',
          subtitle:
              "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
        ),
        OnBoardingPageviewItem(
            image: Assets.assetsImageFrame1,
            title: 'Get Burn',
            subtitle:
                "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"),
        OnBoardingPageviewItem(
            image: Assets.assetsImageFrame2,
            title: 'Eat Well',
            subtitle:
                "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun"),
        OnBoardingPageviewItem(
            image: Assets.assetsImageFrame3,
            title: 'Improve Sleep  Quality',
            subtitle:
                "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning"),
      ],
    );
  }
}
