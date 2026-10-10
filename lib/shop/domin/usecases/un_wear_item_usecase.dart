import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';
import 'package:dartz/dartz.dart';

class UnWearItemUseCase {
  final BaseShopRepository baseShopRepository;

  UnWearItemUseCase(this.baseShopRepository);

  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnWearItem(
      {required int SalesId}) async {
    return await baseShopRepository.UnWearItem(SalesId: SalesId);
  }
}