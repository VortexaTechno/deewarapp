import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/succes_message_level_model.dart';
import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:dio/dio.dart';

abstract class BaseMyProfileRemoteDataSource {

  //GetFriendsUse
  Future<SuccesMessageUsersModel>  GetFriendsUse();
  Future<SuccesMessageUsersModel>  GetMoreFriends();


  Future<SuccesMessageUsersModel>  GetFollowed();
  Future<SuccesMessageUsersModel>  GetFans();
  Future<SuccesMessageMedalModel>  GetMedals();
  Future<SuccesMessageLevelModel> GetLevel();
  Future<SuccesMessageModel> SubmitFeedBack({required describe, required content});
  Future<SuccesMessageModel> UpdateProfileImage({required image});
  Future<SuccesMessageModel> UpdateProfile({required name, required Signature,required Flag, required Country,required date});
}


class MyProfileRemoteDataSource extends BaseMyProfileRemoteDataSource {

  @override
  Future<SuccesMessageUsersModel> GetFriendsUse()async {
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetMyFriend);

    if (response.statusCode == 200) {
      return  SuccesMessageUsersModel.fromJson(response.data);
    } else {
      return  SuccesMessageUsersModel.fromJson(response.data);
    }
  }
  @override
  Future<SuccesMessageUsersModel> GetMoreFriends()async {
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetMoreMyFriend+'?page=${FollowNextPage.toString()}');
    if (response.statusCode == 200) {
      return  SuccesMessageUsersModel.fromJson(response.data);
    } else {
      return  SuccesMessageUsersModel.fromJson(response.data);
    }
  }
  @override
  Future<SuccesMessageUsersModel> GetFollowed()async {
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetMyFollowed);
    if (response.statusCode == 200) {
      return  SuccesMessageUsersModel.fromJson(response.data);
    } else {
      return  SuccesMessageUsersModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageUsersModel> GetFans() async{
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetMyFan);
    if (response.statusCode == 200) {
      return  SuccesMessageUsersModel.fromJson(response.data);
    } else {
      return  SuccesMessageUsersModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageMedalModel> GetMedals() async{
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetMedal);
    if (response.statusCode == 200) {
      return  SuccesMessageMedalModel.fromJson(response.data);
    } else {
      return  SuccesMessageMedalModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageLevelModel> GetLevel() async{
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetLevel);

    if (response.statusCode == 200) {
      return  SuccesMessageLevelModel.fromJson(response.data);
    } else {
      return  SuccesMessageLevelModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> SubmitFeedBack({required describe, required content})async {

    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "contact":content.toString(),
      "describe":describe.toString()
    });

    final response = await client.post(ApiConstance.SubmitFeedBack,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> UpdateProfileImage({required image})async {
    FormData formData =   FormData.fromMap({
      "image":await MultipartFile.fromFile(image?.path, filename: image?.path?.split('/')?.last),
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.UpdateProfileImage,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> UpdateProfile({required name, required Signature,required Flag, required Country,required date}) async{
    var  map={
      "name":name,
      "Flag":Flag,
      "Country":Country,
      "descript":Signature,
      "dates":date
    };
    print(map);
    map.removeWhere((key, value) => key == null || value == null||value=='');
    FormData formData = new FormData.fromMap(map);

    final client = await DioInstance();
    final response = await client.post(ApiConstance.UpdateProfile,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }



}

