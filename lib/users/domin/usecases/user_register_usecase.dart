
import 'dart:io';

import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterNewAccountUseCase{
  final BaseUsersRepository baseUsersRepository;

  RegisterNewAccountUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel,SuccesMessageModel>> RegisterAccount(
      {required String PhoneNumber,required String Password,required String name,required File image,required String description,required String Flag,required String Country,required String dates,required int sex,required String Code})async{
    return await baseUsersRepository.Register(image: image,Country:Country ,Password:Password,name:name,PhoneNumber:PhoneNumber,dates: dates,Flag: Flag,sex: sex ,description:description,Code: Code  );
  }

}