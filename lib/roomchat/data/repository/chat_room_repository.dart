import 'dart:io';

import 'package:ahlachat/core/network/succes_message_get_Inbox_Room_model.dart';
import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:ahlachat/roomchat/data/datasource/chat_room_data_source.dart';
import 'package:ahlachat/roomchat/domin/repository/base_chat_room_repository.dart';
import 'package:ahlachat/shop/data/datasource/shop_remote_data_source.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';
import 'package:ahlachat/users/data/datasource/user_remote_data_source.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';


class ChatRoomRepository extends BaseChatRoomRepository {
  final BaseChatRoomDataSource baseChatRemoteDataSource;

  ChatRoomRepository(this.baseChatRemoteDataSource);

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SendMessageRoom({required String tittle}) async{
    final result = await baseChatRemoteDataSource.SendMessage(tittle: tittle);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageInboxModel, SuccesMessageInboxModel>> GetInboxRoom() async{
    final result = await baseChatRemoteDataSource.GetInbox();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }











}
