import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/appointment_model.dart';
import 'package:reservation_booker/features/main_feature/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/get_my_appointments_cubit/get_my_appointments_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/cancel_appointment_repository.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/get_appointment_repository.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/reschedule_appointments_repository.dart';

import '../../find_specialist_feature/entities/appointment_entity.dart';
import '../../find_specialist_feature/entities/specialist_entity.dart';


class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
RescheduleAppointmentsFromFireBase(oldAppointmentModel: oldAppointment, newAppointmentModel: newAppointment).rescheduleAppointment();
    return BlocProvider(
      create: (context) => GetMyAppointmentsCubit()..initializeCubit(),
      child: Column(
        children: [],
      ),
    );
  }
}
final oldAppointment = AppointmentModel(
  docId: 'FZIx77uEZILfHzabRPCJ',
  specialistData: DataEntity(
    specialistDocId: "ERlct162AhLJCuuLJioZ",
    name: "Dr. Marcus Reynolds",
    category: "Therapy & Counseling",
    rate: 4,
    avatarUrl: "https://randomuser.me/api/portraits/men/43.jpg",
    about:
    "Specializing in family therapy and relationship counseling, I create a safe space for families to resolve conflicts and improve communication.",
  ),
  selectedDate: DateTime.utc(2025, 5, 4, 22, 0), // May 5, 2025 1:00 AM UTC+3
  selectedTime: DateTime(2025, 5, 9, 11, 0), // 12:00 PM UTC+3 is 9:00 AM UTC
);
final newAppointment = AppointmentModel(
  docId: 'NihOW3D0uP6ayQGwALv1',
  specialistData: DataEntity(
    specialistDocId: "ERlct162AhLJCuuLJioZ",
    name: "Dr. Marcus Reynolds",
    category: "Therapy & Counseling",
    rate: 4,
    avatarUrl: "https://randomuser.me/api/portraits/men/43.jpg",
    about:
    "Specializing in family therapy and relationship counseling, I create a safe space for families to resolve conflicts and improve communication.",
  ),
  selectedDate: DateTime.utc(2025, 5, 4, 22, 0), // May 5, 2025 1:00 AM UTC+3
  selectedTime: DateTime(2025, 5, 9, 16, 45), // 12:00 PM UTC+3 is 9:00 AM UTC
);
