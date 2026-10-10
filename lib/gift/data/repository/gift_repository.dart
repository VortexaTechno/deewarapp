

import 'package:ahlachat/core/network/succes_message_gifts_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/gift/data/datasource/gift_remote_data_source.dart';
import 'package:ahlachat/gift/domin/repository/base_gift_repository.dart';
import 'package:dartz/dartz.dart';


class giftRepository extends BasegiftRepository {
  final BasegiftRemoteDataSource basegiftRemoteDataSource;

  giftRepository(this.basegiftRemoteDataSource);

  @override
  Future<Either<SuccesMessageCategoryModel, SuccesMessageCategoryModel>> GetGifts()     async{

      final result = await basegiftRemoteDataSource.GetGift();

      if(result.statusCode==true){

        return Right(result);
      }
      else{

        return Left(result);
      }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SentGifts({Giftid, Quen, User_ID})async {
    // TODO: implement SentGifts
    final result = await basegiftRemoteDataSource.SentGift(Quen: Quen,Giftid:Giftid,User_ID: User_ID );

    if(result.statusCode==true){

      return Right(result);
    }
    else{

      return Left(result);
    }
  }


}
