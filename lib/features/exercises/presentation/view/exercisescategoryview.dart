// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';
import 'package:flutter/material.dart';
import 'widget/ExercisescategoryviewBody.dart';

class Exercisescategoryview extends StatelessWidget {
  final List<ExerciseModel> models;
  const Exercisescategoryview({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          " ${models[0].bodyPart} Exercises",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ExercisescategoryviewBody(
        models: models,
      ),
    );
  }
}
