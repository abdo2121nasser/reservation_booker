part of 'find_specialist_cubit.dart';

@immutable
sealed class FindSpecialistState {}

final class FindSpecialistInitial extends FindSpecialistState {}

final class LoadingState extends FindSpecialistState {}
final class SuccessState extends FindSpecialistState {
 final List<SpecialistEntity> specialists;
   SuccessState({required this.specialists});

}
final class InitializeCubitLoadingState extends LoadingState {

}
final class InitializeCubitSuccessState extends SuccessState {
  InitializeCubitSuccessState({required super.specialists});

}


final class GetSpecialistsLoadingState extends LoadingState {}
final class GetSpecialistsSuccessState extends SuccessState {
  GetSpecialistsSuccessState({required super.specialists});
}
final class GetFilteredSpecialistsLoadingState extends LoadingState {}
final class GetFilteredSpecialistsSuccessState extends SuccessState {
  GetFilteredSpecialistsSuccessState({required super.specialists});
}
