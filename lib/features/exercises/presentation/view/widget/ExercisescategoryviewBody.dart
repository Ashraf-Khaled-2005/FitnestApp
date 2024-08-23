import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';
import 'package:fitness_app/features/exercises/presentation/view/widget/CustomListile.dart';
import 'package:flutter/material.dart';

class ExercisescategoryviewBody extends StatelessWidget {
  final List<ExerciseModel> models;

  const ExercisescategoryviewBody({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff92A3FD),
            Color(0xff9DCEFF),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  bottom: -40,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Color(0xffB4C4FE),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/image/image.png',
                    width: 200,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Exercises",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      Text(
                        "${models.length} Exercises",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(.5),
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: models.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: CustomListile(
                                model: models[index],
                              ),
                            )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
