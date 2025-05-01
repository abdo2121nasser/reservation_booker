part of 'bottom_navigation_bar_cubit.dart';

@immutable
sealed class BottomNavigationBarState extends Equatable{
  final Widget body;

  const BottomNavigationBarState({required this.body});
  @override
  List<Object?> get props => [body];


}


final class FindSpecialistsState extends BottomNavigationBarState {
  const FindSpecialistsState({required super.body});
}final class MyAppointmentsState extends BottomNavigationBarState {
  const MyAppointmentsState({required super.body});
}

