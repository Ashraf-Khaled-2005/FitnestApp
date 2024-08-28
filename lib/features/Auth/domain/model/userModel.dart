class Usermodel {
  final String f_name, L_name, email, id, gender, wight, hight, date,image;

  Usermodel(
      {required this.f_name,
      required this.L_name,
      required this.email,
      required this.image,
      required this.id,
      required this.gender,
      required this.wight,
      required this.hight,
      required this.date});

  factory Usermodel.fromdoc(Map<String, dynamic> data) {
    return Usermodel(
        f_name: data['f_name'],
        L_name: data['L_name'],
        email: data['email'],
        image:data['image'],
        id: data['id'],
        gender: data['gender'],
        wight: data['wight'],
        hight: data['hight'],
        date: data['date']);
  }
}
