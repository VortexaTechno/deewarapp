import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class CheckRoomsUseCase{
  final BaseRoomRepository basereJoinRoomsRepository;
  CheckRoomsUseCase(this.basereJoinRoomsRepository);
  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>>  CheckVoiceRoom()async{
    return await basereJoinRoomsRepository.CheckVoiceRoom();
  }
}