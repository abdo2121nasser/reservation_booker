import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../main_feature/cubits/main_cubit/main_cubit.dart';
import '../../repositries/book_appointment.dart';

part 'book_appointment_state.dart';

class BookAppointmentCubit extends MainCubit<BookAppointmentState> {
  BookAppointmentCubit() : super(BookAppointmentInitial());
  static BookAppointmentCubit get(context) => BlocProvider.of(context);

  Future <void>bookAppointment(
      {required BookAppointmentRepository bookAppointmentRepository}) async {
    emit(BookAppointmentLoadingState());
   await bookAppointmentRepository.bookAppointment();
   await bookAppointmentRepository.reserveAppointment();
    emit(BookAppointmentSuccessState());
  }
}
