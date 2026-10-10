
import 'package:ahlachat/core/network/succes_message_gifts_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/gift/domin/repository/base_gift_repository.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';

class SendGiftUseCase{
  final BasegiftRepository baseGiftRepository;
  SendGiftUseCase(this.baseGiftRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> SentGift({required Giftid,required Quen,required User_ID}) async{
    return await baseGiftRepository.SentGifts(Giftid:Giftid,Quen: Quen,User_ID: User_ID );
  }
}