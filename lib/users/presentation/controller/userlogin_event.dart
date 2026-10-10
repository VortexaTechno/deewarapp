part of 'userlogin_bloc.dart';

@immutable
abstract class UserloginEvent  extends Equatable {

  const UserloginEvent();

}

class LoginByPhoneEvent extends UserloginEvent {
  final Phone;
  final  Password;

  LoginByPhoneEvent({required this.Phone,required this.Password});
  @override
  List<Object?> get props => [Phone,Password];
}


class  FollowUserEvent extends UserloginEvent {
  final id;
  FollowUserEvent({this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}


class  UnFollowUserEvent extends UserloginEvent {
  final id;
  UnFollowUserEvent({this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class SendCodeAgainEvent extends UserloginEvent {
  SendCodeAgainEvent();
  @override
  List<Object?> get props => [];
}


class EnterCodeLoginEvent extends UserloginEvent {
  final  Code;
  EnterCodeLoginEvent({required this.Code});
  List<Object> get props => [Code];
}

class EnterCodeSignupEvent extends UserloginEvent {
  final  Code;
  final  Password;
  EnterCodeSignupEvent({required this.Code,required this.Password});
  List<Object> get props => [Code,Password];
}
class EnterCodeAddPhoneAccountEvent extends UserloginEvent {
  final  Code;
  final  Password;
  final  phone;
  EnterCodeAddPhoneAccountEvent({required this.Code,required this.phone,required this.Password});
  List<Object> get props => [Code,Password];
}
class PickSignUpImage extends UserloginEvent {
  PickSignUpImage();
  @override
  List<Object?> get props => [];
}
class GetMyProfileEvent extends UserloginEvent {
  GetMyProfileEvent();
  @override
  List<Object?> get props => [];
}
class LogOutEvent extends UserloginEvent {
  LogOutEvent();
  @override
  List<Object?> get props => [];
}

class UpdateGinderEvent extends UserloginEvent {
  final  gender;
  UpdateGinderEvent({required this.gender});
  @override
  List<Object?> get props => [gender];
}
class SelectData extends UserloginEvent {
  final  Selectdata;
  SelectData({required this.Selectdata});
  @override
  List<Object?> get props => [Selectdata];
}


class AddMyProfile extends UserloginEvent {
  UserModel ?MyProfile;
  AddMyProfile({required this.MyProfile});
  @override
  List<Object?> get props => [MyProfile];
}
class ChangeVisibility extends UserloginEvent {
  bool Visibility;
  ChangeVisibility({required this.Visibility});
  List<Object> get props => [Visibility];
}
class UpdateCountryCode extends UserloginEvent {
  SelectCodeModel CountryCode;
  UpdateCountryCode({required this.CountryCode});
  List<Object> get props => [CountryCode];
}



class GoogleAuthEvent extends UserloginEvent {
  final Email;
  final GoogleId;
  final sex;
  final name;

  GoogleAuthEvent({required this.Email,required this.GoogleId,required this.sex,required this.name});
  @override
  List<Object?> get props => [Email,GoogleId];
}


class StartTimerControllerEvent extends UserloginEvent {
  final TimerController timerController;
  StartTimerControllerEvent({required this.timerController});

  List<Object> get props => [timerController];
}

class ResetTimerControllerEvent extends UserloginEvent {

  ResetTimerControllerEvent();

  List<Object> get props => [];
}
class SentCodeForSignupEvent extends UserloginEvent {
  final Phone;

  SentCodeForSignupEvent({required this.Phone});

  List<Object> get props => [Phone];
}
class SentCodeForAddPhoneEvent extends UserloginEvent {
  final Phone;

  SentCodeForAddPhoneEvent({required this.Phone});

  List<Object> get props => [Phone];
}

class FireBaseGoogleAuthEvent extends UserloginEvent {
  List<Object> get props => [];
}

class UnBinnedPhone extends UserloginEvent {
  List<Object> get props => [];
}

class Register extends UserloginEvent {
  final name;
  final sex;
  final date;
  final description;

  Register({this.name, this.sex, this.date, this.description});
  List<Object> get props => [name,sex,date,description];
}
class ForgetPasswordEvent extends UserloginEvent {
  final Phone;
  final Code;
  ForgetPasswordEvent({required this.Phone,required this.Code});

  List<Object> get props => [Phone,Code];
}

class SendCodeForgetPasswordEvent extends UserloginEvent {
  final Phone;

  SendCodeForgetPasswordEvent({required this.Phone});

  List<Object> get props => [Phone];
}



class UpdatePasswordEvent extends UserloginEvent {
  final Password;
  UpdatePasswordEvent({required this.Password});

  List<Object> get props => [Password];
}
class UserProfile extends UserloginEvent {
  List<Object> get props => [];
}


class IncreaseMyCoins extends UserloginEvent {
  int Coins;
  IncreaseMyCoins({required this.Coins});
  List<Object> get props => [Coins];
}

class ChangeImage extends UserloginEvent {
  final image;
  ChangeImage({required this.image});
  List<Object> get props => [image];
}

class DecreaseMyCoins extends UserloginEvent {
  int Coins;
  DecreaseMyCoins({required this.Coins});
  List<Object> get props => [Coins];
}


class DecreaseMyDiamond extends UserloginEvent {
  int Diamond;
  DecreaseMyDiamond({required this.Diamond});
  List<Object> get props => [Diamond];
}
class IncreaseMyDiamond extends UserloginEvent {
  int Diamond;
  IncreaseMyDiamond({required this.Diamond});
  List<Object> get props => [Diamond];
}

class UpdateMyvip extends UserloginEvent {
  final sales;
  UpdateMyvip({required this.sales});
  List<Object> get props => [sales];
}
class UpdateMyFrameEvent extends UserloginEvent {
  SalesModel Frame;
  UpdateMyFrameEvent({required this.Frame});
  List<Object> get props => [Frame];
}
class RemoveMyFrameEvent extends UserloginEvent {

  RemoveMyFrameEvent();
  List<Object> get props => [];
}
class RemoveMyEntryEvent extends UserloginEvent {

  RemoveMyEntryEvent();
  List<Object> get props => [];
}
class UpdateMyEntryEvent extends UserloginEvent {
  SalesModel Entry;
  UpdateMyEntryEvent({required this.Entry});
  List<Object> get props => [Entry];
}

class UpdateMyProfileEvent extends UserloginEvent {
  final name;
  final discript;
  final flag;
  final country;
  final date;

  UpdateMyProfileEvent({required this.name,required this.discript,required this.flag,required this.country,required this.date });
  List<Object> get props => [name,discript, country,date,flag];
}