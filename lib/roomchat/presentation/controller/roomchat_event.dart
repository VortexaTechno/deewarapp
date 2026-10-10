part of 'roomchat_bloc.dart';

@immutable
abstract class RoomchatEvent {}

class  AddNewMessageToChatEvent extends RoomchatEvent {
UserModel user;
UserModel? reciver;
String? quant;
String tittle;
int status;
GiftModel?Gift;
AddNewMessageToChatEvent({required this.user,required this.tittle,required this.status,this.reciver,this.quant,this.Gift});
  @override
  // TODO: implement props
  List<Object?> get props => [user,tittle,status,Gift,reciver,quant];
}
class  AddWelcomeChatEvent extends RoomchatEvent {
  UserModel user;
  String tittle;
  int status;
  AddWelcomeChatEvent({required this.user,required this.tittle,required this.status });
  @override
  // TODO: implement props
  List<Object?> get props => [user,tittle,status];
}

class  SendMessageToChatEvent extends RoomchatEvent {

  String tittle;

  SendMessageToChatEvent({required this.tittle});
  @override
  // TODO: implement props
  List<Object?> get props => [tittle];
}
class  GetInboxRoomEvent extends RoomchatEvent {



  GetInboxRoomEvent( );
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
