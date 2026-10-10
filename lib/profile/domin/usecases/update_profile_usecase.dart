import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase{
  final BaseMyProfileRepository baseMyProfileRepository;
  UpdateProfileUseCase(this.baseMyProfileRepository);
  Future<Either<SuccesMessageModel,SuccesMessageModel>> UpdateProfile({name,Signature,Flag,Country,date}) async{
    return await baseMyProfileRepository.UpdateProfile(name:name ,date: date, Signature:Signature,Flag: Flag,Country: Country, );
  }
}