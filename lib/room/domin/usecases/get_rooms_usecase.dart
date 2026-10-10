import 'package:ahlachat/core/network/succes_message_get_room_model.dart';

import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class GetRoomsUseCase{
  final BaseRoomRepository basereRoomsRepository;
  GetRoomsUseCase(this.basereRoomsRepository);
  Future<Either<SuccesMessageRoomsModel, SuccesMessageRoomsModel>>  GetRooms()async{
    return await basereRoomsRepository.GetRooms();
  }
}