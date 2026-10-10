import 'package:ahlachat/core/network/succes_message_join_room_model.dart';

import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class JoinRoomsUseCase{
  final BaseRoomRepository baseJoinRoomsRepository;
  JoinRoomsUseCase(this.baseJoinRoomsRepository);
  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>> JoinVoiceRoom({id})async{
    return await baseJoinRoomsRepository.JoinVoiceRoom(id: id);
  }
}