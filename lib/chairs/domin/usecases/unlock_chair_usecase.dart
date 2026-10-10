import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:dartz/dartz.dart';
class UnLockChairUseCase{
  final BaseChairRepository baseChairRepository;
  UnLockChairUseCase(this.baseChairRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> UnLockChair({index,id}) async{
    return await baseChairRepository.UnLockChair(id:id,index: index );
  }
}