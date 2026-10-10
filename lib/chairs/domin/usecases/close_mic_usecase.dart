
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';

import 'package:dartz/dartz.dart';

class CloseMicUseCase{
  final BaseChairRepository baseChairRepository;
  CloseMicUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> CloseMic() async{
    return await baseChairRepository.CloseMic();
  }
}