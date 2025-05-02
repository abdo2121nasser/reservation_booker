import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/store_specialists.dart';

import '../../repositries/get_specialists.dart';

part 'find_specialist_state.dart';

class FindSpecialistCubit extends Cubit<FindSpecialistState> {
  FindSpecialistCubit() : super(FindSpecialistInitial());
  static FindSpecialistCubit get(context) => BlocProvider.of(context);

  void initializeCubit() async {
    emit(InitializeCubitLoadingState());

    List<SpecialistEntity> specialists =
        await GetSpecialistsFromHive().getSpecialist();

    if (specialists.isNotEmpty) {
      emit(InitializeCubitSuccessState(specialists: specialists));
    } else {
      List<SpecialistEntity> temp = await getSpecialists(
          specialistsRepository: GetAllSpecialistsFromFireBase());
      emit(InitializeCubitSuccessState(specialists: temp));
    }
  }

  Future<List<SpecialistEntity>> getSpecialists(
      {required GetSpecialistsRepository specialistsRepository}) async {
    emit(GetSpecialistsLoadingState());
    List<SpecialistEntity> specialists =
        await specialistsRepository.getSpecialist();
    await StoreSpecialists().storeSpecialist(specialists: specialists);
    emit(GetSpecialistsSuccessState(specialists: specialists));
    return specialists;
  }
 Future<void> filterSpecialist(
      {required GetSpecialistsRepository specialistsRepository}) async {
    emit(GetFilteredSpecialistsLoadingState());
    List<SpecialistEntity> specialists =
        await specialistsRepository.getSpecialist();
    emit(GetFilteredSpecialistsSuccessState(specialists: specialists));
  }
}
