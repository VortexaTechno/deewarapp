import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';

import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class FollowRoomsUseCase{
  final BaseRoomRepository baseFollowRoomsRepository;
  FollowRoomsUseCase(this.baseFollowRoomsRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>> FollowVoiceRoom(id)async{
    return await baseFollowRoomsRepository.FollowRoom(id: id);
  }
}