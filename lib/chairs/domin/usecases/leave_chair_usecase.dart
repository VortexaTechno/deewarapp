
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';

import 'package:dartz/dartz.dart';

class LeaveChairUseCase{
  final BaseChairRepository baseChairRepository;
  LeaveChairUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> LeaveChair({index,id}) async{
    return await baseChairRepository.LeaveChair(id:id,index: index );
  }
}