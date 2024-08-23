import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';
import 'package:flutter/material.dart';

import 'itemlistview.dart';

class ExercisesViewBody extends StatelessWidget {
  final List<List<ExerciseModel>> list;
  const ExercisesViewBody({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(
            "WorkoutTracker",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: true,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "What Do You Want to Train",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: list.length,
          itemBuilder: (context, index1) {
            return Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CustomListitemExercises(
                items: list[index1],
              ),
            );
          },
        )
      ],
    );
  }
}
