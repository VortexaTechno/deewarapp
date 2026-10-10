import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';

class FirebaseGoogleUserAuthUseCase{
  final BaseUsersRepository baseUsersRepository;

  FirebaseGoogleUserAuthUseCase(this.baseUsersRepository);

  Future<Either<SuccesMessageModel,SuccesMessageModel>> FirebaseGoogleUserAuth()async{
    return await baseUsersRepository.FirebaseGoogleUserAuth( );
  }

}