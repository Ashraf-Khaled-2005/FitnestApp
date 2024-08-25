// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dio/dio.dart';
import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';
import 'package:fitness_app/features/exercises/data/repo/exerciserepoimpl.dart';
import 'package:fitness_app/features/exercises/presentation/manager/indesesCubit/getexerciseindeses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: Text("data"),
        centerTitle: true,
      ),
      body: ExercisescategoryviewBody(
        models: models,
      ),
    );
  }
}
