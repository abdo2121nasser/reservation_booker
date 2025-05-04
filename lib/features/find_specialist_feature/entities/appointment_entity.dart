import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:hive/hive.dart';
import '../../../core/utils/strings/strings.dart'; // or wherever DataEntity lives
part 'appointment_entity.g.dart';

@HiveType(typeId: 4) // pick an unused typeId
class AppointmentEntity {
  @HiveField(0)
  final DataEntity specialistData;

  @HiveField(1)
  final DateTime selectedDate;

  @HiveField(2)
  final DateTime selectedTime;
  @HiveField(3)
  final String? docId;



  AppointmentEntity({
    required this.specialistData,
    required this.selectedDate,
    required this.selectedTime,
    this.docId
  });
}
