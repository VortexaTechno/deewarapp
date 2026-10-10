import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/succes_message_get_kicked_members_model.dart';
import 'package:ahlachat/core/network/succes_message_get_room_members_model.dart';
import 'package:ahlachat/core/network/succes_message_get_room_model.dart';
import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/core/network/succes_message_level_model.dart';
import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_room_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:dio/dio.dart';

abstract class BaseRoomRemoteDataSource {


  Future<SuccesMessageRoomModel>  GetRoomConst();

  Future<SuccesMessageRoomsModel>  GetRooms();
  Future<SuccesMessageJoinRoomModel>  CheckVoiceRoom();
  Future<SuccesMessageJoinRoomModel> JoinVoiceRoom({id});
  Future<SuccesMessageJoinRoomModel> EnterPasswordVoiceRoom({id,Password});


  Future<SuccesMessageModel> FollowRoom({id});
  Future<SuccesMessageModel> UnFollowRoom({id});
  Future<SuccesMessageModel> InviteToRoom({id,roomId});
  Future<SuccesMessageModel> UpdateRoomImage({required image});
  Future<SuccesMessageModel> UpdatebackgroundRoomImage({required image});
  Future<SuccesMessageModel> Updateroomname({required name});
  Future<SuccesMessageModel> Updateroomdescripe({required name});

  Future<SuccesMessageModel> LeaveVoiceRoom({required id});
  Future<SuccesMessageRoomsMembersModel>  GetMemberRooms();
  Future<SuccesMessageKickedMembersModel>  GetKickedUser();

  Future<SuccesMessageUsersModel>  SearchMemberRooms({title});

  Future<SuccesMessageModel>  KickUserRooms({id});
  Future<SuccesMessageModel>  UnKickUserRooms({id});
}


class RoomRemoteDataSource extends BaseRoomRemoteDataSource {

  @override
  Future<SuccesMessageRoomModel> GetRoomConst()async {
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetRoomConst);

    if (response.statusCode == 200) {
      return  SuccesMessageRoomModel.fromJson(response.data);
    } else {
      return  SuccesMessageRoomModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageRoomsModel> GetRooms() async{
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetVoiceRooms);

    if (response.statusCode == 200) {
      return  SuccesMessageRoomsModel.fromJson(response.data);
    } else {
      return  SuccesMessageRoomsModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageJoinRoomModel> CheckVoiceRoom() async{
    final client = await DioInstance();
    final response = await client.post(ApiConstance.CheckVoiceRoom);
     print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageJoinRoomModel.fromJson(response.data);
    } else {
      return  SuccesMessageJoinRoomModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageJoinRoomModel> JoinVoiceRoom({id})async {
    FormData formData =   FormData.fromMap({
      "room_id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.JoinVoiceRoom,data: formData);
    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageJoinRoomModel.fromJson(response.data);
    } else {
      return  SuccesMessageJoinRoomModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageJoinRoomModel> EnterPasswordVoiceRoom({id, Password}) async{
    FormData formData =   FormData.fromMap({
      "room_id":id.toString(),
      "password":Password.toString()

    });
print({
  "room_id":id.toString(),
  "password":Password.toString()

});
    final client = await DioInstance();
    final response = await client.post(ApiConstance.EnterPasswordVoiceRoom,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageJoinRoomModel.fromJson(response.data);
    } else {
      return  SuccesMessageJoinRoomModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> FollowRoom({id}) async{
    FormData formData =   FormData.fromMap({
      "room_id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.Follow_Voice_Room,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> UnFollowRoom({id}) async{
    FormData formData =   FormData.fromMap({
      "room_id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.UnFollow_Voice_Room,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> InviteToRoom({id, roomId}) async{
    FormData formData =   FormData.fromMap({
      "room_id":roomId.toString(),
      "user_id":id.toString(),
    });

    final client = await DioInstance();
    final response = await client.post(ApiConstance.Invite_For_Room,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> UpdateRoomImage({required image})async {
    FormData formData =   FormData.fromMap({
      "image":await MultipartFile.fromFile(image?.path, filename: image?.path?.split('/')?.last),
      "room_id":RoomId
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.UpdateroomImage,data: formData);
print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> UpdatebackgroundRoomImage({required image})async {
    FormData formData =   FormData.fromMap({
      "image":await MultipartFile.fromFile(image?.path, filename: image?.path?.split('/')?.last),
      "room_id":RoomId
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.UpdateBackgroundImage,data: formData);
    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> Updateroomname({required name}) async{
    FormData formData =   FormData.fromMap({
      "name":name,
      "room_id":RoomId
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.UpdateRoomname,data: formData);
    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> Updateroomdescripe({required name}) async{
    FormData formData =   FormData.fromMap({
      "describe":name,
      "room_id":RoomId
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.UpdateRoomdescribe,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> LeaveVoiceRoom({required id})async {
    FormData formData =   FormData.fromMap({
      "room_id":id
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.LeaveVoiceRoom,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageRoomsMembersModel> GetMemberRooms() async{
    FormData formData =   FormData.fromMap({
      "room_id":RoomId,
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.GetJoinMember(),data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageRoomsMembersModel.fromJson(response.data);
    } else {
      return  SuccesMessageRoomsMembersModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageUsersModel> SearchMemberRooms({title}) async{
    FormData formData =   FormData.fromMap({
      "room_id":RoomId,
      "tittle":title
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.Search_Mmeber_Room,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageUsersModel.fromJson(response.data);
    } else {
      return  SuccesMessageUsersModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> KickUserRooms({id})async {
    FormData formData =   FormData.fromMap({
      "room_id":RoomId,
      "user_id":id.toString()
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.Kick_Host,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  Future<SuccesMessageModel> UnKickUserRooms({id})async {
    FormData formData =   FormData.fromMap({
      "room_id":RoomId,
      "user_id":id.toString()
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.Un_Kick_Host,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageKickedMembersModel> GetKickedUser() async{
    FormData formData =   FormData.fromMap({
      "room_id":RoomId,
    });
    final client = await DioInstance();
    final response = await client.post(ApiConstance.Get_Kicked_Host,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageKickedMembersModel.fromJson(response.data);
    } else {
      return  SuccesMessageKickedMembersModel.fromJson(response.data);
    }
  }





}

