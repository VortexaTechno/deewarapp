import 'package:ahlachat/core/network/succes_message_join_room_model.dart';

import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class EnterPasswordRoomsUseCase{
  final BaseRoomRepository baseJoinRoomsRepository;
  EnterPasswordRoomsUseCase(this.baseJoinRoomsRepository);
  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>> EnterPasswordVoiceRoom({id,password})async{
    return await baseJoinRoomsRepository.EnterVoiceRoomPassword(id: id,password: password);
  }
}