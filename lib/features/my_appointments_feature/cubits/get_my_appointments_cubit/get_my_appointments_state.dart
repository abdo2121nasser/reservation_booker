part of 'get_my_appointments_cubit.dart';

@immutable
sealed class GetMyAppointmentsState {}

final class GetMyAppointmentsInitial extends GetMyAppointmentsState {}

final class LoadingState extends GetMyAppointmentsState {}

final class SuccessState extends GetMyAppointmentsState {
  final List<AppointmentEntity> myAppointments;
  SuccessState({required this.myAppointments});
}

final class InitializeCubitLoadingState extends LoadingState {}

final class InitializeCubitSuccessState extends SuccessState {
  InitializeCubitSuccessState({required super.myAppointments});
}

final class GetAppointmentLoadingState extends LoadingState {}

final class GetAppointmentSuccessState extends SuccessState {
  GetAppointmentSuccessState({required super.myAppointments});
}
