import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/root/app_root.dart';

import 'core/services/bloc_opserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const ReservationApp());
}


