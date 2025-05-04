import 'package:reservation_booker/features/find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/appointment_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

import '../../main_feature/cubits/main_cubit/main_cubit.dart';

class ExtraDataEntity{
  final SpecialistEntity specialistEntity;
  final MainCubit? mainCubit;
  final AppointmentEntity? oldAppointment;

  ExtraDataEntity({required this.specialistEntity, this.mainCubit,
  this.oldAppointment
  });

}