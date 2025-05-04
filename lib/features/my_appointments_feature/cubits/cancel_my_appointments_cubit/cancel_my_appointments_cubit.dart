import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservation_booker/features/main_feature/cubits/main_cubit/main_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/cancel_appointment_repository.dart';

part 'cancel_my_appointments_state.dart';

class CancelMyAppointmentsCubit extends MainCubit<CancelMyAppointmentsState> {
  CancelMyAppointmentsCubit() : super(CancelMyAppointmentsInitial());

 static CancelMyAppointmentsCubit get(context)=>BlocProvider.of(context);

  Future <void>cancelAppointment(
      {required CancelAppointmentRepository cancelAppointmentRepository}) async {
    emit(CancelMyAppointmentsLoadingState());
    await cancelAppointmentRepository.cancelAppointment();
    await cancelAppointmentRepository.cancelReservation();
    emit(CancelMyAppointmentsSuccessState());
  }
}



