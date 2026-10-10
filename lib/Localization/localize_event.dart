part of 'localize_bloc.dart';

@immutable
abstract class LocalizeEvent {
  const LocalizeEvent();
}

class changelanguageevent extends LocalizeEvent {

  LanguageModel LanguageModels;
  changelanguageevent({required this.LanguageModels});
  @override
  List<Object?> get props => [LanguageModels];
}

class startlanguageevent extends LocalizeEvent {}
