import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

class AppointmentEntity {
  final DataEntity specialistData;
  final DateTime selectedDate;
  final DateTime selectedTime;

  AppointmentEntity(
      {required this.specialistData,
      required this.selectedDate,
      required this.selectedTime});
}
