import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservation_booker/features/authentication_feature/repository/sign_in_repository.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of(context);

  Future<void> signIn({required SignInRepository signInRepository}) async {
    emit(SignInLoadingState());
    await signInRepository.signIn();
    emit(SignInSuccessState());
  }
}
