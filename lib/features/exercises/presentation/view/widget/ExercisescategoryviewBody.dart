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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff92A3FD),
            Color(0xff9DCEFF),
          ],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  const Positioned(
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
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Exercises",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "${models.length} Exercises",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(.5),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 30, right: 30),
                  child: CustomListile(
                    model: models[index],
                  ),
                ),
              ),
              childCount: models.length,
            ),
          )
        ],
      ),
    );
  }
}
