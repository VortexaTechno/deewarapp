import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class SendCodeAgainUseCase{
  final BaseUsersRepository baseUsersRepository;

  SendCodeAgainUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel,SuccesMessageModel>> SendCodeagain(
      {required String PhoneNumber,required String Password})async{
    return await baseUsersRepository.SendCodeAgain(Password:Password ,PhoneNumber:PhoneNumber);
  }

}