

import 'package:ahlachat/core/network/succes_message_gifts_model.dart';
import 'package:ahlachat/core/network/succes_message_leaderboard_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/gift/data/datasource/gift_remote_data_source.dart';
import 'package:ahlachat/gift/domin/repository/base_gift_repository.dart';
import 'package:ahlachat/leaderboard/data/datasource/leaderboard_remote_data_source.dart';
import 'package:ahlachat/leaderboard/domin/repository/base_leaderboard_repository.dart';
import 'package:dartz/dartz.dart';


class leaderboardRepository extends BaseleaderboardRepository {
  final BaseleaderboardRemoteDataSource baseleaderboardRemoteDataSource;

  leaderboardRepository(this.baseleaderboardRemoteDataSource);

  @override
  Future<Either<SuccesMessageleaderboardModel, SuccesMessageleaderboardModel>>GetDaileleaderboard() async{

    final result = await baseleaderboardRemoteDataSource.GetDaileleaderboard();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
       return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageleaderboardModel, SuccesMessageleaderboardModel>> GetWeaklyleaderboard() async{
    final result = await baseleaderboardRemoteDataSource.GetWeaklyleaderboard();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }




}
