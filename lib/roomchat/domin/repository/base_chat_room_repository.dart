import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/error/failure.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_get_Inbox_Room_model.dart';
import 'package:ahlachat/core/network/succes_message_mine_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_shop_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseChatRoomRepository {


  Future<Either<SuccesMessageModel, SuccesMessageModel>> SendMessageRoom({required String tittle});

  Future<Either<SuccesMessageInboxModel, SuccesMessageInboxModel>> GetInboxRoom();




}
