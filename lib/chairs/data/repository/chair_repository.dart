import 'package:ahlachat/chairs/data/datasource/chair_remote_data_source.dart';
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/core/network/succes_message_get_emoje_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';

import 'package:dartz/dartz.dart';



class ChairRepository extends BaseChairRepository {
  final BaseChairRemoteDataSource baseChairRemoteDataSource;

  ChairRepository(this.baseChairRemoteDataSource);

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> LockChair({id, index}) async{
    final result = await baseChairRemoteDataSource.LockChair(index: index,id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnLockChair({id, index})async {
    final result = await baseChairRemoteDataSource.UnLockChair(index: index,id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }

  }


  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> JoinChair({id, index})async {
    final result = await baseChairRemoteDataSource.JoinChair(index: index,id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> LeaveChair({id, index}) async{
    final result = await baseChairRemoteDataSource.LeaveChair(index: index,id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> CloseMic() async{
    final result = await baseChairRemoteDataSource.CloseMic();

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> OpenMic()async {
    final result = await baseChairRemoteDataSource.OpenMic();

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SendEmoje({tittle}) async{
    final result = await baseChairRemoteDataSource.SendEmoje(tittle:tittle );

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageEmojesModel, SuccesMessageEmojesModel>> GetEmoje() async{
    final result = await baseChairRemoteDataSource.GetEmoje();

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> LeaveChairAdmin({id, index})async {
    final result = await baseChairRemoteDataSource.LeaveChairAdmin(index: index,id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }



}
