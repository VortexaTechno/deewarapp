import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class UnBinnedPhoneUseCase{
  final BaseUsersRepository baseUsersRepository;

  UnBinnedPhoneUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel,SuccesMessageModel>> UnBinned()async{
    return await baseUsersRepository.UnBinned();
  }

}