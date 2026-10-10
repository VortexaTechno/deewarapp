
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';

import 'package:dartz/dartz.dart';

class LeaveChairAdminUseCase{
  final BaseChairRepository baseChairRepository;
  LeaveChairAdminUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> LeaveChairAdmin({index,id}) async{
    return await baseChairRepository.LeaveChairAdmin(id:id,index: index );
  }
}