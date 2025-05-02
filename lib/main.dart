import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/root/app_root.dart';

import 'core/services/bloc_opserver.dart';
import 'features/find_specialist_feature/entities/specialist_entity.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(SpecialistEntityAdapter());
  Hive.registerAdapter(AvailableDateEntityAdapter());

  await Hive.openBox(kSpecialistBox);
  Bloc.observer = MyBlocObserver();
  // await Firebase.initializeApp(); // <-- this is required

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ReservationApp());
}


