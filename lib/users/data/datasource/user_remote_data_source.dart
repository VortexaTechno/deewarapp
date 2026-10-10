import 'dart:io';

import 'package:ahlachat/core/error/exceptions.dart';
import 'package:ahlachat/core/network/api_constance.dart';
import 'package:ahlachat/core/network/error_message_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/users/data/models/FireBaseGoogleModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseUserRemoteDataSource {
  //PhoneLogin
  Future<SuccesMessageModel> LoginByPhoneNumber({required String PhoneNumber,required String Password});
  Future< SuccesMessageModel> EnterCodeLogin({required String PhoneNumber,required String Password,required String Code});
  Future< SuccesMessageModel> SendCodeAgain({required String PhoneNumber, required String Password});

  //GoogleAuth
  Future< SuccesMessageModel> GoogleAuth( {required String email, required String GoogleId,required String sex,required String  name});
  Future< SuccesMessageModel> FireBaseGoogleAuth();

  //PhoneSignUp
  Future<SuccesMessageModel>   SentCodeForSignup({required String PhoneNumber});
  Future<SuccesMessageModel>   Register({required String PhoneNumber,required String Password,required String name,required String Flag,required String Country,required String dates,required int sex,required String Code,required File image});
  Future< SuccesMessageModel> EnterCodeSignup({required String PhoneNumber,required String Password,required String Code});

  Future< SuccesMessageModel> AddPhoneaccount({required String PhoneNumber,required String Password,required String Code});

  //ForgetPassword
  Future< SuccesMessageModel>   SendCodeForgetPassword({required String PhoneNumber});

  Future< SuccesMessageModel>   ForgetPassword({required String PhoneNumber,required String Code});
  Future<SuccesMessageModel>   UpdatePassword({required String Password});
  //MyProfile
  Future<SuccesMessageModel>  GetMyProfile();
  Future<SuccesMessageModel>  LogOut();
  Future<SuccesMessageModel>  UnBinned();

}


class UserRemoteDataSource extends BaseUserRemoteDataSource {

  @override
  Future<SuccesMessageModel> LoginByPhoneNumber({required String PhoneNumber,required String Password}) async {
    FormData formData =   FormData.fromMap({
      "phone":PhoneNumber.toString(),
      "password":Password.toString(),
    });

    final response = await Dio().post(ApiConstance.LoginByPhoneNum,data: formData,);

   if (response.statusCode == 200) {
    return  SuccesMessageModel.fromJson(response.data);
   } else {
    return  SuccesMessageModel.fromJson(response.data);


  }

  }

