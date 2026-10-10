import 'package:ahlachat/core/network/succes_message_level_model.dart';
import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/profile/data/datasource/my_profile_remote_data_source.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';


class MyProfileRepository extends BaseMyProfileRepository {
  final BaseMyProfileRemoteDataSource baseProfileRemoteDataSource;

  MyProfileRepository(this.baseProfileRemoteDataSource);

  @override
  Future<Either<SuccesMessageUsersModel,SuccesMessageUsersModel>> GetFriends() async{
    final result = await baseProfileRemoteDataSource.GetFriendsUse();

    if(result.statusCode==true){
      FollowNextPage=FollowNextPage+1;
      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }

  }
  @override
  Future<Either<SuccesMessageUsersModel,SuccesMessageUsersModel>> GetMoreFriends() async{
    final result = await baseProfileRemoteDataSource.GetMoreFriends();

    if(result.statusCode==true){
      FollowNextPage=FollowNextPage+1;
      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }

  }

  @override
  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>> GetFollowed()async {
    final result = await baseProfileRemoteDataSource.GetFollowed();

    if(result.statusCode==true){
      FollowNextPage=FollowNextPage+1;
      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }
  }
  @override
  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>> GetFan()async {
    final result = await baseProfileRemoteDataSource.GetFans();

    if(result.statusCode==true){
      FollowNextPage=FollowNextPage+1;
      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }

  }

  @override
  Future<Either<SuccesMessageMedalModel, SuccesMessageMedalModel>> GetMedal() async{
    final result = await baseProfileRemoteDataSource.GetMedals();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageLevelModel, SuccesMessageLevelModel>> GetLevel() async{
    final result = await baseProfileRemoteDataSource.GetLevel();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SubmitFeedBack({required describe, required content})async {
    final result = await baseProfileRemoteDataSource.SubmitFeedBack(content:content,describe: describe );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UpdateProfileImage({required image})async {
    final result = await baseProfileRemoteDataSource.UpdateProfileImage( image: image );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UpdateProfile({required name, required Signature,required Flag, required Country,required date}) async{
    final result = await baseProfileRemoteDataSource.UpdateProfile(name:name ,Country: Country,Flag: Flag,Signature: Signature,date:date );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      FollowNextPage=1;
      return Left(result);
    }
  }




}
