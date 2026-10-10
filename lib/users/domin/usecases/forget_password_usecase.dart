import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase{
  final BaseUsersRepository baseUsersRepository;

  ForgetPasswordUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel,SuccesMessageModel>> ForgetPassword(
      {required String PhoneNumber,required String Code})async{
    return await baseUsersRepository.ForgetPassword(PhoneNumber:PhoneNumber,Code: Code);
  }
}