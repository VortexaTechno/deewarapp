import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_screan_event.dart';
part 'main_screan_state.dart';

class MainScreanBloc extends Bloc<MainScreanEvent, MainScreanState> {
  MainScreanBloc() : super(MainScreanState()) {
    on<ChangeSelectNavIndex>((event, emit) {
      emit(state.copyWith(
 selectedIndex: event.Index
      ));
    });
  }
}
