import 'dart:io';

import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/shop/data/datasource/shop_remote_data_source.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';
import 'package:ahlachat/users/data/datasource/user_remote_data_source.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';


class ShopRepository extends BaseShopRepository {
  final BaseShopRemoteDataSource baseShopRemoteDataSource;

  ShopRepository(this.baseShopRemoteDataSource);


  @override
  Future<Either<SuccesMessageShopModel, SuccesMessageShopModel>> GetShopPackage() async{
    final result = await baseShopRemoteDataSource.GetPackages();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageShopModel, SuccesMessageShopModel>> BuyItem({required int ItemId}) async{
    final result = await baseShopRemoteDataSource.ByeItem(ItemId: ItemId);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageShopModel, SuccesMessageShopModel>> SendItem({required int ItemId, required int Userid})async {
    final result = await baseShopRemoteDataSource.SendItem(ItemId: ItemId,UserId: Userid);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageMineModel, SuccesMessageMineModel>> GetMineItemPackage()async {
    final result = await baseShopRemoteDataSource.GetMineItemPackage();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> WearItem({required int SalesId}) async{
    final result = await baseShopRemoteDataSource.WearItem(SalesId: SalesId);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnWearItem({required int SalesId}) async{
    final result = await baseShopRemoteDataSource.UnWearItem(SalesId: SalesId);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }







}
