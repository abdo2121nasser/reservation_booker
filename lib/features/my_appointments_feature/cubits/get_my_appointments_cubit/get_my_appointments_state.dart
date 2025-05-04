part of 'get_my_appointments_cubit.dart';

@immutable
abstract class GetMyAppointmentsState extends MainState {}

final class GetMyAppointmentsInitial extends GetMyAppointmentsState {}

final class InitializeCubitLoadingState extends LoadingState {}

final class InitializeCubitSuccessState
    extends SuccessState<List<AppointmentEntity>> {
  InitializeCubitSuccessState({required List<AppointmentEntity> myAppointments})
      : super(data: myAppointments);
}

final class GetAppointmentLoadingState extends LoadingState {}

final class GetAppointmentSuccessState
    extends SuccessState<List<AppointmentEntity>> {
  GetAppointmentSuccessState({required List<AppointmentEntity> myAppointments})
      : super(data: myAppointments);
}
