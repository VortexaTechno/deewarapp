part of 'splashscrean_bloc.dart';

@immutable
  class SplashScreanState extends Equatable{

  Widget CurrentScrean;
  SplashScreanState({required this.CurrentScrean});
  List<Object?> get props => [
    CurrentScrean,
  ];
}

