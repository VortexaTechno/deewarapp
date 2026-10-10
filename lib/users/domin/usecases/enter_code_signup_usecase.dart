import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class EnterSignupCodeUseCase{
  final BaseUsersRepository baseUsersRepository;
  EnterSignupCodeUseCase(this.baseUsersRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> EnterSignupCode(
      {required String PhoneNumber,required String Password,required String Code})async{
    return await baseUsersRepository.EnterCodeSignup(Password:Password,PhoneNumber:PhoneNumber,Code:Code);
  }
}