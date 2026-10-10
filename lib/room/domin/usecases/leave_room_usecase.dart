import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class LeaveRoomsUseCase{
  final BaseRoomRepository baseLeaveRoomsRepository;
  LeaveRoomsUseCase(this.baseLeaveRoomsRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>> LeaveVoiceRoom({id})async{
    return await baseLeaveRoomsRepository.LeaveVoiceRoom(id: id);
  }
}