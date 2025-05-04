part of 'find_specialist_cubit.dart';

@immutable
abstract class FindSpecialistState extends MainState {}

final class FindSpecialistInitial extends FindSpecialistState {}

final class InitializeCubitLoadingState extends LoadingState {}

final class InitializeCubitSuccessState
    extends SuccessState<List<SpecialistEntity>> {
  InitializeCubitSuccessState({required List<SpecialistEntity> specialists})
      : super(data: specialists);
}

final class GetSpecialistsLoadingState extends LoadingState {}

final class GetSpecialistsSuccessState
    extends SuccessState<List<SpecialistEntity>> {
  GetSpecialistsSuccessState({required List<SpecialistEntity> specialists})
      : super(data: specialists);
}

final class GetFilteredSpecialistsLoadingState extends LoadingState {}

final class GetFilteredSpecialistsSuccessState
    extends SuccessState<List<SpecialistEntity>> {
  GetFilteredSpecialistsSuccessState(
      {required List<SpecialistEntity> specialists})
      : super(data: specialists);
}
