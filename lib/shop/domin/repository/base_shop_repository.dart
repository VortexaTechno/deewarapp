import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/error/failure.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseShopRepository {

  Future<Either<SuccesMessageShopModel, SuccesMessageShopModel>> GetShopPackage();
  Future<Either<SuccesMessageMineModel, SuccesMessageMineModel>> GetMineItemPackage();
  Future<Either<SuccesMessageShopModel, SuccesMessageShopModel>> BuyItem({required int ItemId});
  Future<Either<SuccesMessageShopModel, SuccesMessageShopModel>> SendItem({required int ItemId,required int Userid});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> WearItem({required int SalesId});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnWearItem({required int SalesId});






}
