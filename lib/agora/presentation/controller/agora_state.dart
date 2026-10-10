part of 'agora_bloc.dart';



@immutable


class AgoraState extends Equatable{
 final RtcEngine? engine;
 final bool muted;
 final bool mutedMic;
  AgoraState({
    this.engine,
    this.muted=false,
    this.mutedMic=true,

  });
AgoraState copyWith({
  bool ? muted,
  RtcEngine? engine,
  bool ? mutedMic,
  }) {
    return AgoraState(
      engine: engine??this.engine,
      muted: muted??this.muted,
      mutedMic: mutedMic??this.mutedMic

    );
  }


  List<Object?> get props => [
    engine,
    muted,
    mutedMic



  ];
}

