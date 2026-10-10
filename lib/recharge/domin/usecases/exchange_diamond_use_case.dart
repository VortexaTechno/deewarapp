import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/recharge/domin/repository/base_recharge_repository.dart';
import 'package:dartz/dartz.dart';

class ExchangeDiamondUseCase{
  final BaseRechargRepository baserechargRepository;
  ExchangeDiamondUseCase(this.baserechargRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>>  ExchangeDiamond({required Diamond})async{
    return await baserechargRepository.ExchangeDiamond(Diamond:   Diamond);
  }
}