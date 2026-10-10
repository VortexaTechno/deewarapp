import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';
class UpdateProfileImageUseCase{
  final BaseMyProfileRepository baseMyProfileRepository;
  UpdateProfileImageUseCase(this.baseMyProfileRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> UpdateProfileImage({image}) async{
    return await baseMyProfileRepository.UpdateProfileImage(image:image );
  }
}