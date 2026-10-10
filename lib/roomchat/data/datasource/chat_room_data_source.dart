import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_get_Inbox_Room_model.dart';
import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/users/data/models/FireBaseGoogleModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseChatRoomDataSource {

  Future<SuccesMessageModel>  SendMessage({required String tittle});


  Future<SuccesMessageInboxModel>  GetInbox();

}


class ChatRoomRemoteDataSource extends BaseChatRoomDataSource {
  @override
  Future<SuccesMessageModel> SendMessage({required String tittle})async {
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),
      "tittle":tittle.toString(),

    });

    final response = await client.post(ApiConstance.Send_Message_To_Room,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageInboxModel> GetInbox() async{
    final client = await DioInstance();

    final response = await client.post(ApiConstance.Get_Inbox_Room );
    if (response.statusCode == 200) {
      return  SuccesMessageInboxModel.fromJson(response.data);
    } else {
      return  SuccesMessageInboxModel.fromJson(response.data);
    }
  }


}

