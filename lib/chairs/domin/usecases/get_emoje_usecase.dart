
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_get_emoje_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';

import 'package:dartz/dartz.dart';

class GetEmojeUseCase{
  final BaseChairRepository baseChairRepository;
  GetEmojeUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageEmojesModel,SuccesMessageEmojesModel>> GetEmojes() async{
    return await baseChairRepository.GetEmoje();
  }
}