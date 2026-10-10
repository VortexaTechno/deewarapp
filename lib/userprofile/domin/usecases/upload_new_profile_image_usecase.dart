
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_user_profile_image_model.dart';
import 'package:ahlachat/userprofile/domin/repository/base_user_profile_repository.dart';
import 'package:dartz/dartz.dart';

class UploadImageProfileUseCase{
  final BaseUsersProfileRepository baseUsersRepository;

  UploadImageProfileUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageUserProfileImageModel,SuccesMessageUserProfileImageModel>>  UploadImageProfile(
      {required image})async{
    return await baseUsersRepository. UploadImageProfile(image: image, );
  }

}