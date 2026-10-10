import 'dart:async';
import 'dart:io';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/core/utils/helper.dart';

import 'package:ahlachat/main.dart';
import 'package:ahlachat/shop/data/models/SalesModel.dart';
import 'package:ahlachat/userprofile/domin/usecases/follow_user_usecase.dart';

import 'package:ahlachat/users/data/models/SelectCodeModel.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/domin/usecases/add_phone_account_usecase.dart';

import 'package:ahlachat/users/domin/usecases/enter_code_login_usecase.dart';
import 'package:ahlachat/users/domin/usecases/enter_code_signup_usecase.dart';
import 'package:ahlachat/users/domin/usecases/firebase_google_auth.dart';
import 'package:ahlachat/users/domin/usecases/forget_password_usecase.dart';

import 'package:ahlachat/users/domin/usecases/get_my_profile_usecase.dart';
import 'package:ahlachat/users/domin/usecases/log_out_use_case.dart';
import 'package:ahlachat/users/domin/usecases/send_code_forget_password_usecase.dart';
import 'package:ahlachat/users/domin/usecases/google_auth_usecase.dart';
import 'package:ahlachat/users/domin/usecases/login_user_phone_usecase.dart';
import 'package:ahlachat/users/domin/usecases/send_code_again.dart';
import 'package:ahlachat/users/domin/usecases/sent_code_signup_use_case.dart';
import 'package:ahlachat/users/domin/usecases/un_binned_phone_usecase.dart';
import 'package:ahlachat/users/domin/usecases/un_follow_user_usecase.dart';
import 'package:ahlachat/users/domin/usecases/update_password_usecase.dart';
import 'package:ahlachat/users/domin/usecases/user_register_usecase.dart';
import 'package:ahlachat/users/presentation/Screans/enter_code_login_screan.dart';
import 'package:ahlachat/users/presentation/Screans/main_login_screan.dart';
import 'package:ahlachat/users/presentation/Screans/register_screan.dart';
import 'package:ahlachat/users/presentation/Screans/update_password_screan.dart';
import 'package:ahlachat/vip/data/models/VipSalesModel.dart';
 import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:simple_timer/simple_timer.dart';

import '../../../mainpage/presentation/Screans/main_screan.dart';

part 'userlogin_event.dart';
part 'userlogin_state.dart';

class UserloginBloc extends Bloc<UserloginEvent, UserloginState> {
  final LoginUserPhoneUseCase loginUserPhone;
  final GoogleUserAuthUseCase googleAuth;
  final EnterLoginCodeUseCase EnterCode;
  final RegisterNewAccountUseCase register;
  final SendCodeAgainUseCase SendCodeAgain;
  final SendForgetPasswordUseCase SendcodeForgetPassword;
  final ForgetPasswordUseCase ForgetPassword;
  final UpdatePasswordUseCase UpdateForgetPassword;
  final FirebaseGoogleUserAuthUseCase firebaseGoogleUserAuth;
  final SentCodeForSignupUseCase SentCodeForSignup;
  final EnterSignupCodeUseCase EnterCodeSignupAccount;
  final GetMyUserProfileUseCase GetMyProfile;
  final LogOutUseCase LogOut;
  final AddPhoneAccountCodeUseCase PhoneAccount;
  final  FollowUserUseCase  FollowUser;
  final  UnFollowUserUseCase  UnFollowUser;

  final UnBinnedPhoneUseCase UnBinnedPhoneuse;
  UserloginBloc(this.loginUserPhone,this.UnBinnedPhoneuse,this.UnFollowUser,this.FollowUser,this.PhoneAccount,this.googleAuth,this.GetMyProfile,this.UpdateForgetPassword,this.firebaseGoogleUserAuth,this.SentCodeForSignup,this.EnterCodeSignupAccount,this.EnterCode,this.SendCodeAgain,this.ForgetPassword,this.SendcodeForgetPassword,this.register,this.LogOut) : super(UserloginState()) {
    on<LoginByPhoneEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  loginUserPhone.LoginByPhoneNum(PhoneNumber:(state.CountryCode.code??'')+event.Phone, Password: event.Password);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          loginState:   RequestState.error,
            LoginPhoneMessage: l.statusMessage
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(
          UserProfile:UserModel(password:event.Password,phone:(state.CountryCode.code??'')+event.Phone) ,
            loginState:     RequestState.loaded,
            LoginPhoneMessage: r.statusMessage,
        ));


