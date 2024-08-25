import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/core/widget/buttom.dart';
import 'package:fitness_app/features/exercises/data/model/exercisedone.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../data/model/exercise_model.dart';
import 'CustomStepItem.dart';

class ExerciseShowwingbody extends StatefulWidget {
  final Exercisedone? done;
  const ExerciseShowwingbody({
    super.key,
    required this.model,
    required this.done,
  });

  final ExerciseModel model;

  @override
  State<ExerciseShowwingbody> createState() => _ExerciseShowwingbodyState();
}

class _ExerciseShowwingbodyState extends State<ExerciseShowwingbody> {
  int issdone = -1;
  bool isloading = false;
  late Set<dynamic> indexs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.done != null)
      indexs = widget.done!.indexes.toSet() as Set<dynamic>;
    else
      indexs = {};
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                color: const Color(0xff6C89B3),
                image: DecorationImage(
                    image: NetworkImage(widget.model.gifUrl!),
                    fit: BoxFit.cover,
                    opacity: .5),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Jumping Jack",
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Descripation",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "It's consentrate on (${widget.model.bodyPart}),with equipment ${widget.model.equipment},and it's Name (${widget.model.name}), ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: Colors.black.withOpacity(.5)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "How TO do it",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  '${widget.model.instructions!.length}  Steps',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Colors.black.withOpacity(.5)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
        SliverList.builder(
          itemCount: widget.model.instructions!.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                if (issdone == index) {
                  issdone = -1;
                  indexs.remove(index);
                } else {
                  issdone = index;
                  indexs.add(index);
                }
              });
              indexs.forEach((i) {
                log("*********************************");
                log(i.toString());
              });
            },
            child: CustomStepItem(
              isDone: indexs.contains(index) ? true : false,
              model: widget.model,
              instraction: widget.model.instructions![index],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: isloading
              ? Center(child: CircularProgressIndicator())
              : customButtom(
                  w: MediaQuery.sizeOf(context).width,
                  ontap: () async {
                    isloading = true;
                    setState(() {});
                    final uuid = const Uuid().v4();
                    await FirebaseFirestore.instance
                        .collection("Exercises")
                        .doc(getid(id: widget.model.id!, userid: "1"))
                        .set({
                      'id': uuid,
                      'exerciseid': widget.model.id,
                      'indexes': indexs,
                      'userid': '1'
                    });

                    setState(() {
                      isloading = false;
                    });
                  }),
        )
      ],
    );
  }
}

String getid({required String id, required String userid}) {
  List<String> ids = [id, userid];
  ids.sort();
  return ids.join('_');
}
