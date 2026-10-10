import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:dartz/dartz.dart';

import '../repository/base_users_repository.dart';

class AddPhoneAccountCodeUseCase{
  final BaseUsersRepository baseUsersRepository;
  AddPhoneAccountCodeUseCase(this.baseUsersRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> AddPhoneAccount(
      {required String PhoneNumber,required String Password,required String Code})async{
    return await baseUsersRepository.AddPhoneAccount(Password:Password,PhoneNumber:PhoneNumber,Code:Code);
  }
}