        NavigateTo(context: NavigationService.CurrentContext, screen: EnterCodeLoginScrean());
        print('------------------------------------------------------');

      }   );

    });
    on<FollowUserEvent>((event, emit) async{




      final result= await  FollowUser.FollowUser(id: event.id);

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');


      },
              (r){
                Showtoast(message: r.statusMessage??'');
                emit(state.copyWith(
                    UserProfile: state.UserProfile?.copyWith(nFollowed:(state.UserProfile?.nFollowed??0)+1 )
                ));



          }   );

    });
    on<UnFollowUserEvent>((event, emit) async{




      final result= await  UnFollowUser.UnFollowUser(id: event.id);

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

      },
              (r){
                Showtoast(message:r.statusMessage??'');
            emit(state.copyWith(

                UserProfile: state.UserProfile?.copyWith(nFollowed:(state.UserProfile?.nFollowed??0)-1 )

            ));




          }   );

    });
    on<EnterCodeLoginEvent>((event, emit) async{
      ShowGlopalLoading();

      final result= await  EnterCode.EnterLoginCode(Code:event.Code ,Password: state.UserProfile?.password??'',PhoneNumber:state.UserProfile?.phone??'' );
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          loginState:   RequestState.error,
          LoginPhoneMessage: l.statusMessage,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(

          UserProfile:r.data?.UserInfo ,
          loginState: RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));
        print('1111111');
        SaveTokenAndUserData(Token:r.data?.accessToken,UserData: r.data?.UserInfo );
        UserId=r.data?.UserInfo?.id.toString();
        print(state.SendCodeState);
        NavigateTo(context: NavigationService.CurrentContext, screen: MainScrean());
      }   );

    });

    on<GetMyProfileEvent>((event, emit) async{
      ShowGlopalLoading();

      final result= await  GetMyProfile.GetMyProfile();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          loginState:   RequestState.error,
          LoginPhoneMessage: l.statusMessage,
        ));
        ClearSavedUserData();
         NavigateTo(context: NavigationService.CurrentContext, screen: MainLoginScrean());


      }, (r){
        Showtoast(message: r.statusMessage??'');
print(r.data?.UserInfo);
        emit(state.copyWith(

          UserProfile:r.data?.UserInfo ,
          loginState: RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));
print(state.UserProfile);
        SaveTokenAndUserData(Token:r.data?.accessToken,UserData: r.data?.UserInfo );
        UserId=r.data?.UserInfo?.id.toString();
        PusherInit();
       // NavigateTo(context: NavigationService.CurrentContext, screen: MainScrean());
      }   );

    });

    on<SendCodeForgetPasswordEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  SendcodeForgetPassword.SendCodeForgetPassword(PhoneNumber:(state.CountryCode.code??'')+event.Phone,);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
            SendCodeForgetPasswordState:   RequestState.error,
            LoginPhoneMessage: l.statusMessage
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(
          UserProfile:UserModel(phone:(state.CountryCode.code??'')+event.Phone) ,
          SendCodeForgetPasswordState:     RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));
        print(state.UserProfile?.phone);
        print(state.UserProfile?.Code);

      }   );

    });

    on<SentCodeForSignupEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  SentCodeForSignup.SentCodeSignup(PhoneNumber:(state.CountryCode.code??'')+event.Phone);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
            SendCodeForSignUpState:   RequestState.error,
            LoginPhoneMessage: l.statusMessage
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(
          UserProfile:UserModel(phone:(state.CountryCode.code??'')+event.Phone) ,
          SendCodeForSignUpState:     RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));

      }   );

    });

    on<SentCodeForAddPhoneEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  SentCodeForSignup.SentCodeSignup(PhoneNumber:(state.CountryCode.code??'')+event.Phone);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
            SendCodeForSignUpState:   RequestState.error,
            LoginPhoneMessage: l.statusMessage
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(

          SendCodeForSignUpState:     RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));


      }   );

    });

    on<PickSignUpImage>((event, emit) async{
      print('PickSignUpImagePickSignUpImagePickSignUpImage');
      final ImagePicker _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile!= null) {

        File  Image = File(pickedFile.path);

        emit(state.copyWith(
           Picker: Image,
        ));
      } else {
        emit(state.copyWith(
          Picker: null,
        ));
      }

    });
     on<SelectData>((event, emit) async{
   emit(state.copyWith(
   SelectData: event.Selectdata,
   ));
 });
     on<ForgetPasswordEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  ForgetPassword.ForgetPassword(PhoneNumber:(state.CountryCode.code??'')+event.Phone, Code: event.Code,);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
            ForgetPasswordState:   RequestState.error,
            LoginPhoneMessage: l.statusMessage
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(
          UserProfile:UserModel(phone:(state.CountryCode.code??'')+event.Phone,Code: event.Code),
          ForgetPasswordState:     RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));
        MyToken=r.data?.accessToken;
         print(MyToken);
        NavigateTo(context: NavigationService.CurrentContext, screen: UpdateForgetPasswordScrean());
      }   );

    });


    on<SendCodeAgainEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  SendCodeAgain.SendCodeagain(PhoneNumber:state.UserProfile?.phone??'', Password: state.UserProfile?.password??'');
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
            EnterLoginState:   RequestState.error,
            LoginPhoneMessage: l.statusMessage
        ));
      },
              (r){
        Showtoast(message: r.statusMessage??'');
        state.timerController?.reset();
        state.timerController?.start();
        emit(state.copyWith(
            SendCodeState:  true ,
            EnterLoginState: RequestState.error,
            LoginPhoneMessage: r.statusMessage
        ));

      }   );
    });
    on<UpdatePasswordEvent>((event, emit) async{
      ShowGlopalLoading();

      final result= await  UpdateForgetPassword.UpdateAccountPassword(  Password: event.Password??'');
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
            UpdateForgetPasswordState:   RequestState.error,
            LoginPhoneMessage: l.statusMessage
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(

            UpdateForgetPasswordState:     RequestState.error,
            LoginPhoneMessage: r.statusMessage
        ));
        SaveTokenAndUserData(Token:r.data?.accessToken,UserData: r.data?.UserInfo );
        print(state.SendCodeState);
        UserId=r.data?.UserInfo?.id.toString();
        NavigateTo(context: NavigationService.CurrentContext, screen: MainScrean());
        //NavigateTo(context: NavigationService.CurrentContext, screen: EnterCodeLoginScrean());
      }   );

    });


    on<Register>((event, emit) async{

      ShowGlopalLoading();
      final result= await  register.RegisterAccount(Code:state.UserProfile?.Code??'' ,description:event.description,name: event.name,dates: event.date,Country: state.CountryCode.Country??'',Flag:state.CountryCode.flag??'' ,Password: state.UserProfile?.password??'',PhoneNumber:state.UserProfile?.phone??'', sex: event.sex,image: state.Picker! );
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          RegisterState:   RequestState.error,
          LoginPhoneMessage: l.statusMessage,
        ));
      }, (r){
        SaveTokenAndUserData(Token:r.data?.accessToken,UserData: r.data?.UserInfo );
        print(state.SendCodeState);
        UserId=r.data?.UserInfo?.id.toString();
        NavigateTo(context: NavigationService.CurrentContext, screen: MainScrean());
        Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(
          UserProfile:r.data?.UserInfo ,
          RegisterState: RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));

      }   );

    });

    on<EnterCodeSignupEvent>((event, emit) async{
      ShowGlopalLoading();

      final result= await  EnterCodeSignupAccount.EnterSignupCode(Code:event.Code ,Password: event.Password??'',PhoneNumber:state.UserProfile?.phone??'' );
      DismissGlopalLoading();

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(

          EnterCodeSignUpState:   RequestState.error,
          LoginPhoneMessage: l.statusMessage,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');
        NavigateTo(context: NavigationService.CurrentContext, screen: RegisterScrean());
        emit(state.copyWith(
          UserProfile:UserModel(phone:state.UserProfile?.phone,Code:event.Code,password: event.Password) ,
          // UserProfile:UserModel(password:event.Password,phone:(state.CountryCode.code??'')+event.Phone  ) ,
          EnterCodeSignUpState: RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));
        print('22222');

        print(state.SendCodeState);


      }   );

    });
    on<EnterCodeAddPhoneAccountEvent>((event, emit) async{
      ShowGlopalLoading();
print('${state.CountryCode.code}${event.phone??''}');
      final result= await  PhoneAccount.AddPhoneAccount(Code:event.Code ,Password: event.Password??'',PhoneNumber: '${state.CountryCode.code}${event.phone??''}');
      DismissGlopalLoading();

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(

          EnterCodeSignUpState:   RequestState.error,
          LoginPhoneMessage: l.statusMessage,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(

          UserProfile: state.UserProfile?.copyWith(phone:'${state.CountryCode.code}${event.phone??''}'  ),
          EnterCodeSignUpState: RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));

        Navigator.pop(NavigationService.CurrentContext);


      }   );

    });

    on<UnBinnedPhone>((event, emit) async{
      ShowGlopalLoading();
      final result= await  UnBinnedPhoneuse.UnBinned(  );
      DismissGlopalLoading();

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(



        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(

          UserProfile: state.UserProfile?.copyWith(phone:0 ),

        ));

        Navigator.pop(NavigationService.CurrentContext);


      }   );

    });


    on<GoogleAuthEvent>((event, emit) async{
      emit(state.copyWith(
          loginState:   RequestState.loading,
          LoginPhoneMessage: 'error'
      ));
      final result= await  googleAuth.GoogleAuth(email: event.Email,GoogleId: event.GoogleId,name:event.name,sex: event.sex );
      result.fold((l) {

        emit(state.copyWith(
            loginState:   RequestState.error,
          LoginPhoneMessage:l.statusMessage,
        ));
      }, (r) =>   emit(state.copyWith(
          loginState:     RequestState.loaded,
          LoginPhoneMessage:r.statusMessage
      )));

    });

    on<FireBaseGoogleAuthEvent>((event, emit) async{
      emit(state.copyWith(
          loginState:   RequestState.loading,
          LoginPhoneMessage: 'error'
      ));
      final result= await  firebaseGoogleUserAuth.FirebaseGoogleUserAuth();
      result.fold((l) {

        emit(state.copyWith(
          loginState:   RequestState.error,
          LoginPhoneMessage:l.statusMessage,
        ));
      }, (r) {

        emit(state.copyWith(
          loginState:     RequestState.loaded,
          LoginPhoneMessage:r.statusMessage
      ));});

    });
    on<AddMyProfile>((event, emit) async{
       emit(UserloginState(UserProfile: event.MyProfile,));
    });

    on<IncreaseMyCoins>((event, emit) async{
       emit(UserloginState(UserProfile:state.UserProfile?.copyWith(coin:((state.UserProfile?.coin??0)+event.Coins) ) ));
    });

    on<ChangeImage>((event, emit) async{
      emit(UserloginState(UserProfile:state.UserProfile?.copyWith(image:  event.image) ));
    });

    on<DecreaseMyCoins>((event, emit) async{
      emit(UserloginState(UserProfile:state.UserProfile?.copyWith(coin:((state.UserProfile?.coin??0)-event.Coins) ) ));
    });

    on<DecreaseMyDiamond>((event, emit) async{
      emit(UserloginState(UserProfile:state.UserProfile?.copyWith( input: ((state.UserProfile?.input??0)-event.Diamond) ) ));
    });
    on<IncreaseMyDiamond>((event, emit) async{
      emit(UserloginState(UserProfile:state.UserProfile?.copyWith( input: ((state.UserProfile?.input??0)+event.Diamond) ) ));
    });
    on<UpdateMyProfileEvent>((event, emit) async{

      emit(UserloginState(UserProfile:state.UserProfile?.copyWith(  descript: event.discript??state.UserProfile?.descript,name:event.name??state.UserProfile?.name,flag: event.flag??state.UserProfile?.flag,country: event.country??state.UserProfile?.country,date: event.date??state.UserProfile?.date  ) ));



    });

    on<UpdateMyvip>((event, emit) async{
      emit(UserloginState(UserProfile:state.UserProfile?.copyWith(CurrentVip:event.sales ) ));


    });

    on<UpdateMyFrameEvent>((event, emit) async{
      print('UpdateMyFrameEventUpdateMyFrameEventUpdateMyFrameEventUpdateMyFrameEventUpdateMyFrameEvent');

      emit(UserloginState(UserProfile:state.UserProfile?.copyWith(Entry:  state.UserProfile?.Entry,Frame:event.Frame )));

    });
    on<UpdateMyEntryEvent>((event, emit) async{
      print('UpdateMyEntryEventUpdateMyEntryEventUpdateMyEntryEventUpdateMyEntryEventUpdateMyEntryEvent');

      emit(UserloginState(UserProfile:state.UserProfile?.copyWith(Entry:  event.Entry,Frame: state.UserProfile?.Frame )));

    });

    on<RemoveMyEntryEvent>((event, emit) async{
      emit(UserloginState(UserProfile:state.UserProfile?.copyWith(Entry:0)));
     });

    on<RemoveMyFrameEvent>((event, emit) async{
      emit(UserloginState(UserProfile:state.UserProfile?.copyWith(Frame:0  )));
     });

    on<StartTimerControllerEvent>((event, emit) async{

      emit(state.copyWith(
        timerController:event.timerController ,

      ));
      print(state.timerController);

      Future.delayed(Duration(seconds: 5),(){
        state.timerController?.start(startFrom: Duration(seconds: 30));
      }

        );
     //
    });
    on<ResetTimerControllerEvent>((event, emit) async{
      state.timerController?.reset();
      emit(state.copyWith(
        SendCodeState:  false ,
      ));
    });
    on<ChangeVisibility>((event, emit) async{
      print(state.ShowPassword);
      emit(state.copyWith(
       ShowPassword: event.Visibility,
      ));
      print(state.ShowPassword);
    });
    on<UpdateCountryCode>((event, emit) async{
      print(event.CountryCode.code);
      print(event.CountryCode.Country);
      print(event.CountryCode.flag);
      emit(state.copyWith(
        CountryCode:   event.CountryCode,

      ));
      print(state.CountryCode.Country);
      print('3333');
    });
    on<UpdateGinderEvent>((event, emit) async{

      emit(state.copyWith(
        Gender:   event.gender,

      ));


    });
    on<LogOutEvent>((event, emit) async{
      ShowGlopalLoading();

      final result= await  LogOut.LogOutUser();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          loginState:   RequestState.error,
          LoginPhoneMessage: l.statusMessage,
        ));



      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(

          // UserProfile:UserModel(password:event.Password,phone:(state.CountryCode.code??'')+event.Phone  ) ,
          loginState: RequestState.loaded,
          LoginPhoneMessage: r.statusMessage,
        ));

        ClearSavedUserData();
        NavigateTo(context: NavigationService.CurrentContext, screen: MainLoginScrean());
        Showtoast(message: 'Done');
        // NavigateTo(context: NavigationService.CurrentContext, screen: MainScrean());
      }   );

    });


  }
}
