import 'package:ahlachat/core/network/succes_message_get_room_members_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';


import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class SearchMemberRoomsUseCase{
  final BaseRoomRepository baseJoinRoomsRepository;
  SearchMemberRoomsUseCase(this.baseJoinRoomsRepository);
  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>>SearchMemberRooms({tittle})async{
    return await baseJoinRoomsRepository.SearchMemberRooms(title: tittle);
  }
}