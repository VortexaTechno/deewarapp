
import 'package:ahlachat/core/network/succes_message_model.dart';

import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class InviteToRoomUseCase{
  final BaseRoomRepository baseJoinRoomsRepository;
  InviteToRoomUseCase(this.baseJoinRoomsRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>> InviteToRoom({id,roomId})async{
    return await baseJoinRoomsRepository.InviteToRoom(id: id,roomId: roomId);
  }
}