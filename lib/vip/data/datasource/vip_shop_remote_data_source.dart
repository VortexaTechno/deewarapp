import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/core/network/succes_message_vip_shop_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/users/data/models/FireBaseGoogleModel.dart';
import 'package:ahlachat/vip/data/models/VipModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseVipShopRemoteDataSource {

  Future<SuccesMessageVipShopModel>  GetVipPackages();
  Future<SuccesMessageModel>  BuyVip({required ID});
  Future<SuccesMessageModel> UseVip({required ID});
  Future<SuccesMessageModel> RemoveVip({required ID});
}


class VipRemoteDataSource extends BaseVipShopRemoteDataSource {


  @override
  Future<SuccesMessageVipShopModel> GetVipPackages() async{
    final client = await DioInstance();

    final response = await client.post(ApiConstance.GetVipShopPackage);

    if (response.statusCode == 200) {
      return  SuccesMessageVipShopModel.fromJson(response.data);
    } else {
      return  SuccesMessageVipShopModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageModel> BuyVip({required ID})async {

    FormData formData =   FormData.fromMap({
      "vip_id":ID.toString()
    });

    final client = await DioInstance();

    final response = await client.post(ApiConstance.BuyVipSPackage,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageModel> UseVip({required ID})async {
    FormData formData =   FormData.fromMap({
      "sales_id":ID.toString()
    });

    final client = await DioInstance();

    final response = await client.post(ApiConstance.UseVip,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageModel> RemoveVip({required ID}) async{
    FormData formData =   FormData.fromMap({
      "sales_id":ID.toString()
    });

    final client = await DioInstance();

    final response = await client.post(ApiConstance.RemoveVip,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }
  }




}

