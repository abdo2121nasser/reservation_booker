import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:reservation_booker/core/utils/component/toast_message_function.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/specialist_model.dart';

import '../../../core/services/failure_service.dart';
import '../entities/specialist_entity.dart';

abstract class GetSpecialistsRepository {
  Future<List<SpecialistEntity>> getSpecialist();
}

class GetAllSpecialistsFromFireBase implements GetSpecialistsRepository {
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

class GetSpecialistsFromHive implements GetSpecialistsRepository {
  @override
  Future<List<SpecialistEntity>> getSpecialist() async {
    try {
      var box = Hive.box(kSpecialistBox);
      List<SpecialistEntity> specialists =
          box.get(kSpecialists, defaultValue: []).cast<SpecialistEntity>();
      return specialists;
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
      return [];
    }
  }
}

class GetFilteredSpecialistsByCategoryFromHive implements GetSpecialistsRepository {
  final String filteredCategory;

  GetFilteredSpecialistsByCategoryFromHive({required this.filteredCategory});
  @override
  Future<List<SpecialistEntity>> getSpecialist() async {
    try {
      GetSpecialistsFromHive getSpecialistsFromHive = GetSpecialistsFromHive();
      List<SpecialistEntity> specialists =
          await getSpecialistsFromHive.getSpecialist();
      List<SpecialistEntity> filteredSpecialists = [];
      for (var element in specialists) {
        if (element.category == filteredCategory) {
          filteredSpecialists.add(element);
        }
      }
      return filteredSpecialists;
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
      return [];
    }
  }
}

class GetFilteredSpecialistsByNameFromHive implements GetSpecialistsRepository {
  final String filteredName;

  GetFilteredSpecialistsByNameFromHive({required this.filteredName});
  @override
  Future<List<SpecialistEntity>> getSpecialist() async {
    try {
      GetSpecialistsFromHive getSpecialistsFromHive = GetSpecialistsFromHive();
      List<SpecialistEntity> specialists =
          await getSpecialistsFromHive.getSpecialist();
      List<SpecialistEntity> filteredSpecialists = [];
      for (var element in specialists) {
        if (element.name.toLowerCase().contains(filteredName.toLowerCase())) {
          filteredSpecialists.add(element);
        }
      }
      return filteredSpecialists;
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
      return [];
    }
  }
}


