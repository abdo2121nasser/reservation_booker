part of 'find_specialist_cubit.dart';

@immutable
sealed class FindSpecialistState {}

final class FindSpecialistInitial extends FindSpecialistState {}

final class LoadingState extends FindSpecialistState {}
final class SuccessState extends FindSpecialistState {
 final List<SpecialistEntity> specialists;
   SuccessState({required this.specialists});

}

final class GetSpecialistsLoadingState extends LoadingState {}
final class GetSpecialistsSuccessState extends SuccessState {
  GetSpecialistsSuccessState({required super.specialists});
}
