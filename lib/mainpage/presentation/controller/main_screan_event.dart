part of 'main_screan_bloc.dart';

@immutable
abstract class MainScreanEvent  extends Equatable{
  const MainScreanEvent();
}
class ChangeSelectNavIndex extends MainScreanEvent {
  final  Index;
  ChangeSelectNavIndex({required this.Index});
  List<Object> get props => [Index];
}