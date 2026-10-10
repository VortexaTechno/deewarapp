part of 'localize_bloc.dart';

@immutable
 class LocalizeState extends Equatable {
   Locale ?localize;
  LocalizeState({this.localize});
  List<Object?> get props => [
    localize,
  ];
}


