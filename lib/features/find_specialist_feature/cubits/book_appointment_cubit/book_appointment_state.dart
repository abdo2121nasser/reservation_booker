part of 'book_appointment_cubit.dart';

@immutable
sealed class BookAppointmentState {}

final class BookAppointmentInitial extends BookAppointmentState {}

abstract class LoadingState extends BookAppointmentState {}

abstract class SuccessState extends BookAppointmentState {}

final class BookAppointmentLoadingState extends LoadingState {}

final class BookAppointmentSuccessState extends LoadingState {}
