import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:date_format_field/date_format_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/widget/buttom.dart';
import 'package:fitness_app/features/Auth/data/presentation/manager/SIgninAuthCubit/SIgninAuthCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../core/utils/Appimages.dart';
import '../../../../../../core/widget/textfield.dart';
import '../../../../../onboarding/presentation/view/widget/OnBoardingPageviewItem.dart';
import 'CustomTitleCompleteProfile.dart';

class ProfileContinueBody extends StatefulWidget {
  final String l_name, f_name, email, pass;

  const ProfileContinueBody(
      {super.key,
      required this.l_name,
      required this.f_name,
      required this.email,
      required this.pass});

  @override
  State<ProfileContinueBody> createState() => _ProfileContinueBodyState();
}

class _ProfileContinueBodyState extends State<ProfileContinueBody> {
  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode auto = AutovalidateMode.disabled;
  String _selectedGender = 'male';
  late String height, wight;
  late String date;
  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Form(
      key: key,
      autovalidateMode: auto,
      child: Column(
        children: [
          const Expanded(
            child: const OnBoardingPageviewItem(
              image: Assets.assetsImageGenderPage,
              subtitle: "Let’s complete your profile",
              title: 'It will help us to know more about you!',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  text: "YourWeight (KG)",
                  icon: Icons.monitor_weight_outlined,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter Your Wight";
                    }
                  },
                  onSaved: (value) {
                    wight = value!;
                  },
                ),
              ),
              const CustomTitleCompleteProfile(
                title: "KG",
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  text: "Height",
                  icon: Icons.monitor_weight_outlined,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter Your Hight";
                    }
                  },
                  onSaved: (value) {
                    height = value!;
                  },
                ),
              ),
              const CustomTitleCompleteProfile(
                title: "CM",
              )
            ],
          ),
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
            type: DateFormatType.type1,
            onComplete: (p0) {},
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Male'),
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Female'),
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          customButtom(
              text: "Go to Home",
              w: MediaQuery.of(context).size.width,
              ontap: () async {
                final uuid = const Uuid().v4();
                log(keyboardHeight.toString());
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  context.read<AuthCubit>().SigninAuth(
                      email: widget.email,
                      f_name: widget.f_name,
                      L_name: widget.l_name,
                      pass: widget.pass,
                      gender: _selectedGender,
                      wight: wight,
                      hight: height,
                      date: date);
                } else {
                  auto = AutovalidateMode.always;
                  setState(() {});
                }
              }),
        ],
      ),
    );
  }
}
