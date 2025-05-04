part of 'cancel_my_appointments_cubit.dart';

@immutable
abstract class CancelMyAppointmentsState extends MainState {}

final class CancelMyAppointmentsInitial extends CancelMyAppointmentsState {}

final class CancelMyAppointmentsLoadingState extends LoadingState {}
final class CancelMyAppointmentsSuccessState extends SuccessState {
  CancelMyAppointmentsSuccessState():super(data: null);
}
