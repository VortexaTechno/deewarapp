
import 'package:ahlachat/core/network/succes_message_get_emoje_model.dart';
import 'package:ahlachat/core/network/succes_message_level_model.dart';
import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseChairRepository {
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   LockChair({id,index});
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UnLockChair({id,index});


  Future<Either<SuccesMessageModel, SuccesMessageModel>>   JoinChair({id,index});
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   LeaveChair({id,index});

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   LeaveChairAdmin({id,index});

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   OpenMic();
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   CloseMic();

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   SendEmoje({tittle});
  Future<Either<SuccesMessageEmojesModel, SuccesMessageEmojesModel>>   GetEmoje();
}
