import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';
class UpdateRoomImageUseCase{
  final BaseRoomRepository baseMyRoomRepository;
  UpdateRoomImageUseCase(this.baseMyRoomRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> UpdateRoomImage({image}) async{
    return await baseMyRoomRepository.UpdateRoomImage(image:image );
  }
}