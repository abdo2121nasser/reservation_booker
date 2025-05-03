import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../entities/appointment_entity.dart';
import '../../repositries/book_appointment.dart';

part 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit() : super(BookAppointmentInitial());
  static BookAppointmentCubit get(context) => BlocProvider.of(context);

  bookAppointment(
      {required BookAppointmentRepository bookAppointmentRepository,
      required AppointmentEntity appointmentData}) {
    emit(BookAppointmentLoadingState());
    bookAppointmentRepository.book(appointmentData: appointmentData);
    emit(BookAppointmentSuccessState());
  }
}
