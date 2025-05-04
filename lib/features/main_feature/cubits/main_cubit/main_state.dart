part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class LoadingState extends MainState
    implements
        FindSpecialistState,
        BookAppointmentState,
        GetMyAppointmentsState,
        CancelMyAppointmentsState {}

class SuccessState<T> extends MainState
    implements
        FindSpecialistState,
        GetMyAppointmentsState,
        CancelMyAppointmentsState {
  final T data;
  SuccessState({required this.data});
}
