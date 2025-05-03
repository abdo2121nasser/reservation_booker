import 'package:reservation_booker/features/find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

class ExtraDataEntity{
  final SpecialistEntity specialistEntity;
  final FindSpecialistCubit findSpecialistCubit;

  ExtraDataEntity({required this.specialistEntity, required this.findSpecialistCubit});

}