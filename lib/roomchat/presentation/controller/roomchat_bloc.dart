import 'dart:async';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/gift/data/models/GiftModel.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/roomchat/data/models/InboxRoomModel.dart';
import 'package:ahlachat/roomchat/data/models/chatModel.dart';
import 'package:ahlachat/roomchat/domin/usecases/get_room_Inbox_message_usecase.dart';
import 'package:ahlachat/roomchat/domin/usecases/send_room_message_usecase.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'roomchat_event.dart';
part 'roomchat_state.dart';
ScrollController scrollControllerChat = ScrollController();
class RoomchatBloc extends Bloc<RoomchatEvent, RoomchatState> {
  final SendMessageRoomsUseCase SendChat;
final GetInboxRoomsUseCase GetInbox;
  RoomchatBloc(this.SendChat,this.GetInbox) : super(RoomchatState()) {
    on<AddNewMessageToChatEvent>((event, emit) {
      print( event.user);
      print('asdasdasdsssssssssssssssssssssssssssssssssssssssssss');
      print( event.reciver);

      ChatModel mymodel=    ChatModel(title:  event.tittle,user: event.user,status:  event.status,reciveruser: event.reciver,quant: event.quant,Gift: event.Gift);

      List<ChatModel> newList = List.from(state.ChatList); // Create a modifiable copy

      newList.add(mymodel);
      int onec=1;


      Timer.periodic(const Duration(seconds: 1), (timer) {

        if(onec<2){
          print(onec);

          if( scrollControllerChat.hasClients){
            scrollControllerChat.animateTo(
              scrollControllerChat.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }

        }
        onec++;
      });

     emit(state.copyWith(ChatList: newList));
    });
    on<AddWelcomeChatEvent>((event, emit) {
      emit(state.copyWith(ChatList: []));
      ChatModel mymodel=    ChatModel(title:  event.tittle,user: event.user,status:  event.status);
      ChatModel Welcomemodle=    ChatModel(title:  'مرحبا بك  يرجي المستخدمين الكرام احترام بعضهم البعض و الدردشه بطريقة لائقه.',user: null,status:  1);
      List<ChatModel> newList = []; // Create a modifiable copy

      newList.add(mymodel);
      newList.add(Welcomemodle);
      int onec=1;


      Timer.periodic(const Duration(seconds: 1), (timer) {

        if(onec<2){
          print(onec);

          if( scrollControllerChat.hasClients){
            scrollControllerChat.animateTo(
              scrollControllerChat.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }

        }
        onec++;
      });

      emit(state.copyWith(ChatList: newList));
    });
    on<SendMessageToChatEvent>((event, emit) async{


      final result= await  SendChat.SendMessageRoom(tittle:event.tittle );

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

      }, (r){
        Showtoast(message: r.statusMessage??'');


      }   );

    });

    on<GetInboxRoomEvent>((event, emit) async{
      ShowGlopalLoading();
      emit(state.copyWith(
        GetInboxState:   RequestState.loading,
      ));

    final result= await  GetInbox.GetInboxRooms( );
      DismissGlopalLoading();

    result.fold((l) {
    Showtoast(message: l.statusMessage??'');

    }, (r){
    Showtoast(message: r.statusMessage??'');
    emit(state.copyWith(
      GetInboxState:   RequestState.loaded,
      InboxRoomMs: r.Inbox
    ));
    print( r.Inbox);

    }   );

    });
  }
}
