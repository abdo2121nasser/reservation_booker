import 'package:reservation_booker/features/authentication_feature/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {


  SignInModel(
      {
        required super.email,
        required super.password});

  factory SignInModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return SignInModel(
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['email'] = super.email;
    data['password'] = super.password;
    return data;
  }
}
