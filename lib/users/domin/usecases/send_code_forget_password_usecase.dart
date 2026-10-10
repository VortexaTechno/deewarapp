
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class SendForgetPasswordUseCase{
  final BaseUsersRepository baseUsersRepository;

  SendForgetPasswordUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel,SuccesMessageModel>> SendCodeForgetPassword(
      {required String PhoneNumber})async{
    return await baseUsersRepository.SendCodeForgetPassword(PhoneNumber:PhoneNumber);
  }

}