import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/widget/buttom.dart';
import 'package:fitness_app/features/Auth/domain/model/userModel.dart';
import 'package:fitness_app/features/Home/presentation/manager/cubit/getuserdata_cubit.dart';
import 'package:fitness_app/features/exercises/presentation/view/exercisesview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/home_body.dart';

class HomeView extends StatefulWidget {
  final bool isgoogle;
  const HomeView({super.key, this.isgoogle = false});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isgoogle) {
      context.read<GetuserdataCubit>().getuserdata();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      backgroundColor: Color(0xffFCFCFC),
    );
  }
}
