import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/error/failure.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUsersRepository {
  //PhoneLogin
  Future<Either<SuccesMessageModel, SuccesMessageModel>> LoginByPhoneNum({required String PhoneNumber,required String Password});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> EnterCodeLogin({required String PhoneNumber,required String Password,required String Code});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SendCodeAgain({required String PhoneNumber,required String Password});

  //GoogleAuth
  Future<Either<SuccesMessageModel, SuccesMessageModel>> GoogleAuth( {required String email, required String GoogleId,required String sex,required String  name});
  Future<Either<SuccesMessageModel, SuccesMessageModel>> FirebaseGoogleUserAuth();

  //PhoneSignUp
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   SentCodeForSignup({required String PhoneNumber});
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   EnterCodeSignup({required String PhoneNumber,required String Password,required String Code});

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   AddPhoneAccount({required String PhoneNumber,required String Password,required String Code});


  Future<Either<SuccesMessageModel, SuccesMessageModel>>   Register({required String PhoneNumber,required String description,required String Password,required String name,required String Flag,required String Country,required String dates,required int sex,required String Code,required File image});
  //ForgetPassword

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   ForgetPassword({required String PhoneNumber,required String Code});
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   SendCodeForgetPassword({required String PhoneNumber});
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UpdatePassword({required String Password});
  //MyProfile
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UserProfile();
  Future<Either<SuccesMessageModel, SuccesMessageModel>>   LogOut();

  Future<Either<SuccesMessageModel, SuccesMessageModel>>   UnBinned();



}
