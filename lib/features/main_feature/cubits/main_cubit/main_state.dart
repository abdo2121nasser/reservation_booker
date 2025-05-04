part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class LoadingState extends MainState implements FindSpecialistState,BookAppointmentState {}

class SuccessState<T> extends MainState implements FindSpecialistState {
  final T data;
  SuccessState({required this.data});
}
