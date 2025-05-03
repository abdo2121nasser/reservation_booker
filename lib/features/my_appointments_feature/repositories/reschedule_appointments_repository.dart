import 'package:reservation_booker/features/find_specialist_feature/repositries/book_appointment.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/cancel_appointment_repository.dart';

import '../../find_specialist_feature/models/appointment_model.dart';

abstract class RescheduleAppointmentsRepository {
  Future<void> rescheduleAppointment();
  Future<void> rescheduleReservation();
}

class RescheduleAppointmentsFromFireBase
    implements RescheduleAppointmentsRepository {
  final AppointmentModel oldAppointmentModel;
  final AppointmentModel newAppointmentModel;

  RescheduleAppointmentsFromFireBase(
      {required this.oldAppointmentModel, required this.newAppointmentModel});

  @override
  Future<void> rescheduleAppointment() async {
    CancelAppointmentFromFireBase canceler =
        CancelAppointmentFromFireBase(appointmentModel: oldAppointmentModel);
    await canceler.cancelAppointment();
    BookAppointmentFromFireBase booker = BookAppointmentFromFireBase(
      appointmentEntity: newAppointmentModel,
    );
    await booker.bookAppointment();
  }

  @override
  Future<void> rescheduleReservation() async {
    CancelAppointmentFromFireBase canceler =
        CancelAppointmentFromFireBase(appointmentModel: oldAppointmentModel);
    BookAppointmentFromFireBase booker = BookAppointmentFromFireBase(
      appointmentEntity: newAppointmentModel,
    );
    await canceler.cancelReservation();
    await booker.reserveAppointment();
  }
}
