import 'package:ahlachat/core/network/succes_message_get_kicked_members_model.dart';
import 'package:ahlachat/core/network/succes_message_get_room_members_model.dart';
import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class GetKickRoomsUseCase{
  final BaseRoomRepository basereJoinRoomsRepository;
  GetKickRoomsUseCase(this.basereJoinRoomsRepository);
  Future<Either<SuccesMessageKickedMembersModel, SuccesMessageKickedMembersModel>>  GetKickRooms()async{
    return await basereJoinRoomsRepository.GetKickRooms();
  }
}