import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';
class UpdateRoomdescripeUseCase{
  final BaseRoomRepository baseMyRoomRepository;
  UpdateRoomdescripeUseCase(this.baseMyRoomRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> UpdateRoomescripe({name}) async{
    return await baseMyRoomRepository.UpdateRoomdescripe(name:name );
  }
}