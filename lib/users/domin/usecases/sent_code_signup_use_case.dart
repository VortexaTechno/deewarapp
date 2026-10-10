
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class SentCodeForSignupUseCase{
  final BaseUsersRepository baseUsersRepository;

  SentCodeForSignupUseCase(this.baseUsersRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> SentCodeSignup(
      {required String PhoneNumber})async{
    return await baseUsersRepository.SentCodeForSignup(PhoneNumber:PhoneNumber);
  }

}