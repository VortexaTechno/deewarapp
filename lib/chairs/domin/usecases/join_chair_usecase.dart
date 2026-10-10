
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';

import 'package:dartz/dartz.dart';

class JoinChairUseCase{
  final BaseChairRepository baseChairRepository;
  JoinChairUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> JoinChair({index,id}) async{
    return await baseChairRepository.JoinChair(id:id,index: index );
  }
}