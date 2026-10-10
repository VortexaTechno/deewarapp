import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/error/failure.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_user_profile_image_model.dart';
import 'package:ahlachat/core/network/succes_message_user_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUsersProfileRepository {

  Future<Either<SuccesMessageUserProfileModel, SuccesMessageUserProfileModel>>   GetUserProfile({required int id});
  Future<Either<SuccesMessageUserProfileModel, SuccesMessageUserProfileModel>>   GetUserProfileRoom({required int id});

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   FollowUser({required int id});
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UnFollowUser({required int id});
  //MyProfile
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   DeleteUserImage({required int id});
  Future<Either<SuccesMessageUserProfileImageModel, SuccesMessageUserProfileImageModel>>   UploadImageProfile({required image});




}
