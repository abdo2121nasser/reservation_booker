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
          SpecialistModel specialistModel =
              SpecialistModel.fromJson(docId: element.id, json: element.data());
          specialists.add(_filterBookedTimes(specialistModel));
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

  SpecialistModel _filterBookedTimes(SpecialistModel specialistModel) {
    for (AvailableDateEntity date in specialistModel.availableDates) {
      date.availableTimes.removeWhere((time) => time.isBooked == true);
    }
    return specialistModel;
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

class GetFilteredSpecialistsByCategoryFromHive
    implements GetSpecialistsRepository {
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
        if (element.data.category == filteredCategory) {
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

class GetFilteredSpecialistsByDocIdFromFireBase
    implements GetSpecialistsRepository {
  final String specialistDocId;

  GetFilteredSpecialistsByDocIdFromFireBase({required this.specialistDocId});

  @override
  Future<List<SpecialistEntity>> getSpecialist() async {
    try {
      return await FirebaseFirestore.instance
          .collection(kSpecialistCollection)
          .doc(specialistDocId)
          .get()
          .then((doc) {
        final SpecialistModel specialistModel =
            _filterBookedTimes(SpecialistModel.fromJson(
          docId: doc.id,
          json: doc.data()!,
        ));

        return [specialistModel];
      });
    } on FirebaseException catch (e) {
      final failure = FirebaseFailure.fromFirebase(e);
      debugPrint(failure.devMessage);
      showToastMessage(message: failure.userMessage);
      return [];
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnknownErrorMessage);
      return [];
    }
  }

  SpecialistModel _filterBookedTimes(SpecialistModel specialistModel) {
    for (AvailableDateEntity date in specialistModel.availableDates) {
      date.availableTimes.removeWhere((time) => time.isBooked == true);
    }
    return specialistModel;
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
        if (element.data.name
            .toLowerCase()
            .contains(filteredName.toLowerCase())) {
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

// List<SpecialistEntity> addAllSpecialists() {
//   _specialists.forEach((element) async {
//     await FirebaseFirestore.instance
//         .collection(kSpecialistCollection)
//         .add(_convertEntityToModel(element).toJson());
//
//   });
//   return [];
// }
// SpecialistModel _convertEntityToModel(SpecialistEntity entity) {
//   return SpecialistModel(
//     data: DataEntity(
//       name: entity.data.name,
//       category: entity.data.category,
//       rate: entity.data.rate,
//       avatarUrl: entity.data.avatarUrl,
//       about: entity.data.about,),
//     availableDates: entity.availableDates,
//   );
// }
//
// final List<SpecialistEntity> _specialists = [
//   // Therapy & Counseling (3)
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Dr. Sarah Johnson',
//       category: 'Therapy & Counseling',
//       rate: 5,
//       avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
//       about: 'With over 10 years of experience in cognitive behavioral therapy, I help patients develop coping strategies for anxiety and depression.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 4),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 4, 9, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 4, 10, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 4, 12, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Dr. Marcus Reynolds',
//       category: 'Therapy & Counseling',
//       rate: 4,
//       avatarUrl: 'https://randomuser.me/api/portraits/men/43.jpg',
//       about: 'Specializing in family therapy and relationship counseling, I create a safe space for families to resolve conflicts and improve communication.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 5),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 5, 11, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 5, 13, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 5, 15, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Dr. Lisa Wong',
//       category: 'Therapy & Counseling',
//       rate: 3,
//       avatarUrl: 'https://randomuser.me/api/portraits/women/67.jpg',
//       about: 'My approach combines traditional psychotherapy with mindfulness techniques to help clients overcome trauma and build resilience.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 6),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 6, 9, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 6, 10, 45), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 6, 14, 15), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//
//   // Physical Therapy (3)
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Dr. Michael Chen',
//       category: 'Physical Therapy',
//       rate: 4,
//       avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
//       about: 'Specialized in sports rehabilitation and post-surgery recovery. I work with patients to regain strength and mobility.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 7),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 7, 10, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 7, 12, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 7, 13, 30), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Dr. Rebecca Martinez',
//       category: 'Physical Therapy',
//       rate: 5,
//       avatarUrl: 'https://randomuser.me/api/portraits/women/33.jpg',
//       about: 'Focused on orthopedic rehabilitation and treatment of chronic pain conditions through specialized movement therapies.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 8),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 8, 9, 15), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 8, 11, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 8, 16, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Thomas Wright',
//       category: 'Physical Therapy',
//       rate: 3,
//       avatarUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
//       about: 'I specialize in neurological rehabilitation, helping patients recover from strokes and traumatic brain injuries.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 9),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 9, 10, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 9, 14, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 9, 15, 45), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//
//   // Nutrition (3)
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Emma Rodriguez',
//       category: 'Nutrition Counseling',
//       rate: 4,
//       avatarUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
//       about: 'I create personalized nutrition plans to help clients achieve their health goals, whether weight management or medical nutrition therapy.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 10),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 10, 11, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 10, 12, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 10, 14, 30), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Daniel Kim',
//       category: 'Nutrition Counseling',
//       rate: 2,
//       avatarUrl: 'https://randomuser.me/api/portraits/men/62.jpg',
//       about: 'Specializing in sports nutrition and performance enhancement through dietary adjustments for athletes and active individuals.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 11),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 11, 9, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 11, 11, 15), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 11, 13, 45), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Olivia Thompson',
//       category: 'Nutrition Counseling',
//       rate: 5,
//       avatarUrl: 'https://randomuser.me/api/portraits/women/90.jpg',
//       about: 'My focus is on plant-based nutrition and helping clients transition to healthier, sustainable eating patterns.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 12),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 12, 10, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 12, 12, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 12, 14, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//
//   // Career Coaching (2)
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Dr. James Wilson',
//       category: 'Career Coaching',
//       rate: 3,
//       avatarUrl: 'https://randomuser.me/api/portraits/men/52.jpg',
//       about: 'Former HR executive helping professionals navigate career transitions and development. Expert in resume building and interview preparation.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 13),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 13, 9, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 13, 11, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 13, 15, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Alexandra Davis',
//       category: 'Career Coaching',
//       rate: 4,
//       avatarUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
//       about: 'I help professionals identify their strengths and passions to build fulfilling careers through personalized coaching and strategy.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 14),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 14, 10, 15), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 14, 13, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 14, 14, 45), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//
//   // Yoga & Meditation (2)
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Sophia Patel',
//       category: 'Yoga & Meditation',
//       rate: 5,
//       avatarUrl: 'https://randomuser.me/api/portraits/women/75.jpg',
//       about: 'Certified yoga instructor and mindfulness coach. I specialize in stress reduction and building a sustainable practice for mental wellness.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 15),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 15, 8, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 15, 9, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 15, 11, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'David Turner',
//       category: 'Yoga & Meditation',
//       rate: 4,
//       avatarUrl: 'https://randomuser.me/api/portraits/men/76.jpg',
//       about: 'My approach combines traditional Hatha yoga with breathing techniques to improve flexibility, strength, and mental clarity.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 16),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 16, 7, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 16, 8, 15), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 16, 10, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Carlos Mendez',
//       category: 'Fitness Training',
//       rate: 3,
//       avatarUrl: 'https://randomuser.me/api/portraits/men/15.jpg',
//       about: 'Certified personal trainer specializing in functional fitness and strength training for all age groups and fitness levels.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 17),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 17, 9, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 17, 11, 0), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 17, 13, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//   SpecialistEntity(
//     data: DataEntity(
//       name: 'Jasmine Williams',
//       category: 'Fitness Training',
//       rate: 4,
//       avatarUrl: 'https://randomuser.me/api/portraits/women/36.jpg',
//       about: 'I focus on HIIT workouts and circuit training for maximum results in minimal time, customized to your fitness goals.',
//     ),
//     availableDates: [
//       AvailableDateEntity(
//         date: DateTime(2025, 5, 18),
//         availableTimes: [
//           AvailableTimeEntity(time: DateTime(2025, 5, 18, 10, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 18, 12, 30), isBooked: false),
//           AvailableTimeEntity(time: DateTime(2025, 5, 18, 15, 0), isBooked: false),
//         ],
//       ),
//     ],
//   ),
//
// ];
