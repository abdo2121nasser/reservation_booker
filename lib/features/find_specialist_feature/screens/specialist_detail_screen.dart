import 'package:flutter/material.dart';
import 'package:reservation_booker/features/find_specialist_feature/entities/specialist_entity.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/custom_app_bar_widget.dart';

import '../widgets/specialist_detail_screen_body_widget.dart';
import 'package:provider/provider.dart';

class SpecialistDetailScreen extends StatelessWidget {
  final SpecialistEntity specialistEntity;

  const SpecialistDetailScreen({super.key, required this.specialistEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      // take care there is 2 widgets with the same name file
      body: ChangeNotifierProvider(
        create: (context) => DateChangerNotifier(),
        child: SpecialistDetailScreenBodyWidget(
            specialistEntity: specialistEntity),
      ),
    );
  }
}

class DateChangerNotifier extends ChangeNotifier {
  // Track selected values
  AvailableDateEntity? _selectedDate;
  AvailableTimeEntity? _selectedTime;

  void selectDate({required AvailableDateEntity date}) {
    _selectedDate = date;
    _selectedTime = null; // reset time selection
    notifyListeners();
  }
  AvailableDateEntity get selectedDate=>_selectedDate!;
  bool get isDateSelected =>_selectedDate!=null;

  void selectTime({required AvailableTimeEntity time}) {
    // if (selectedDate == null) return;

    _selectedTime = time;
    notifyListeners();
  }
}



