import 'package:flutter/material.dart';

import '../../../data/model/exercise_model.dart';

class CustomStepItem extends StatelessWidget {
  final ExerciseModel model;
  final String instraction;
  final bool isDone;
  const CustomStepItem(
      {super.key,
      this.isDone = false,
      required this.model,
      required this.instraction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 700),
              padding: EdgeInsets.all(3),
              width: 20,
              height: 20,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    width: 1.2,
                    color: Color(0xffC58BF2),
                  ),
                ),
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: isDone ? Color(0xffEEA4CE) : Colors.white,
              ),
            ),
            Image.asset('assets/image/Line.png')
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                instraction,
                style: TextStyle(
                    // overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black.withOpacity(.5)),
              )
            ],
          ),
        )
      ],
    );
  }
}
