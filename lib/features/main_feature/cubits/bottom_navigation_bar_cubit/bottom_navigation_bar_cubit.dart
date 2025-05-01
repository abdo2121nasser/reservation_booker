import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/screens/find_specialist_screen.dart';
import 'package:reservation_booker/features/my_appointments_feature/screens/my_appointments_screen.dart';


part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(const FindSpecialistsState(body: FindSpecialistScreen()));
  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);

  set setCurrentBodyWithIndex(int index) {
    switch (index) {
      case 0:
        emit(const FindSpecialistsState(body: FindSpecialistScreen()));
        break;
      case 1:
        emit(const MyAppointmentsState(body: MyAppointmentsScreen()));
        break;
    }
  }

  int get getCurrentBodyWithIndex {
    switch (state) {
      case FindSpecialistsState():
        return 0;
      case MyAppointmentsState():
        return 1;
    }
  }
  String get getCurrentTitleWithIndex {
    switch (state) {
      case FindSpecialistsState():
        return kFirstBottomNavigationBarItemTitle;
      case MyAppointmentsState():
        return kSecondBottomNavigationBarItemTitle;
    }
  }
  String get getCurrentSubTitleWithIndex {
    switch (state) {
      case FindSpecialistsState():
        return kFirstBottomNavigationBarItemSubTitle;
      case MyAppointmentsState():
        return kSecondBottomNavigationBarItemSubTitle;
    }
  }

}
