part of 'chair_bloc.dart';


@immutable
abstract class ChairEvent   extends Equatable {

  const ChairEvent();

}


class  LockChairEvent extends ChairEvent {
  int index;
  int id;

  LockChairEvent({required this.id,required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [index,id];
}


class  UnLockLockChairEvent extends ChairEvent {
  int index;
  int id;

  UnLockLockChairEvent({required this.id,required this.index});
  @override
  // TODO: implement props
  List<Object?> get props =>[index,id];
}

class  ChangeLockChairEvent extends ChairEvent {
  int index;
  int status;

  ChangeLockChairEvent({required this.status,required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [index,status];
}



class  JoinChairEvent extends ChairEvent {
  int index;
  int id;

  JoinChairEvent({required this.id,required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [index,id];
}
class  LeaveChairEvent extends ChairEvent {
  int index;
  int id;

  LeaveChairEvent({required this.id,required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [index,id];
}
class  LeaveUserChairEvent extends ChairEvent {
  int index;
  int id;

LeaveUserChairEvent({required this.id,required this.index});
@override
// TODO: implement props
List<Object?> get props => [index,id];
}

class  ChangeUserChairEvent extends ChairEvent {


  ChangeUserChairEvent( );
  @override
// TODO: implement props
  List<Object?> get props => [ ];
}


class  OpenMicChairEvent extends ChairEvent {


  OpenMicChairEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CloseMicChairEvent extends ChairEvent {


  CloseMicChairEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SendEmojeEvent extends ChairEvent {
String tittle;

SendEmojeEvent({required this.tittle});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ReciveEmojeEvent extends ChairEvent {
  String tittle;
  int id;
  ReciveEmojeEvent({required this.tittle,required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [tittle,id];
}

class GetEmojeEvent extends ChairEvent {

  GetEmojeEvent( );
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CollectChairHostEvent extends ChairEvent {

  CollectChairHostEvent( );
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
