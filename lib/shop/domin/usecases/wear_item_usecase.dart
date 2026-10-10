import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';
import 'package:dartz/dartz.dart';

class WearItemUseCase{
  final BaseShopRepository baseShopRepository;
  WearItemUseCase(this.baseShopRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>> WearItem(
      {required int SalesId}) async{
    return await baseShopRepository.WearItem(SalesId:SalesId);
  }
}