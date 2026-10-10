import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class LogOutUseCase{
  final BaseUsersRepository baseUsersRepository;

  LogOutUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel,SuccesMessageModel>> LogOutUser()async{
    return await baseUsersRepository.LogOut();
  }

}