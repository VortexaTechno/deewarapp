import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_recharg_model.dart';
import 'package:ahlachat/core/network/succes_message_vip_shop_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseRechargRepository {

  Future<Either<SuccesMessageModel, SuccesMessageModel>> ExchangeDiamond({required Diamond});
  Future<Either<SuccesMessageRechargeModel, SuccesMessageRechargeModel>>  RechargeHistory({required history});
  Future<Either<SuccesMessageRechargeModel, SuccesMessageRechargeModel>>  ExchangeHistory({required history});


}
