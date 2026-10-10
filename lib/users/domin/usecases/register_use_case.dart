import 'dart:io';

import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  final BaseUsersRepository baseUsersRepository;

  RegisterUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel, SuccesMessageModel>> Register(
      {required String PhoneNumber, required String Password, required int sex, required String name, required String Country, required String date, required String flag,required String description,required String Code,required File image}) async {
    return await baseUsersRepository.Register(Country: Country,
        description: description,
        Password: Password,
        sex: sex,
        name: name,
        Flag: flag,
        dates: date,
        PhoneNumber: PhoneNumber,Code: Code,image:image );
  }
}