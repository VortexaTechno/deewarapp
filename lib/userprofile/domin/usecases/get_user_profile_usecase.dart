import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_user_profile_model.dart';
import 'package:ahlachat/userprofile/domin/repository/base_user_profile_repository.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserProfileUseCase{
  final BaseUsersProfileRepository baseUsersRepository;

  GetUserProfileUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageUserProfileModel,SuccesMessageUserProfileModel>> GetUserProfile(
      {required int id})async{
    return await baseUsersRepository.GetUserProfile(id:id  );
  }

}