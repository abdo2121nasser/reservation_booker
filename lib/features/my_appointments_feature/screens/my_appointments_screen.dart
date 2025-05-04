import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/cancel_my_appointments_cubit/cancel_my_appointments_cubit.dart';
import 'package:reservation_booker/features/my_appointments_feature/cubits/get_my_appointments_cubit/get_my_appointments_cubit.dart';

import '../../main_feature/cubits/main_cubit/main_cubit.dart';
import '../repositories/get_appointment_repository.dart';
import '../widgets/my_appointment_screen_body_widget.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetMyAppointmentsCubit()..initializeCubit(),
        ),
        BlocProvider(create: (context) => CancelMyAppointmentsCubit())
      ],
      child: BlocBuilder<GetMyAppointmentsCubit, GetMyAppointmentsState>(
        builder: (context, getState) {
          return BlocConsumer<CancelMyAppointmentsCubit,
              CancelMyAppointmentsState>(
            listener: (context, cancelState) {
              if (cancelState is CancelMyAppointmentsSuccessState) {
                GetMyAppointmentsCubit.get(context).getAppointments(
                    getAppointmentRepository: GetAllAppointmentsFromFireBase());
              }
            },
            builder: (context, cancelState) {
              if (getState is LoadingState || cancelState is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const MyAppointmentScreenBodyWidget();
              }
            },
          );
        },
      ),
    );
  }
}
