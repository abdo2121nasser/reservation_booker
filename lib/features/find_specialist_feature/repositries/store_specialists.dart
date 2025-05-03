import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:reservation_booker/core/utils/component/toast_message_function.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/specialist_model.dart';

import '../../../core/services/failure_service.dart';
import '../entities/specialist_entity.dart';

abstract class StoreSpecialistsRepository {
  void storeSpecialist({required List<SpecialistEntity> specialists});
}

class StoreSpecialistsUsingHive implements StoreSpecialistsRepository {
  @override
  Future<void> storeSpecialist({required List<SpecialistEntity> specialists}) async {
    try {
      var box =  Hive.box(kSpecialistBox);
      box.clear();
     await box.put(kSpecialists, specialists);

    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
    }
  }
}
