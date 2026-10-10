import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/users/data/models/FireBaseGoogleModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseShopRemoteDataSource {

  Future<SuccesMessageShopModel>  GetPackages();
  Future<SuccesMessageMineModel>  GetMineItemPackage();

  Future<SuccesMessageShopModel>  ByeItem({required int ItemId});
  Future<SuccesMessageShopModel>  SendItem({required int ItemId,required int UserId});
  Future<SuccesMessageModel>  WearItem({required int SalesId});
  Future<SuccesMessageModel>  UnWearItem({required int SalesId});
}


class ShopRemoteDataSource extends BaseShopRemoteDataSource {

  @override
  Future<SuccesMessageShopModel> GetPackages() async{
    final client = await DioInstance();

    final response = await client.post(ApiConstance.GetShopPackages);

    if (response.statusCode == 200) {
      return  SuccesMessageShopModel.fromJson(response.data);
    } else {
      return  SuccesMessageShopModel.fromJson(response.data);


    }
  }

  Future<SuccesMessageShopModel> ByeItem({required int ItemId}) async{
    FormData formData =   FormData.fromMap({
   "item_id":ItemId.toString()
    });
    final client = await DioInstance();

    final response = await client.post(ApiConstance.PurchaseItem,data:formData );

    if (response.statusCode == 200) {
      return  SuccesMessageShopModel.fromJson(response.data);
    } else {
      return  SuccesMessageShopModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageShopModel> SendItem({required int ItemId, required int UserId}) async{
    FormData formData =   FormData.fromMap({
      "item_id":ItemId.toString(),
      "user_id":UserId.toString()
    });
    final client = await DioInstance();

    final response = await client.post(ApiConstance.SendItem,data:formData );

    if (response.statusCode == 200) {
      return  SuccesMessageShopModel.fromJson(response.data);
    } else {
      return  SuccesMessageShopModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageMineModel> GetMineItemPackage() async{
    final client = await DioInstance();

    final response = await client.post(ApiConstance.GetMineItemPackages);

    if (response.statusCode == 200) {
      return  SuccesMessageMineModel.fromJson(response.data);
    } else {
      return  SuccesMessageMineModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageModel> WearItem({required int SalesId}) async{
    FormData formData =   FormData.fromMap({
      "sales_id":SalesId.toString(),
    });
    final client = await DioInstance();

    final response = await client.post(ApiConstance.WearItem,data:formData );

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageModel> UnWearItem({required int SalesId})async {
    FormData formData =   FormData.fromMap({
      "sales_id":SalesId.toString(),
    });
    final client = await DioInstance();

    final response = await client.post(ApiConstance.UnWearItem,data:formData );

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }
  }




}

