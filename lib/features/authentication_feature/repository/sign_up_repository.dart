import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_booker/features/authentication_feature/entities/sign_in_entity.dart';
import 'package:reservation_booker/features/authentication_feature/models/sign_up_model.dart';

import '../../../core/services/failure_service.dart';
import '../../../core/utils/component/toast_message_function.dart';
import '../../../core/utils/strings/strings.dart';
import '../entities/sign_up_entity.dart';

abstract class SignUpRepository {
  Future<void> signUp();
  Future<void> createAccount({required String userDocId});
}

class SignUpWithFireBase implements SignUpRepository {
  final SignUpModel signUpModel;

  SignUpWithFireBase({required this.signUpModel});
  @override
  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpModel.email, password: signUpModel.password);
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

  @override
  Future<void> createAccount({required String userDocId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(kUserCollection)
          .doc(userDocId)
          .set(signUpModel.toJson());
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
