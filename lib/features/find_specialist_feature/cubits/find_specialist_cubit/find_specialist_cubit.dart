import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';

import '../../repositries/get_specialists.dart';

part 'find_specialist_state.dart';

class FindSpecialistCubit extends Cubit<FindSpecialistState> {
  FindSpecialistCubit() : super(FindSpecialistInitial());
  static FindSpecialistCubit get(context)=>BlocProvider.of(context);

  Future<void> getSpecialists({required GetSpecialistsRepository specialistsRepository})async {
    emit(GetSpecialistsLoadingState());
    List<SpecialistEntity> specialists= await specialistsRepository.getSpecialist();
   emit(GetSpecialistsSuccessState(specialists: specialists));
  }


}
