import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  String languageCode;
  String countryCode;
  String countryName;
  LanguageModel({required this.languageCode, required this.countryCode,required this.countryName});

  @override
  List<Object?> get props => [
    languageCode,
    countryCode,countryName

  ];
}
