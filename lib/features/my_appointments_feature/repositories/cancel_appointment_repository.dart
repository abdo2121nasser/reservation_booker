abstract class CancelAppointmentRepository{
        Future<void> cancelAppointment();
        Future<void> cancelAppointmentReservation();
}

// class CancelAppointmentFromFireBase implements CancelAppointmentRepository{
//   final AppointmentEntity appointmentEntity;
//   final String specialistDocId;
//
//   CancelAppointmentFromFireBase({required this.appointmentEntity, required this.specialistDocId});
//   @override
//   Future<void> cancelAppointment() async {
//     try {
//       AppointmentModel appointmentModel = AppointmentModel(
//           specialistData: appointmentEntity.specialistData,
//           selectedDate: appointmentEntity.selectedDate,
//           selectedTime: appointmentEntity.selectedTime);
//       FirebaseFirestore.instance
//           .collection(kMyAppointmentCollection)
//           .add(appointmentModel.toJson());
//     } on FirebaseException catch (e) {
//       final failure = FirebaseFailure.fromFirebase(e);
//       debugPrint(failure.devMessage);
//       showToastMessage(
//         message: failure.userMessage,
//       );
//     } catch (error) {
//       debugPrint(error.toString());
//       showToastMessage(message: kUnknownErrorMessage);
//     }
//   }
//
//   @override
//   Future<void> cancelAppointmentReservation() async {
//
//   }
//
// }
