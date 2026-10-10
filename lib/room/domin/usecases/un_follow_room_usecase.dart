import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';

import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class UnFollowRoomsUseCase{
  final BaseRoomRepository baseUnFollowRoomsRepository;
  UnFollowRoomsUseCase(this.baseUnFollowRoomsRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnFollowVoiceRoom(id)async{
    return await baseUnFollowRoomsRepository.UnFollowRoom(id: id);
  }
}