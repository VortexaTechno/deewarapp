
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';

import 'package:dartz/dartz.dart';

class GetShopPackageUseCase{
  final BaseShopRepository baseShopRepository;
  GetShopPackageUseCase(this.baseShopRepository);
  Future<Either<SuccesMessageShopModel, SuccesMessageShopModel>> GetPackage()async{
    return await baseShopRepository.GetShopPackage();
  }
}