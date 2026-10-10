
import 'package:ahlachat/core/network/succes_message_recharg_model.dart';
import 'package:ahlachat/recharge/domin/repository/base_recharge_repository.dart';
import 'package:dartz/dartz.dart';

class ExchangeHistoryUseCase{
  final BaseRechargRepository baserechargRepository;
  ExchangeHistoryUseCase(this.baserechargRepository);
  Future<Either<SuccesMessageRechargeModel, SuccesMessageRechargeModel>>  ExchangeHistory({required history})async{
    return await baserechargRepository.ExchangeHistory(history:   history);
  }
}