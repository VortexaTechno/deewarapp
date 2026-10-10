
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';

import 'package:dartz/dartz.dart';

class SendEmojeUseCase{
  final BaseChairRepository baseChairRepository;
  SendEmojeUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> SendEmoje({tittle}) async{
    return await baseChairRepository.SendEmoje(tittle:tittle  );
  }
}