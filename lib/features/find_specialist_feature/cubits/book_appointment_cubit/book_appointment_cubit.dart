import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../entities/appointment_entity.dart';
import '../../repositries/book_appointment.dart';

part 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  BookAppointmentCubit() : super(BookAppointmentInitial());
  static BookAppointmentCubit get(context) => BlocProvider.of(context);

  Future <void>bookAppointment(
      {required BookAppointmentRepository bookAppointmentRepository}) async {
    emit(BookAppointmentLoadingState());
   await bookAppointmentRepository.book();
   await bookAppointmentRepository.reserveAppointment();
    emit(BookAppointmentSuccessState());
  }
}
