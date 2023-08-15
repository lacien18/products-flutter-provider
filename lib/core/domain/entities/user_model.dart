import 'package:uuid/uuid.dart';


class UserModel {
  String? email;
  String? password;

  UserModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    const uuid = Uuid();
    final v4 = uuid.v4();

    return {
      'email': email,
      'password': password,
      'id': v4,
    };
  }
}
