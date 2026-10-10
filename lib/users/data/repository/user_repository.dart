import 'dart:io';

import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/users/data/datasource/user_remote_data_source.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';


class UserRepository extends BaseUsersRepository {
  final BaseUserRemoteDataSource baseUserRemoteDataSource;

  UserRepository(this.baseUserRemoteDataSource);
   @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> LoginByPhoneNum(
      {required String PhoneNumber, required String Password}) async {
    final result = await baseUserRemoteDataSource.LoginByPhoneNumber(PhoneNumber: PhoneNumber, Password: Password);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }


  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> EnterCodeLogin({required String PhoneNumber, required String Password, required String Code}) async{
    final result = await baseUserRemoteDataSource.EnterCodeLogin(PhoneNumber: PhoneNumber, Password: Password,Code: Code);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SendCodeForgetPassword({required String PhoneNumber}) async{
    final result = await baseUserRemoteDataSource.SendCodeForgetPassword(PhoneNumber: PhoneNumber);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> GoogleAuth({required String email, required String GoogleId,required String sex,required String  name}) async{
    final result = await baseUserRemoteDataSource.GoogleAuth(email: email,sex: sex,name: name,GoogleId: GoogleId);

    if(result.statusCode==true){
      return Right(result);
    }
    else{
      return Left(result);
    }

  }



  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SentCodeForSignup({required String PhoneNumber}) async{
    final result = await baseUserRemoteDataSource.SentCodeForSignup(PhoneNumber:PhoneNumber);

    if(result.statusCode==true){
      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UpdatePassword({required String Password}) async{
     print(Password);
    final result = await baseUserRemoteDataSource.UpdatePassword( Password: Password);
     print(Password);
    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UserProfile()async {
    final result = await baseUserRemoteDataSource.GetMyProfile();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> FirebaseGoogleUserAuth()async {
    final result = await baseUserRemoteDataSource.FireBaseGoogleAuth();

    if(result.statusCode==true){
      print('asdasdasdasdasd');
      return Right(result);
    }
    else{
      return Left(result);
    }
  }


  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> SendCodeAgain({required String PhoneNumber, required String Password}) async{
    final result = await baseUserRemoteDataSource.SendCodeAgain(PhoneNumber: PhoneNumber, Password: Password);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> ForgetPassword({required String PhoneNumber, required String Code}) async{
    final result = await baseUserRemoteDataSource.ForgetPassword(PhoneNumber: PhoneNumber,Code: Code,);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> EnterCodeSignup({required String PhoneNumber, required String Password, required String Code}) async{
    final result = await baseUserRemoteDataSource.EnterCodeSignup(PhoneNumber: PhoneNumber, Password: Password,Code: Code);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> Register({required File image,required String PhoneNumber, required String description, required String Password, required String name, required String Flag, required String Country, required String dates, required int sex, required String Code})async {
    final result = await baseUserRemoteDataSource.Register(PhoneNumber: PhoneNumber, Password: Password,Code: Code,image: image,sex: sex,name: name,dates: dates,Flag: Flag,Country: Country);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> LogOut() async{
    final result = await baseUserRemoteDataSource.LogOut();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> AddPhoneAccount({required String PhoneNumber, required String Password, required String Code}) async{
    final result = await baseUserRemoteDataSource.AddPhoneaccount(PhoneNumber: PhoneNumber, Password: Password,Code: Code);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnBinned() async{
    final result = await baseUserRemoteDataSource.UnBinned();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }




}
