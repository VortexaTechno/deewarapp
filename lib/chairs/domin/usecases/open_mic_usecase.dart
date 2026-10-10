
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';

import 'package:dartz/dartz.dart';

class OpenMicUseCase{
  final BaseChairRepository baseChairRepository;
  OpenMicUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>>  OpenMic() async{
    return await baseChairRepository.OpenMic(  );
  }
}