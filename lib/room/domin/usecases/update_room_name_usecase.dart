import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';
class UpdateRoomnameUseCase{
  final BaseRoomRepository baseMyRoomRepository;
  UpdateRoomnameUseCase(this.baseMyRoomRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> UpdateRoomName({name}) async{
    return await baseMyRoomRepository.UpdateRoomName(name:name );
  }
}