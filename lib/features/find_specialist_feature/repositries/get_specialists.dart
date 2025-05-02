import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_booker/core/utils/component/toast_message_function.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/specialist_model.dart';

import '../../../core/services/failure_service.dart';
import '../entities/specialist_entity.dart';

abstract class GetSpecialistsRepository {
  Future<List<SpecialistEntity>> getSpecialist();
}

class GetAllSpecialists implements GetSpecialistsRepository {
  @override
  Future<List<SpecialistEntity>> getSpecialist() async {
    try {
      return await FirebaseFirestore.instance
          .collection(kSpecialistCollection)
          .get()
          .then((value) {
        List<SpecialistModel> specialists = [];
        for (var element in value.docs) {
          specialists.add(SpecialistModel.fromJson(element.data()));
        }
        return specialists;
      });
    } on FirebaseException catch (e) {
      final failure = FirebaseFailure.fromFirebase(e);
      debugPrint(failure.devMessage);
      showToastMessage(
        message: failure.userMessage,
      );
      return [];
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
      return [];
    }
  }
}
class GetFilteredSpecialists implements GetSpecialistsRepository {
  final String filteredCategory;

  GetFilteredSpecialists({required this.filteredCategory});
  @override
  Future<List<SpecialistEntity>> getSpecialist() async {
    try {
      return await FirebaseFirestore.instance
          .collection(kSpecialistCollection)
      .where(kCategory,isEqualTo: filteredCategory)
          .get()
          .then((value) {
        List<SpecialistModel> specialists = [];
        for (var element in value.docs) {
          specialists.add(SpecialistModel.fromJson(element.data()));
        }
        return specialists;
      });
    } on FirebaseException catch (e) {
      final failure = FirebaseFailure.fromFirebase(e);
      debugPrint(failure.devMessage);
      showToastMessage(
        message: failure.userMessage,
      );
      return [];
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
      return [];
    }
  }
}
