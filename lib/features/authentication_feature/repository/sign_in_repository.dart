import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_booker/features/authentication_feature/entities/sign_in_entity.dart';

import '../../../core/services/failure_service.dart';
import '../../../core/utils/component/toast_message_function.dart';
import '../../../core/utils/strings/strings.dart';

abstract class SignInRepository {
  Future<void> signIn();
}

class SignInWithFireBase implements SignInRepository {
  final SignInEntity signInEntity;

  SignInWithFireBase({required this.signInEntity});
  @override
  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signInEntity.email, password: signInEntity.password);
    } on FirebaseException catch (e) {
      final failure = FirebaseFailure.fromFirebase(e);
      debugPrint(failure.devMessage);
      showToastMessage(
        message: failure.userMessage,
      );
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
    }
  }
}
