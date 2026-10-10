import 'package:ahlachat/core/error/failure.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUserPhoneUseCase{
final BaseUsersRepository baseUsersRepository;

LoginUserPhoneUseCase(this.baseUsersRepository);

Future<Either<SuccesMessageModel,SuccesMessageModel>> LoginByPhoneNum(
    {required String PhoneNumber,required String Password})async{
  return await baseUsersRepository.LoginByPhoneNum(PhoneNumber:PhoneNumber,Password: Password );
}

}