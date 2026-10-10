import 'package:ahlachat/core/network/succes_message_get_room_members_model.dart';


import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class MemberRoomsUseCase{
  final BaseRoomRepository baseJoinRoomsRepository;
  MemberRoomsUseCase(this.baseJoinRoomsRepository);
  Future<Either<SuccesMessageRoomsMembersModel, SuccesMessageRoomsMembersModel>> GetMemberRooms()async{
    return await baseJoinRoomsRepository.GetMemberRooms();
  }
}