
part of 'userlogin_bloc.dart';

@immutable

class UserloginState extends Equatable {
  final UserModel ?UserProfile;
  final String LoginPhoneMessage;
  final String ? SelectData;
  final bool ShowPassword;

  final int ? Gender;
  final bool SendCodeState;
  final SelectCodeModel CountryCode;
  final TimerController ?timerController;
  final RequestState ForgetPasswordState;
  final RequestState loginState;
  final RequestState EnterLoginState;
  final RequestState SendCodeAgainState;
  final RequestState SendCodeForgetPasswordState;
  final RequestState UpdateForgetPasswordState;
  final RequestState SendCodeForSignUpState;
  final RequestState EnterCodeSignUpState;
  final RequestState RegisterState;
  final RequestState GetFriendsState;
  final File ? Picker;
  final List<UserModel> Friends;
  const UserloginState({
    this.UserProfile ,
    this.loginState = RequestState.loaded,
    this.LoginPhoneMessage= '',
    this.ShowPassword=false,
    this.EnterLoginState=RequestState.loaded,
    this.RegisterState=RequestState.loaded,
    this.CountryCode=const SelectCodeModel(code: '+20',Country: 'Egypt',flag: 'flags/egy.png'),
    this.timerController,
    this.SendCodeState=true,
    this.SendCodeForgetPasswordState=RequestState.loaded,
    this.SendCodeAgainState=RequestState.loaded,
    this.ForgetPasswordState=RequestState.loaded,
    this.UpdateForgetPasswordState=RequestState.loaded,
    this.SendCodeForSignUpState=RequestState.loaded,
    this.EnterCodeSignUpState=RequestState.loaded,
    this.Picker  ,
    this.Friends=const [],
    this.SelectData=null,
    this.Gender=0,
    this.GetFriendsState=RequestState.loaded,

  });

  UserloginState copyWith({
    UserModel? UserProfile,
    RequestState? loginState,

    String? LoginPhoneMessage,
    bool ?ShowPassword,
    SelectCodeModel? CountryCode,
    RequestState? EnterLoginState,
    TimerController ?timerController,
    bool ?SendCodeState,
    RequestState? SendCodeAgainState,
    RequestState ?SendCodeForgetPasswordState,
    RequestState ?ForgetPasswordState,
    RequestState ? UpdateForgetPasswordState,
    RequestState ? SendCodeForSignUpState,
    RequestState ?  EnterCodeSignUpState,
    RequestState? GetFriendsState,
    File ? Picker,
    String ? SelectData,
    String ? SelectCountry,
    int ?Gender,
    RequestState ?RegisterState,
     List<UserModel>? Friends,
  }) {
    return UserloginState(
      LoginPhoneMessage:LoginPhoneMessage??this.LoginPhoneMessage,
      UserProfile:UserProfile ?? this.UserProfile,
      loginState:loginState ?? this.loginState,
      ShowPassword: ShowPassword ?? this.ShowPassword,
      CountryCode:CountryCode?? this.CountryCode,
      EnterLoginState:EnterLoginState?? this.EnterLoginState,
      timerController: timerController??this.timerController,
      SendCodeState: SendCodeState??this.SendCodeState,
      SendCodeAgainState:SendCodeAgainState??this.SendCodeAgainState,
      SendCodeForgetPasswordState:SendCodeForgetPasswordState??this.SendCodeForgetPasswordState,
      ForgetPasswordState:ForgetPasswordState??this.ForgetPasswordState,
      UpdateForgetPasswordState:UpdateForgetPasswordState??this.UpdateForgetPasswordState,
      SendCodeForSignUpState:SendCodeForSignUpState??this.SendCodeForSignUpState,
      EnterCodeSignUpState: EnterCodeSignUpState??this.EnterCodeSignUpState,
      Picker: Picker??this.Picker,
      SelectData: SelectData??this.SelectData,
      Gender:Gender??this.Gender,
      RegisterState: RegisterState??this.RegisterState,
      Friends: Friends??this.Friends,
       GetFriendsState:GetFriendsState??this.GetFriendsState
    );
  }


  @override
  List<Object?> get props => [
    UserProfile,
    loginState,
    LoginPhoneMessage,
    ShowPassword,
    CountryCode,
    EnterLoginState,
    timerController,
    SendCodeState,
    SendCodeAgainState,
    SendCodeForgetPasswordState,
    ForgetPasswordState,
    UpdateForgetPasswordState,
    SendCodeForSignUpState,
    EnterCodeSignUpState,
    Picker,
    SelectData,
    Gender,
    RegisterState,
    Friends,
    GetFriendsState
  ];
}
