import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_recharg_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/users/data/models/FireBaseGoogleModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseRechargeRemoteDataSource {

  Future<SuccesMessageShopModel>  GetRechargePackages();
  Future<SuccesMessageModel> ExchangeDiamond({required Diamond});
  Future<SuccesMessageRechargeModel> RechargeHistory({required history});
  Future<SuccesMessageRechargeModel> ExchangeHistory({required history});

}


class RechargeRemoteDataSource extends BaseRechargeRemoteDataSource {

  @override
  Future<SuccesMessageShopModel> GetRechargePackages() async{


    final client = await DioInstance();

    final response = await client.post(ApiConstance.GetShopPackages);

    if (response.statusCode == 200) {
      return  SuccesMessageShopModel.fromJson(response.data);
    } else {
      return  SuccesMessageShopModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageModel> ExchangeDiamond({required Diamond})async {
    FormData formData =   FormData.fromMap({
      "beans":Diamond.toString()
    });
    final client = await DioInstance();

    final response = await client.post(ApiConstance.Exchangbeans,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageRechargeModel> RechargeHistory({required history}) async{
    print({
      "date":history.toString()
    });
    FormData formData =   FormData.fromMap({
      "date":history.toString()
    });
    final client = await DioInstance();

    final response = await client.post(ApiConstance.SearchForCharge,data: formData);

    if (response.statusCode == 200) {
      return  SuccesMessageRechargeModel.fromJson(response.data);
    } else {
      return  SuccesMessageRechargeModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageRechargeModel> ExchangeHistory({required history}) async{
    print({
      "date":history.toString()
    });
    FormData formData =   FormData.fromMap({
      "date":history.toString()
    });
    final client = await DioInstance();

    final response = await client.post(ApiConstance.SearchForExchange,data: formData);
    print('response.dataresponse.dataresponse.data');
print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageRechargeModel.fromJson(response.data);
    } else {
      return  SuccesMessageRechargeModel.fromJson(response.data);


    }
  }



}

