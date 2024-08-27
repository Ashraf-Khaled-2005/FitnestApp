import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/Home/presentation/view/Home_page.dart';
import 'package:fitness_app/features/exercises/data/model/exercisedone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/buttom.dart';
import '../../../../Auth/domain/model/userModel.dart';
import '../../../../exercises/presentation/view/exercisesview.dart';
import '../../manager/cubit/getuserdata_cubit.dart';
import 'CustomProfileView.dart';
import 'CustomUserInfo.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homebodybloc();
  }
}

class Homebodybloc extends StatelessWidget {
  const Homebodybloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetuserdataCubit, GetuserdataState>(
      builder: (context, state) {
        if (state is Getuserdataloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Getuserdatasucess) {
          Usermodel user = state.user;
          var age = 2024 - (int.parse(user.date.split('/')[2]));
          return HomeBodySuccess(user: user);
        } else if (state is Getuserdatafail) {
          return Center(child: Text('Error: ${state.err}'));
        } else {
          return const Center(child: Text('Unexpected state!'));
        }
      },
    );
  }
}

class HomeBodySuccess extends StatelessWidget {
  const HomeBodySuccess({
    super.key,
    required this.user,
  });

  final Usermodel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileView(user: user),
        SizedBox(
          height: 30,
        ),
        customButtom(
          text: "GO to Exercises",
          w: double.infinity,
          ontap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ExercisesView()),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomUserInfo(
              text: "Weight",
              numinfo: "${user.wight} KG",
            ),
            CustomUserInfo(
              text: "Height",
              numinfo: "${user.hight} CM",
            ),
            CustomUserInfo(
              text: "Age",
              numinfo: "${2024 - (int.parse(user.date.split('/')[2]))} Year",
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Latest Activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentPage()));
                },
                child: Text(
                  "Best Seller 🛑",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff92A3FD)),
                ))
          ],
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Exercises")
              .where('userid',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var exercises = snapshot.data!.docs;

            if (exercises.isEmpty) {
              return const Center(
                child: Text(
                    "No Exercises you did it recently Try to go by click The upper Button"),
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  var exerciseData = exercises[index].data();
                  Exercisedone exerciseModel = Exercisedone(
                      instractionlength:
                          exerciseData['instractionlength'].toString(),
                      ExerciseId: exerciseData['exerciseid'],
                      indexes: exerciseData['indexes'],
                      id: exerciseData['id'],
                      userid: exerciseData['userid'],
                      image: exerciseData['image'],
                      category: exerciseData['category'],
                      name: exerciseData['name']);

                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CustomListileHome(
                      model: exerciseModel,
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}

class CustomListileHome extends StatelessWidget {
  final Exercisedone model;
  const CustomListileHome({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(16),
      //     side: BorderSide(color: Colors.blueGrey)),
      child: ListTile(
        trailing: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Done ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              TextSpan(
                text: "${model.indexes.length}",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff92A3FD)),
              ),
              const TextSpan(
                text: " / ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              TextSpan(
                text: "${model.instractionlength}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        contentPadding: const EdgeInsets.all(5),
        leading: CachedNetworkImage(
          imageUrl: model.image!,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        subtitle: Text(
          "${model.name}",
          style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontFamily: 'Poppins'),
        ),
        title: Text(
          model.category,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
