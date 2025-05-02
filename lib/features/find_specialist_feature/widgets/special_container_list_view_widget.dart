import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_booker/core/utils/strings/strings.dart';
import 'package:reservation_booker/features/find_specialist_feature/models/specialist_model.dart';
import 'package:reservation_booker/features/find_specialist_feature/widgets/specialist_container_widget.dart';

import '../../../core/utils/values/app_size.dart';
import '../entities/specialist_entity.dart';

class SpecialContainerListViewWidget extends StatelessWidget {
   SpecialContainerListViewWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => InkWell(
              onTap: () async {
              },
              child:  SpecialistContainerWidget(
                specialistEntity: specialists[index],
              )),
          separatorBuilder: (context, index) => SizedBox(height: k10V,),
          itemCount: specialists.length),
    );
  }
}




final specialists = <SpecialistEntity>[
  SpecialistEntity(
    name: "Dr. Emily Carter",
    category: "Cardiologist",
    rate: 4.8,
    avatarUrl: "https://randomuser.me/api/portraits/women/44.jpg",
    about: "Expert in diagnosing and treating cardiovascular conditions.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 3),
        availableTimes: [
          DateTime(2025, 5, 3, 9, 0),
          DateTime(2025, 5, 3, 11, 0),
        ],
      ),
      AvailableDateEntity(
        date: DateTime(2025, 5, 5),
        availableTimes: [
          DateTime(2025, 5, 5, 14, 0),
          DateTime(2025, 5, 5, 16, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. James Smith",
    category: "Dermatologist",
    rate: 4.6,
    avatarUrl: "https://randomuser.me/api/portraits/men/43.jpg",
    about: "Specialist in treating skin, hair, and nail conditions.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 4),
        availableTimes: [
          DateTime(2025, 5, 4, 10, 0),
          DateTime(2025, 5, 4, 12, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Olivia Johnson",
    category: "Pediatrician",
    rate: 4.9,
    avatarUrl: "https://randomuser.me/api/portraits/women/67.jpg",
    about: "Providing compassionate care for infants, children, and teens.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 6),
        availableTimes: [
          DateTime(2025, 5, 6, 9, 30),
          DateTime(2025, 5, 6, 11, 30),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Michael Brown",
    category: "Orthopedic",
    rate: 4.7,
    avatarUrl: "https://randomuser.me/api/portraits/men/32.jpg",
    about: "Experienced in treating musculoskeletal system issues.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 7),
        availableTimes: [
          DateTime(2025, 5, 7, 13, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Sophia Lee",
    category: "Neurologist",
    rate: 4.5,
    avatarUrl: "https://randomuser.me/api/portraits/women/33.jpg",
    about: "Diagnoses and treats disorders of the nervous system.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 8),
        availableTimes: [
          DateTime(2025, 5, 8, 15, 0),
          DateTime(2025, 5, 8, 17, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. David Wilson",
    category: "Psychiatrist",
    rate: 4.3,
    avatarUrl: "https://randomuser.me/api/portraits/men/22.jpg",
    about: "Mental health specialist providing therapy and medications.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 9),
        availableTimes: [
          DateTime(2025, 5, 9, 10, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Isabella Martinez",
    category: "Gynecologist",
    rate: 4.4,
    avatarUrl: "https://randomuser.me/api/portraits/women/68.jpg",
    about: "Expert in women’s reproductive health and prenatal care.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 10),
        availableTimes: [
          DateTime(2025, 5, 10, 12, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Daniel Garcia",
    category: "Oncologist",
    rate: 4.6,
    avatarUrl: "https://randomuser.me/api/portraits/men/62.jpg",
    about: "Specialist in the diagnosis and treatment of cancer.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 11),
        availableTimes: [
          DateTime(2025, 5, 11, 11, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Mia Thompson",
    category: "Endocrinologist",
    rate: 4.5,
    avatarUrl: "https://randomuser.me/api/portraits/women/90.jpg",
    about: "Treats hormone-related disorders such as diabetes.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 12),
        availableTimes: [
          DateTime(2025, 5, 12, 14, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. William Anderson",
    category: "Ophthalmologist",
    rate: 4.7,
    avatarUrl: "https://randomuser.me/api/portraits/men/52.jpg",
    about: "Expert in eye health, vision care, and surgeries.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 13),
        availableTimes: [
          DateTime(2025, 5, 13, 10, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Ava White",
    category: "Rheumatologist",
    rate: 4.6,
    avatarUrl: "https://randomuser.me/api/portraits/women/23.jpg",
    about: "Specializes in treating arthritis and joint diseases.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 14),
        availableTimes: [
          DateTime(2025, 5, 14, 13, 30),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Benjamin Hall",
    category: "Urologist",
    rate: 4.4,
    avatarUrl: "https://randomuser.me/api/portraits/men/76.jpg",
    about: "Expert in urinary tract and male reproductive systems.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 15),
        availableTimes: [
          DateTime(2025, 5, 15, 16, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Charlotte Scott",
    category: "Allergist",
    rate: 4.5,
    avatarUrl: "https://randomuser.me/api/portraits/women/75.jpg",
    about: "Diagnoses and treats allergies and immune system issues.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 16),
        availableTimes: [
          DateTime(2025, 5, 16, 9, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Dr. Jack Young",
    category: "Gastroenterologist",
    rate: 4.6,
    avatarUrl: "https://randomuser.me/api/portraits/men/15.jpg",
    about: "Expert in digestive system disorders and treatments.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 17),
        availableTimes: [
          DateTime(2025, 5, 17, 10, 0),
        ],
      ),
    ],
  ),
  SpecialistEntity(
    name: "Jasmine Williams",
    category: "Pulmonologist",
    rate: 4.7,
    avatarUrl: "https://randomuser.me/api/portraits/women/36.jpg",
    about: "Diagnoses and treats respiratory and lung conditions.",
    availableDates: [
      AvailableDateEntity(
        date: DateTime(2025, 5, 18),
        availableTimes: [
          DateTime(2025, 5, 18, 11, 0),
        ],
      ),
    ],
  ),
];

