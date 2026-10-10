import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'agora_event.dart';
part 'agora_state.dart';

class AgoraBloc extends Bloc<AgoraEvent, AgoraState> {
  AgoraBloc() : super(AgoraState()) {
    on<initializeagoraEvent>((event, emit) async{

      var engin=await RtcEngine.create(APP_ID);
     emit(AgoraState(engine:engin ));

      emit(state.copyWith(engine:engin ));

      //
      await state.engine?.enableAudio();
      await state.engine?.setChannelProfile(ChannelProfile.LiveBroadcasting);
      if(event.role==ClientRole.Broadcaster){
      await state.engine?. adjustRecordingSignalVolume(400);
      state.copyWith(mutedMic:   false);
      }else{
        state.copyWith(mutedMic: true);
      }
      await state.engine?.enableAudioVolumeIndication(250, 3, true);

      await state.engine?.setClientRole(event.role!);

          addAgoraEventHandlers();
      await state.engine?.joinChannel(event.Token, event.channelName, null,int.parse(UserId!));


    });

    on<EndAgoraEvent>((event, emit) async{

      await state.engine?.leaveChannel();

      emit(state.copyWith(mutedMic:   true));
    });

    on<SetAsBroadcasterEvent>((event, emit) async{
      Showtoast(message:'SetAsBroadcasterEvent');

      await     state.engine?.setClientRole(ClientRole.Broadcaster);
      await     state.engine?. adjustRecordingSignalVolume(400);

      emit(state.copyWith(mutedMic:   false));
    });


    on<SetasAudienceEvent>((event, emit) async{

      await state.engine?.setClientRole(ClientRole.Audience);

      emit(state.copyWith(mutedMic:   true));

    });
    on<ChangeSoundStausEvent>((event, emit) async{
if(event.status==1){
  await state.engine?.disableAudio();
  emit(state.copyWith(muted: true));
}else{
  await state.engine?.enableAudio();
  emit(state.copyWith(muted:   false));
}




    });


  }

  void addAgoraEventHandlers() {
    print('Call addAgoraEventHandlers ------------------------------');
    state.engine?.setEventHandler(RtcEngineEventHandler(
        error: (code) {print('onErrorCall addAgoraEventHandlers ------------------------------Call addAgoraEventHandlers ------------------------------: $code');},
        joinChannelSuccess: (channel, uid, elapsed) {


        },
        leaveChannel: (stats) {
         },
        userJoined: (uid, elapsed) {


        }, audioVolumeIndication: (volumeInfo, v) {

    }
    ));
  }
}
