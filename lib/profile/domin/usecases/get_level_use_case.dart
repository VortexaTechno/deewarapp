import 'package:ahlachat/core/network/succes_message_level_model.dart';

import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';

import 'package:dartz/dartz.dart';

class GetLevelUseCase{
  final BaseMyProfileRepository baseProfileRepository;
  GetLevelUseCase(this.baseProfileRepository);
  Future<Either<SuccesMessageLevelModel, SuccesMessageLevelModel>> GetLevel()async{
    return await baseProfileRepository.GetLevel();
  }
}