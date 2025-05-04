import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../find_specialist_feature/cubits/book_appointment_cubit/book_appointment_cubit.dart';
import '../../../find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';

part 'main_state.dart';

abstract class MainCubit<T extends MainState> extends Cubit<T> {
  MainCubit(super.initialState);
}
