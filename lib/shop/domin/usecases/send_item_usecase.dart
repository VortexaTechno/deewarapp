
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';

import 'package:dartz/dartz.dart';

class SendItemUseCase{
  final BaseShopRepository baseShopRepository;
  SendItemUseCase(this.baseShopRepository);
  Future<Either<SuccesMessageShopModel, SuccesMessageShopModel>> SendItem(
      {required int ItemId,required int Userid})async{
    return await baseShopRepository.SendItem(ItemId: ItemId,Userid: Userid);
  }
}