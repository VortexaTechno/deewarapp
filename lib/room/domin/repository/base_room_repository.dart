 import 'package:ahlachat/core/network/succes_message_get_kicked_members_model.dart';
import 'package:ahlachat/core/network/succes_message_get_room_members_model.dart';
import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/network/succes_message_get_room_model.dart';
import '../../../core/network/succes_message_room_model.dart';

abstract class BaseRoomRepository {

  Future<Either<SuccesMessageRoomModel, SuccesMessageRoomModel>> GetRoomConst();
  Future<Either<SuccesMessageRoomsModel, SuccesMessageRoomsModel>> GetRooms();
  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>> CheckVoiceRoom();
  Future<Either<SuccesMessageRoomsMembersModel, SuccesMessageRoomsMembersModel>> GetMemberRooms();
  Future<Either<SuccesMessageKickedMembersModel, SuccesMessageKickedMembersModel>> GetKickRooms();



  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>> SearchMemberRooms({title});


  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>> JoinVoiceRoom({id});
  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>> EnterVoiceRoomPassword({id,password});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> FollowRoom({id});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnFollowRoom({id});


  Future<Either<SuccesMessageModel, SuccesMessageModel>> InviteToRoom({id,roomId});
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UpdateRoomImage({required image});
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UpdatebackgroundRoomImage({required image});

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UpdateRoomName({required name});

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UpdateRoomdescripe({required name});



  Future<Either<SuccesMessageModel, SuccesMessageModel>> LeaveVoiceRoom({id});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> KickUserRooms({id});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnkickUserRooms({id});


}
