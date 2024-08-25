import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';
import 'package:fitness_app/features/exercises/presentation/manager/indesesCubit/getexerciseindeses_cubit.dart';
import 'package:fitness_app/features/exercises/presentation/view/exercisescategoryview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ExerciseShowwing.dart';
import 'ExerciseShowwingbody.dart';

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
        onTap: () {
          context
              .read<GetexerciseindesesCubit>()
              .getdata(id: model.id!, userid: '1');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExerciseShowwing(
                        model: model,
                      )));
        },
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
