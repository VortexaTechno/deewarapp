

import 'package:ahlachat/core/network/api_constance.dart';
 import 'package:ahlachat/core/network/succes_message_leaderboard_model.dart';

import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:dio/dio.dart';

abstract class BaseleaderboardRemoteDataSource {

  Future<SuccesMessageleaderboardModel>   GetDaileleaderboard();
  Future<SuccesMessageleaderboardModel>   GetWeaklyleaderboard();

}


class leaderboardRemoteDataSource extends BaseleaderboardRemoteDataSource  {


  @override
  Future<SuccesMessageleaderboardModel> GetDaileleaderboard() async{
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),

    });

    final response = await client.post(ApiConstance.Room_Day_Rank,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageleaderboardModel.fromJson(response.data);
    } else {
      return  SuccesMessageleaderboardModel.fromJson(response.data);
    }
  }
  Future<SuccesMessageleaderboardModel> GetWeaklyleaderboard() async{
    final client = await DioInstance();
    FormData formData =   FormData.fromMap({
      "room_id":RoomId.toString(),

    });

    final response = await client.post(ApiConstance.Room_Week_Rank,data: formData);
    if (response.statusCode == 200) {
      return  SuccesMessageleaderboardModel.fromJson(response.data);
    } else {
      return  SuccesMessageleaderboardModel.fromJson(response.data);
    }
  }

}

