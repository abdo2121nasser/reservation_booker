import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/features/main_feature/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/get_my_appointments_cubit/get_my_appointments_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/repositories/get_appointment_repository.dart';


class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(GetAllAppointmentsFromHive().getAppointments().toString());

    return BlocProvider(
      create: (context) => GetMyAppointmentsCubit()..initializeCubit(),
      child: Column(
        children: [],
      ),
    );
  }
}
