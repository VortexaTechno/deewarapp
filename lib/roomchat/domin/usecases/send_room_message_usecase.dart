import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';

import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:ahlachat/roomchat/domin/repository/base_chat_room_repository.dart';
import 'package:dartz/dartz.dart';

class SendMessageRoomsUseCase{
  final BaseChatRoomRepository baseFollowRoomsRepository;
  SendMessageRoomsUseCase(this.baseFollowRoomsRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SendMessageRoom(
      {tittle})async{
    return await baseFollowRoomsRepository.SendMessageRoom(tittle: tittle);
  }
}