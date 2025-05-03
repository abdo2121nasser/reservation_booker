import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/store_my_appointments_repository.dart';
import 'package:reservation_booker/features/my_appointments_feature/screens/my_appointments_screen.dart';

import '../../repositories/get_appointment_repository.dart';

part 'get_my_appointments_state.dart';

class GetMyAppointmentsCubit extends Cubit<GetMyAppointmentsState> {
  GetMyAppointmentsCubit() : super(GetMyAppointmentsInitial());
  static GetMyAppointmentsCubit get(context) => BlocProvider.of(context);
  void initializeCubit() async {
    emit(InitializeCubitLoadingState());

    List<AppointmentEntity> myAppointments =
    await GetAllAppointmentsFromHive().getAppointments();

    if (myAppointments.isNotEmpty) {
      emit(InitializeCubitSuccessState(myAppointments: myAppointments));
    } else {
      List<AppointmentEntity> temp = await getAppointments(
          getAppointmentRepository: GetAllAppointmentsFromFireBase());
      emit(InitializeCubitSuccessState(myAppointments: temp));
    }
  }
  getAppointments(
      {required GetAppointmentRepository getAppointmentRepository}) async {
    emit(GetSpecialistsLoadingState());
    List<AppointmentEntity> appointments =
        await getAppointmentRepository.getAppointments();
  await  StoreMyAppointmentsUsingHive().storeMyAppointments(appointments: appointments);
    emit(GetSpecialistsSuccessState(myAppointments: appointments));
  }
}
