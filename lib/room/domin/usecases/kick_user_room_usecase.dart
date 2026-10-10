import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';

import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class KickUserRoomsUseCase{
  final BaseRoomRepository baseJoinRoomsRepository;
  KickUserRoomsUseCase(this.baseJoinRoomsRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>> KickUserRooms({id})async{
    return await baseJoinRoomsRepository.KickUserRooms(id: id);
  }
}