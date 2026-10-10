

import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/succes_message_gifts_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:dio/dio.dart';

abstract class BasegiftRemoteDataSource {

  Future<SuccesMessageCategoryModel>   GetGift();
  Future<SuccesMessageModel>   SentGift({Giftid,Quen,User_ID});

}


class giftRemoteDataSource extends BasegiftRemoteDataSource  {
  @override
  Future<SuccesMessageCategoryModel> GetGift() async{

    final client = await DioInstance();
    final response = await client.get(ApiConstance.GetCagift );
    if (response.statusCode == 200) {
      return  SuccesMessageCategoryModel.fromJson(response.data);
    } else {
      return  SuccesMessageCategoryModel.fromJson(response.data);
    }
  }

  @override
  Future<SuccesMessageModel> SentGift({Giftid,Quen,User_ID}) async{
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),
      "G_id":Giftid.toString(),
      "user_id":User_ID.toString(),
      "quan":Quen.toString()

    });

    final response = await client.post(ApiConstance.Sent_Gift,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);
    }
  }

}

