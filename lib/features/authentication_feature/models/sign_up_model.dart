import 'package:reservation_booker/features/authentication_feature/entities/sign_in_entity.dart';

import '../entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {


  SignUpModel(
      {
        required super.email,
        required super.password,
      // required super.userDocId
      });

  factory SignUpModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return SignUpModel(
        email: json['email'],
        password: json['password'],
        // userDocId: json['user Doc Id'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['email'] = super.email;
    return data;
  }
}
