import 'dart:io';

import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/core/network/succes_message_vip_shop_model.dart';
import 'package:ahlachat/shop/data/datasource/shop_remote_data_source.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';
import 'package:ahlachat/users/data/datasource/user_remote_data_source.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:ahlachat/vip/data/datasource/vip_shop_remote_data_source.dart';
import 'package:ahlachat/vip/data/models/VipModel.dart';
import 'package:ahlachat/vip/domin/repository/base_vip_shop_repository.dart';
import 'package:dartz/dartz.dart';


class VipRepository extends BaseVipRepository {
  final BaseVipShopRemoteDataSource baseVipRemoteDataSource;

  VipRepository(this.baseVipRemoteDataSource);



  @override
  Future<Either<SuccesMessageVipShopModel, SuccesMessageVipShopModel>> GetVipShop()async {
    final result = await baseVipRemoteDataSource.GetVipPackages();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> BuyVip({required id}) async{
    final result = await baseVipRemoteDataSource.BuyVip(ID: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UseVip({required id}) async{
    final result = await baseVipRemoteDataSource.UseVip(ID: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> RemoveVip({required id}) async{
    final result = await baseVipRemoteDataSource.UseVip(ID: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }







}
