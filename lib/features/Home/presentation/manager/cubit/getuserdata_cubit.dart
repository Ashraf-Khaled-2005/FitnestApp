import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/Auth/domain/model/userModel.dart';
import 'package:meta/meta.dart';

part 'getuserdata_state.dart';

class GetuserdataCubit extends Cubit<GetuserdataState> {
  late Usermodel usermodel;
  GetuserdataCubit() : super(GetuserdataInitial());

  getuserdata() async {
    try {
      emit(Getuserdataloading());
      var result = await FirebaseFirestore.instance
          .collection('USERS')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      usermodel = Usermodel.fromdoc(result.data() as Map<String, dynamic>);
      emit(Getuserdatasucess(user: usermodel));
    } on Exception catch (e) {
      emit(Getuserdatafail(err: e.toString()));
    }
  }
}
