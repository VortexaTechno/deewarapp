
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_user_profile_image_model.dart';
import 'package:ahlachat/core/network/succes_message_user_profile_model.dart';
import 'package:ahlachat/userprofile/data/datasource/use_profile_remote_data_source.dart';
import 'package:ahlachat/userprofile/domin/repository/base_user_profile_repository.dart';

import 'package:dartz/dartz.dart';


class UserProfileRepository extends BaseUsersProfileRepository {
  final BaseUserProfileRemoteDataSource baseUserRemoteDataSource;

  UserProfileRepository(this.baseUserRemoteDataSource);
  @override

  @override
  Future<Either<SuccesMessageUserProfileModel, SuccesMessageUserProfileModel>> GetUserProfile({required int id}) async{
    final result = await baseUserRemoteDataSource.GetUserProfile(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> DeleteUserImage({required int id})async {
    final result = await baseUserRemoteDataSource.DeleteImageProfile(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageUserProfileImageModel, SuccesMessageUserProfileImageModel>> UploadImageProfile({required image}) async{
    final result = await baseUserRemoteDataSource.UploadImageProfile(image:  image);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageUserProfileModel, SuccesMessageUserProfileModel>> GetUserProfileRoom({required int id}) async{
    final result = await baseUserRemoteDataSource.GetUserProfileRoom(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> FollowUser({required int id})async {
    final result = await baseUserRemoteDataSource.FollowUser(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnFollowUser({required int id}) async{
    final result = await baseUserRemoteDataSource.UnFollowUser(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

}
