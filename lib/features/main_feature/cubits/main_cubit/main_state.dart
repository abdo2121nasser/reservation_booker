part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class LoadingState extends MainState
    implements
        FindSpecialistState,
        BookAppointmentState,
        GetMyAppointmentsState {}

class SuccessState<T> extends MainState
    implements FindSpecialistState, GetMyAppointmentsState {
  final T data;
  SuccessState({required this.data});
}
