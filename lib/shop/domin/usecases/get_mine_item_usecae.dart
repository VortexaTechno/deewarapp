
import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';

import 'package:dartz/dartz.dart';

class GetMineItemUseCase{
  final BaseShopRepository baseMineRepository;
  GetMineItemUseCase(this.baseMineRepository);
  Future<Either<SuccesMessageMineModel, SuccesMessageMineModel>> GetMineItem()async{
    return await baseMineRepository.GetMineItemPackage();
  }
}