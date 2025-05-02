import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String devMessage;
  final String userMessage;
  final String? code;

  Failure({
    required this.devMessage,
    required this.userMessage,
    this.code,
  });
}

class FirebaseFailure extends Failure {
  FirebaseFailure({
    required super.devMessage,
    required super.userMessage,
    super.code,
  });

  factory FirebaseFailure.fromFirebase(FirebaseException exception) {
    switch (exception.code) {
      case 'permission-denied':
        return FirebaseFailure(
          devMessage: "Permission Denied - ${exception.message}",
          userMessage: "You don't have access permission.",
          code: exception.code,
        );
      case 'unavailable':
        return FirebaseFailure(
          devMessage: "Service Unavailable - ${exception.message}",
          userMessage: "Service is currently unavailable. Please try again later.",
          code: exception.code,
        );
      case 'not-found':
        return FirebaseFailure(
          devMessage: "Document not found",
          userMessage: "We couldn't find the requested data.",
          code: exception.code,
        );
      case 'already-exists':
        return FirebaseFailure(
          devMessage: "Document already exists",
          userMessage: "This data already exists.",
          code: exception.code,
        );
      case 'invalid-argument':
        return FirebaseFailure(
          devMessage: "Invalid argument passed - ${exception.message}",
          userMessage: "An unexpected error occurred. Please try again.",
          code: exception.code,
        );
      case 'deadline-exceeded':
        return FirebaseFailure(
          devMessage: "Deadline exceeded - ${exception.message}",
          userMessage: "The request took too long. Please try again.",
          code: exception.code,
        );
      case 'unauthenticated':
        return FirebaseFailure(
          devMessage: "User not authenticated - ${exception.message}",
          userMessage: "You must be signed in to perform this action.",
          code: exception.code,
        );
      default:
        return FirebaseFailure(
          devMessage: "Unknown Firebase error - ${exception.message}",
          userMessage: "Something went wrong. Please try again later.",
          code: exception.code,
        );
    }
  }
}
