import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';
class UpdateRoombackgroundImageUseCase{
  final BaseRoomRepository baseMyRoomRepository;
  UpdateRoombackgroundImageUseCase(this.baseMyRoomRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> UpdatebackgroundRoomImage({image}) async{
    return await baseMyRoomRepository.UpdatebackgroundRoomImage(image:image );
  }
}