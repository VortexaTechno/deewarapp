import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class EnterLoginCodeUseCase{
  final BaseUsersRepository baseUsersRepository;
  EnterLoginCodeUseCase(this.baseUsersRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> EnterLoginCode(
      {required String PhoneNumber,required String Password,required String Code})async{
       return await baseUsersRepository.EnterCodeLogin(Password:Password ,PhoneNumber:PhoneNumber,Code:Code  );
  }
}