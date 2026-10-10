
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';

import 'package:dartz/dartz.dart';

class LockChairUseCase{
  final BaseChairRepository baseChairRepository;
  LockChairUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> LockChair({index,id}) async{
    return await baseChairRepository.LockChair(id:id,index: index );
  }
}