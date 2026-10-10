
import 'package:ahlachat/core/network/succes_message_gifts_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/gift/domin/repository/base_gift_repository.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetGiftUseCase{
  final BasegiftRepository baseMyProfileRepository;
  GetGiftUseCase(this.baseMyProfileRepository);
  Future<Either<SuccesMessageCategoryModel,SuccesMessageCategoryModel>> GetGifts() async{
    return await baseMyProfileRepository.GetGifts();
  }
}