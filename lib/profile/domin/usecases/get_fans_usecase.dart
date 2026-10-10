
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetFanUseCase{
  final BaseMyProfileRepository baseMyProfileRepository;
  GetFanUseCase(this.baseMyProfileRepository);
  Future<Either<SuccesMessageUsersModel,SuccesMessageUsersModel>> GetFan() async{
    return await baseMyProfileRepository.GetFan();
  }
}