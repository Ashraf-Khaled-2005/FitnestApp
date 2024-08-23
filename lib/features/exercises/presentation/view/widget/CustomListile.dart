import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';
import 'package:flutter/material.dart';

class CustomListile extends StatelessWidget {
  final ExerciseModel model;
  const CustomListile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(16),
      //     side: BorderSide(color: Colors.blueGrey)),
      child: ListTile(
        trailing: Image.asset('assets/image/Arrow - Right Circle.png'),
        contentPadding: EdgeInsets.all(5),
        leading: Image.network(model.gifUrl!),
        title: Text(
          "${model.name}",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
