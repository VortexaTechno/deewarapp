import 'dart:async';

import 'package:ahlachat/core/localization/languagemodel.dart';
import 'package:ahlachat/core/localization/languagemodel.dart';
import 'package:ahlachat/core/localization/languagemodel.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/localization/languagemodel.dart';

part 'localize_event.dart';
part 'localize_state.dart';

class LocalizeBloc extends Bloc<LocalizeEvent, LocalizeState> {
  LocalizeBloc() : super(LocalizeState()) {
    on<changelanguageevent>((event, emit) async{
      emit(LocalizeState(localize:Locale(event.LanguageModels.languageCode,'')));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Lang=event.LanguageModels.languageCode;
      await prefs.setString('lang', event.LanguageModels.languageCode);
    });

    on<startlanguageevent>((event, emit) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? langCode = prefs.getString('lang');
      print(langCode);
      Lang=langCode??'ar';
      if (langCode != null) {
        emit(LocalizeState(localize: Locale(langCode,'')));
      }
    });
  }



}
