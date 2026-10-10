import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/vip/domin/repository/base_vip_shop_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveVipUseCase{
  final BaseVipRepository baseVipRepository;
  RemoveVipUseCase(this.baseVipRepository);
  Future<Either<SuccesMessageModel, SuccesMessageModel>>  RemoveVip({required id})async{
    return await baseVipRepository.RemoveVip(id:   id);
  }
}