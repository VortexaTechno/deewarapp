
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'svga_event.dart';
part 'svga_state.dart';

class SvgaBloc extends Bloc<SvgaEvent, SvgaState> {
  SvgaBloc() : super(SvgaState()) {
    on<ShowRoomEntryEvent>((event, emit) async{

    });
  }



}
