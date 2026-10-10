import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_recharg_model.dart';
import 'package:ahlachat/recharge/data/datasource/recharge_remote_data_source.dart';
import 'package:ahlachat/recharge/domin/repository/base_recharge_repository.dart';
import 'package:dartz/dartz.dart';


class RechargeRepository extends BaseRechargRepository {
  final BaseRechargeRemoteDataSource baseRechargeRemoteDataSource;

  RechargeRepository(this.baseRechargeRemoteDataSource);



  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> ExchangeDiamond({required Diamond}) async{
    final result = await baseRechargeRemoteDataSource.ExchangeDiamond(Diamond: Diamond);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageRechargeModel, SuccesMessageRechargeModel>> RechargeHistory({required history}) async{
    final result = await baseRechargeRemoteDataSource.RechargeHistory(history:history);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageRechargeModel, SuccesMessageRechargeModel>> ExchangeHistory({required history})async {
    final result = await baseRechargeRemoteDataSource.ExchangeHistory(history:history);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }







}
