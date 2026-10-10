
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_vip_shop_model.dart';
import 'package:ahlachat/vip/data/models/VipModel.dart';
import 'package:dartz/dartz.dart';

abstract class BaseVipRepository {

  Future<Either<SuccesMessageVipShopModel, SuccesMessageVipShopModel>> GetVipShop();
  Future<Either<SuccesMessageModel, SuccesMessageModel>> BuyVip({required  id});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UseVip({required  id});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> RemoveVip({required  id});


}
