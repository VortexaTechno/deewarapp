import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';
class SubmitFeedbackUseCase{
  final BaseMyProfileRepository baseMyProfileRepository;
  SubmitFeedbackUseCase(this.baseMyProfileRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> SubmitFeed({required describe,required content}) async{
    return await baseMyProfileRepository.SubmitFeedBack(describe: describe, content: content);
  }
}