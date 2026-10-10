
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';

import 'package:dartz/dartz.dart';

class GetFriendsUseCase{
  final BaseMyProfileRepository baseProfileRepository;
  GetFriendsUseCase(this.baseProfileRepository);
  Future<Either<SuccesMessageUsersModel,SuccesMessageUsersModel>> GetFriendsUse()async{
    return await baseProfileRepository.GetFriends();
  }
}