  @override
  Future<SuccesMessageModel> EnterCodeLogin({required String PhoneNumber, required String Password, required String Code})async {
    FormData formData =   FormData.fromMap({
      "code":Code.toString(),
      "phone":PhoneNumber.toString(),
      "password":Password.toString(),
    });

print({
  "code":Code.toString(),
  "phone":PhoneNumber.toString(),
  "password":Password.toString(),
});
    final response = await Dio().post(ApiConstance.EnterCodeLogin,data: formData,);
print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }


  }

  @override
  Future<SuccesMessageModel> EnterCodeSignup({required String PhoneNumber, required String Password, required String Code})async {
    FormData formData =   FormData.fromMap({
      "code":Code.toString(),
      "phone":PhoneNumber.toString(),
      "password":Password.toString(),
    });


    final response = await Dio().post(ApiConstance.EntercodeSignup,data: formData,);
    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }


  }

  Future<SuccesMessageModel> SendCodeAgain({required String PhoneNumber, required String Password})async {
    FormData formData =   FormData.fromMap({

      "phone":PhoneNumber.toString(),
      "password":Password.toString(),
    });


    final response = await Dio().post(ApiConstance.SendCodeAgain,data: formData,);
print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }


  }

  @override
  Future<SuccesMessageModel> SendCodeForgetPassword({required String PhoneNumber}) async{
    FormData formData =   FormData.fromMap({
      "phone":PhoneNumber.toString(),
    });
    final response = await Dio().post(ApiConstance.SendCodeforgetpassword,data: formData,);
    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }

  }

  @override
  Future<SuccesMessageModel> GoogleAuth({required String email, required String GoogleId,required String sex,required String  name})async {
    FormData formData =   FormData.fromMap({
      "email":email.toString(),
      "GoogleID":GoogleId.toString(),
      "sex":sex.toString(),
      "name":name.toString(),
    });


    final response = await Dio().post(ApiConstance.GoogleAuth,data: formData,);
    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }

  }
  @override
  Future<SuccesMessageModel> FireBaseGoogleAuth()async {

    try {
      final googleuser = GoogleSignIn();
      final signin = await googleuser.signIn();
      if (googleuser != null) {
        final googleAuth = await signin?.authentication;
        if (googleAuth?.idToken != null) {

          final usercredentioal = await FirebaseAuth.instance
              .signInWithCredential(GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,

          ));
          User ?Info=usercredentioal.user;
          print(Info?.email);
          print( googleAuth?.idToken);

          // Gmail=usercredentioal.user?.email;
          // final ByteData imageData = await NetworkAssetBundle(Uri.parse(usercredentioal.user?.photoURL??'')).load("");
          // final Uint8List bytes = imageData.buffer.asUint8List();
          // ByteData byteData = ByteData.view(bytes.buffer);
          // var tempDir = await getTemporaryDirectory();
          // File file = await File('${tempDir.path}/img').writeAsBytes(bytes.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
          //
          // if(usercredentioal.user!=null){
          //   Provider.of<LoginViewmodel>(context,listen: false).UpdateUsernameComp(name:usercredentioal.user?.displayName );
          //   Provider.of<LoginViewmodel>(context,listen: false).updateComimage(image: file);
          //   UserLoginGoogle(context: context ,email:usercredentioal.user?.email);
          // }
          //Provider.of<LoginViewmodel>(context,listen: false).UserSocialRegester(context: context, uuid: usercredentioal.user!.uid,social: "2");
          return  SuccesMessageModel(statusMessage: 'Login Successfully',statusCode: true,errNum: 200,FirebaseAuth: FireBaseGoogleModel(name:Info?.displayName,email:Info?.email ,googleid:googleAuth?.idToken,sex:'0'));
        } else {
          return  SuccesMessageModel(statusMessage: 'Error Occur',statusCode: false,errNum: 404);
        }
      } else {

        return  SuccesMessageModel(statusMessage: 'Error Occur',statusCode: false,errNum: 404);
      }
    } catch (e) {
      print(e);
      print('error accoure');
      return  SuccesMessageModel(statusMessage: 'Error Occur',statusCode: false,errNum: 404);
    }



  }


  @override
  Future<SuccesMessageModel> Register({required String PhoneNumber, required String Password, required String name, required String Flag, required String Country, required String dates, required int sex,required String Code,required File image}) async{
    FormData formData =   FormData.fromMap({
      "code":Code.toString(),
      "phone":PhoneNumber.toString(),
      "password":Password.toString(),
      "name":name.toString(),
      "Flag":Flag.toString(),
      "Country":Country.toString(),
      "dates":dates.toString(),
      "sex":sex.toString(),
      "image":await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
    });
print(image.path);

    print({
      "code":Code.toString(),
      "phone":PhoneNumber.toString(),
      "password":Password.toString(),
      "name":name.toString(),
      "Flag":Flag.toString(),
      "Country":Country.toString(),
      "dates":dates.toString(),
      "sex":sex.toString(),
      "image":await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
    });
    final response = await Dio( BaseOptions(receiveDataWhenStatusError: true,
      headers: {
        'Accept': 'application/json',

      },
    ),).post(ApiConstance.Register,data: formData,);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }

  }

  @override
  Future<SuccesMessageModel> SentCodeForSignup({required String PhoneNumber})async {
    FormData formData =   FormData.fromMap({
      "phone":PhoneNumber.toString(),
    });
    final response = await Dio().post(ApiConstance.SentCodeForSignup,data: formData,);
    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);

    }
  }

  @override
  Future<SuccesMessageModel> UpdatePassword({required String Password})async {

    FormData formData =   FormData.fromMap({
      "password":Password.toString(),

    });
    final client = await DioInstance();

    final response = await client.post(ApiConstance.UpdatePassword,data: formData,);

       print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageModel> GetMyProfile() async{

    final client = await DioInstance();

    final response = await client.post(ApiConstance.MyProfile);
print('--------------------------------------------------------------------------------------------------------');


    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);

    }
  }

  @override
  Future<SuccesMessageModel> ForgetPassword({required String PhoneNumber, required String Code}) async{
    FormData formData =   FormData.fromMap({
      "phone":PhoneNumber.toString(),
      "code":Code.toString(),
    });
    final response = await Dio().post(ApiConstance.ForgetPassword,data: formData,);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }

  }

  @override
  Future<SuccesMessageModel> LogOut()async {
    final client = await DioInstance();

    final response = await client.post(ApiConstance.LogOut);

    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }
  }

  @override
  Future<SuccesMessageModel> AddPhoneaccount({required String PhoneNumber, required String Password, required String Code})async {
    FormData formData =   FormData.fromMap({
      "code":Code.toString(),
      "phone":PhoneNumber.toString(),
      "password":Password.toString(),
    });
print({
  "code":Code.toString(),
  "phone":PhoneNumber.toString(),
  "password":Password.toString(),
});
    final client = await DioInstance();


    final response = await client.post(ApiConstance.EntercodeAddAccount,data: formData);

    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }

  }

  @override
  Future<SuccesMessageModel> UnBinned()async {

    final client = await DioInstance();


    final response = await client.post(ApiConstance.UnBinned );

    print(response.data);
    if (response.statusCode == 200) {
      return  SuccesMessageModel.fromJson(response.data);
    } else {
      return  SuccesMessageModel.fromJson(response.data);


    }

  }





}

