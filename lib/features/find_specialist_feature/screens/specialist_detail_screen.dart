import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/extra_data_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/custom_app_bar_widget.dart';

import '../widgets/specialist_detail_screen_body_widget.dart';
import 'package:provider/provider.dart';

class SpecialistDetailScreen extends StatelessWidget {
  final ExtraDataEntity extraDataEntity;

  const SpecialistDetailScreen({super.key, required this.extraDataEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      // take care there is 2 widgets with the same name file app bar
      body: ChangeNotifierProvider(
        create: (context) => DateChangerNotifier(),
        child: SpecialistDetailScreenBodyWidget(
            specialistEntity: extraDataEntity.specialistEntity,
         findSpecialistCubit: extraDataEntity.findSpecialistCubit,
        ),
      ),
    );
  }
}

class DateChangerNotifier extends ChangeNotifier {
  AvailableDateEntity? _selectedDate;
  DateTime? _selectedTime;

  void selectDate({required AvailableDateEntity date}) {
    date.availableTimes = date.availableTimes.map((time) {
      time.isSelected=false;
      return time;

    }).toList();
    _selectedDate = date;
    _selectedTime = null;
    notifyListeners();
  }

  AvailableDateEntity get selectedDate => _selectedDate!;
  bool get isDateSelected => _selectedDate != null;

  void selectTime({required DateTime time}) {
    _selectedTime = time;
    notifyListeners();
  }

  bool get isTimeSelected => _selectedTime != null;
  DateTime get selectedTime => _selectedTime!;

}
