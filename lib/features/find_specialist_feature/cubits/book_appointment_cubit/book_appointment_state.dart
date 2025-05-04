part of 'book_appointment_cubit.dart';

@immutable
abstract class BookAppointmentState extends MainState {}

final class BookAppointmentInitial extends BookAppointmentState {}

final class BookAppointmentLoadingState extends LoadingState {}

final class BookAppointmentSuccessState extends BookAppointmentState {}
