import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';
import 'package:fitness_app/features/exercises/presentation/view/exercisescategoryview.dart';
import 'package:flutter/material.dart';

class CustomListitemExercises extends StatelessWidget {
  final List<ExerciseModel> items;
  const CustomListitemExercises({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 132,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient:
              LinearGradient(colors: [Color(0xff92A3FD), Color(0xff9DCEFF)])),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "${items[0].bodyPart}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${items.length} Exercises",
                style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Exercisescategoryview(
                                models: items,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "View More",
                    style: TextStyle(
                        color: Color(0xff92A3FD),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'Poppins'),
                  ),
                ),
              )
            ],
          ),
          Image.network(
            items[0].gifUrl!,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}
