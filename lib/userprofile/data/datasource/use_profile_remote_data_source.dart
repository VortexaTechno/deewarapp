import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/succes_message_level_model.dart';
import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_user_profile_image_model.dart';
import 'package:ahlachat/core/network/succes_message_user_profile_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:dio/dio.dart';

abstract class BaseUserProfileRemoteDataSource {


  Future<SuccesMessageUserProfileModel>  GetUserProfile({required id});
  Future<SuccesMessageUserProfileModel>  GetUserProfileRoom({required id});

  Future<SuccesMessageModel>  DeleteImageProfile({required id});

  Future<SuccesMessageUserProfileImageModel>  UploadImageProfile({required image});
  Future<SuccesMessageModel>  FollowUser({required id});
  Future<SuccesMessageModel>  UnFollowUser({required id});

}


class UserProfileRemoteDataSource extends BaseUserProfileRemoteDataSource {

  @override
  Future<SuccesMessageUserProfileModel> GetUserProfile({required id})async {

    FormData formData =   FormData.fromMap({
      "user_id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.UserProfile,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageUserProfileModel.fromJson(response.data);
    } else {
      return  SuccesMessageUserProfileModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> DeleteImageProfile({required id}) async{

    FormData formData =   FormData.fromMap({
      "id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.DeleteProfileImag,data: formData);
print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageUserProfileImageModel> UploadImageProfile({required image})async {
    FormData formData =   FormData.fromMap({
      "image":await MultipartFile.fromFile(image?.path, filename: image?.path?.split('/')?.last),
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.AddProfileImage,data: formData);
    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageUserProfileImageModel.fromJson(response.data);
    } else {
      return  SuccesMessageUserProfileImageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageUserProfileModel> GetUserProfileRoom({required id})async {

    FormData formData =   FormData.fromMap({
      "user_id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.User_Profile_Room,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageUserProfileModel.fromJson(response.data);
    } else {
      return  SuccesMessageUserProfileModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> FollowUser({required id})async {
    FormData formData =   FormData.fromMap({
      "user_id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.follow_user,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> UnFollowUser({required id}) async{
    FormData formData =   FormData.fromMap({
      "user_id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.un_follow_user,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }
}



