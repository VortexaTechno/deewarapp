import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class GoogleUserAuthUseCase{
  final BaseUsersRepository baseUsersRepository;

  GoogleUserAuthUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel,SuccesMessageModel>> GoogleAuth(
      { required String email, required String GoogleId,required String sex,required String  name})async{
    return await baseUsersRepository.GoogleAuth(email:email,GoogleId:GoogleId,sex: sex,name:  name );
  }

}