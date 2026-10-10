import 'package:ahlachat/core/network/succes_message_vip_shop_model.dart';
import 'package:ahlachat/vip/domin/repository/base_vip_shop_repository.dart';
import 'package:dartz/dartz.dart';

class GetVipShopUseCase{
  final BaseVipRepository baseVipRepository;
  GetVipShopUseCase(this.baseVipRepository);
  Future<Either<SuccesMessageVipShopModel, SuccesMessageVipShopModel>> GetVipShopItem()async{
    return await baseVipRepository.GetVipShop();
  }
}