import 'package:ahlachat/core/network/succes_message_get_Inbox_Room_model.dart';
import 'package:ahlachat/roomchat/domin/repository/base_chat_room_repository.dart';
import 'package:dartz/dartz.dart';

class GetInboxRoomsUseCase{
  final BaseChatRoomRepository baseFollowRoomsRepository;
  GetInboxRoomsUseCase(this.baseFollowRoomsRepository);
  Future<Either<SuccesMessageInboxModel, SuccesMessageInboxModel>> GetInboxRooms(
      {tittle})async{
    return await baseFollowRoomsRepository.GetInboxRoom();
  }
}