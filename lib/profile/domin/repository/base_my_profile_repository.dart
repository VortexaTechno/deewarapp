
import 'package:ahlachat/core/network/succes_message_level_model.dart';
import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMyProfileRepository {

  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>>   GetFriends();
  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>>   GetMoreFriends();

  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>>   GetFollowed();
  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>>   GetFan();
  Future<Either<SuccesMessageMedalModel, SuccesMessageMedalModel>>   GetMedal();
  Future<Either<SuccesMessageLevelModel, SuccesMessageLevelModel>>   GetLevel();
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UpdateProfileImage({required image});

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   SubmitFeedBack({required describe,required content});
  Future<Either<SuccesMessageModel,SuccesMessageModel>> UpdateProfile({required name, required Signature,required Flag, required Country,required date});
}
