import 'package:flutter/material.dart';

import '../../../../Auth/domain/model/userModel.dart';

class CustomProfileView extends StatelessWidget {
  final Usermodel user;
  const CustomProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 32,
        backgroundColor: Color(0xffE0ECFF),
        child: (user.image == " ")
            ? Image.asset('assets/image/ima.jfif')
            : Image.network(user.image),
      ),
      title: Text(
        "${user.f_name} ${user.L_name}",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
      ),
      subtitle: Text(
        user.email,
        style: TextStyle(
            color: Colors.black.withOpacity(.5),
            fontWeight: FontWeight.w500,
            fontSize: 14),
      ),
    );
  }
}
