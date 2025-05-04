import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservation_booker/features/authentication_feature/models/sign_in_model.dart';

import '../../repository/sign_up_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  Future<void> signUp({required SignUpRepository signUpRepository}) async {
    emit(SignUpLoadingState());
    await signUpRepository.signUp();
    await signUpRepository.createAccount(
        userDocId: FirebaseAuth.instance.currentUser!.uid);
    emit(SignUpSuccessState());
  }
}
