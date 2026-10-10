
import 'package:ahlachat/core/network/succes_message_recharg_model.dart';
import 'package:ahlachat/recharge/domin/repository/base_recharge_repository.dart';
import 'package:dartz/dartz.dart';

class RechargeHistoryUseCase{
  final BaseRechargRepository baserechargRepository;
  RechargeHistoryUseCase(this.baserechargRepository);
  Future<Either<SuccesMessageRechargeModel, SuccesMessageRechargeModel>>  RechargeHistory({required history})async{
    return await baserechargRepository.RechargeHistory(history:   history);
  }
}