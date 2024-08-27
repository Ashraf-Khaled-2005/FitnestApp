import 'dart:developer';

import 'package:date_format_field/date_format_field.dart';
import 'package:fitness_app/core/service/local_notication_Service.dart';
import 'package:fitness_app/core/widget/buttom.dart';
import 'package:fitness_app/features/Home/presentation/manager/cubit/getuserdata_cubit.dart';
import 'package:fitness_app/features/exercises/data/model/exercise_model.dart';
import 'package:fitness_app/features/exercises/presentation/manager/indesesCubit/getexerciseindeses_cubit.dart';
import 'package:fitness_app/features/exercises/presentation/view/exercisescategoryview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../ExerciseShowwing.dart';
import 'ExerciseShowwingbody.dart';

class CustomListile extends StatelessWidget {
  final ExerciseModel model;
  const CustomListile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          context.read<GetexerciseindesesCubit>().getdata(
              id: model.id!,
              userid: context.read<GetuserdataCubit>().usermodel.id);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExerciseShowwing(
                        model: model,
                      )));
        },
        trailing: InkWell(
            onTap: () {
              var keyboradhieght = MediaQuery.of(context).viewInsets.bottom;
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.only(bottom: keyboradhieght),
                  child: BottomSheetBody(model: model),
                ),
              );
            },
            child: const Icon(
              Icons.alarm,
              size: 24,
              color: Colors.black,
            )),
        contentPadding: const EdgeInsets.all(5),
        leading: CachedNetworkImage(
          imageUrl: model.gifUrl!,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(
          "${model.name}",
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}

class BottomSheetBody extends StatefulWidget {
  final ExerciseModel model;

  const BottomSheetBody({super.key, required this.model});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  late String date;
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                DateFormatField(
                  onsaved: (value) {
                    date = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter Your Date";
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffF7F8F8),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffF7F8F8),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      fillColor: const Color(0xffF7F8F8),
                      filled: true,
                      hintText: "Your Date"),
                  type: DateFormatType.type2,
                  onComplete: (p0) {},
                ),
                SizedBox(
                  height: 20,
                ),
                customButtom(
                  w: MediaQuery.sizeOf(context).width,
                  ontap: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();
                      log(date);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AboutDialog(
                              applicationName: "FitnestApp",
                              children: [
                                Text("You Have been Schulded An notification ")
                              ],
                            );
                          });
                      NotificationService.ShowScheduledNotification(
                          title:
                              "You Have exercise Now ${widget.model.bodyPart}",
                          body: " Exercise ${widget.model.name}",
                          time: date);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
