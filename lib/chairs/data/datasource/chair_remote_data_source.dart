import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/succes_message_get_emoje_model.dart';
import 'package:ahlachat/core/network/succes_message_level_model.dart';
import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:dio/dio.dart';

abstract class BaseChairRemoteDataSource {


  Future<SuccesMessageModel>   LockChair({id,index});
  Future<SuccesMessageModel>   UnLockChair({id,index});

  Future<SuccesMessageModel>   JoinChair({id,index});
  Future<SuccesMessageModel>   LeaveChair({id,index});

  Future<SuccesMessageModel>   LeaveChairAdmin({id,index});

  Future<SuccesMessageModel>   CloseMic();
  Future<SuccesMessageModel>   OpenMic();

  Future<SuccesMessageModel>   SendEmoje({tittle});
  Future<SuccesMessageEmojesModel>   GetEmoje();
}


class ChairRemoteDataSource extends BaseChairRemoteDataSource {
  @override
  Future<SuccesMessageModel> LockChair({id, index}) async{

    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),
      "index":index.toString(),
      "id":id
    });

    final response = await client.post(ApiConstance.lock_Chair,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> UnLockChair({id, index}) async{
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),
      "index":index.toString(),
      "id":id
    });

    final response = await client.post(ApiConstance.Un_lock_Chair,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> JoinChair({id, index})async {
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),
      "index":index.toString(),
      "id":id
    });

    final response = await client.post(ApiConstance.Take_Seat_Chair,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> LeaveChair({id, index})async {
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),
      "index":index.toString(),
      "id":id
    });

    final response = await client.post(ApiConstance.Leave_Seat_Chair,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> CloseMic() async{
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),

      "id":JoinChairId.toString()
    });

    final response = await client.post(ApiConstance.Close_Mic_Chair,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> OpenMic()async {
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),

      "id":JoinChairId.toString()
    });

    final response = await client.post(ApiConstance.Open_Mic_Chair,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> SendEmoje({tittle})async {
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),
      "tittle":tittle.toString(),
      "id":JoinChairId.toString()
    });

    final response = await client.post(ApiConstance.Emoje_Call,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageEmojesModel> GetEmoje() async{
    final client = await DioInstance();

    final response = await client.post(ApiConstance.Get_All_Emoje);
    if (response.statusCode == 200) {
      return  SuccesMessageEmojesModel.fromJson(response.data);
    } else {
      return  SuccesMessageEmojesModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> LeaveChairAdmin({id, index}) async{
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),
      "index":index.toString(),
      "id":id
    });

    final response = await client.post(ApiConstance.Leave_Seat_Chair_admin,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }

  }



}

