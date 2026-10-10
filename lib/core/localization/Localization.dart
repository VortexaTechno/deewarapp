import 'dart:convert';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class   AppLocale {

  final Locale locale ;

  AppLocale(this.locale) ;

  late  Map<String , String> _loadedLocalizedValues ;

  static AppLocale of (BuildContext context) {
    return Localizations.of(context, AppLocale) ;
  }

  Future loadLang() async {
    String  _langFile = await rootBundle.loadString('assets/language/${locale.languageCode}.json') ;
    Map<String ,dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedLocalizedValues = _loadedValues.map((key, value) => MapEntry(key, value.toString())) ;
  }

  String? getTranslated (String key) {
    return _loadedLocalizedValues[key] ;
  }

  static const LocalizationsDelegate<AppLocale> delegate  = _AppLocalDelegate() ;

}


class  _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalDelegate() ;
  @override
  bool isSupported(Locale locale) {
    return ["en" , "ar"].contains(locale.languageCode) ;
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale) ;
    await appLocale.loadLang();
    return appLocale ;
  }

  @override
  bool shouldReload(_AppLocalDelegate  old) => false  ;

}


getLang({ context,  key}) {
  return AppLocale.of(context).getTranslated(key) ;
}


Locale checklocal($lang){
  switch ($lang) {
    case 'En':
      return Locale(
        languages[0].languageCode,
        languages[0].countryCode,
      );
      break;
    default:
      return Locale(
        languages[1].languageCode,
        languages[1].countryCode,
      );
  }
}