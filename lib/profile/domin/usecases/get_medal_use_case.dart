import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetMedalUseCase{
  final BaseMyProfileRepository baseMyProfileRepository;
  GetMedalUseCase(this.baseMyProfileRepository);
  Future<Either<SuccesMessageMedalModel,SuccesMessageMedalModel>> GetMedal() async{
    return await baseMyProfileRepository.GetMedal();
  }
}