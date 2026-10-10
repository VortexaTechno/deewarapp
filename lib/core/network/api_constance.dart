

import 'package:ahlachat/core/utils/app_constance.dart';

class ApiConstance {
  /// Kept separate so an API gateway can be supplied if needed.
  /// Defaults to the Laravel project's configured public host.
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://deewar.egyptiantechs.com/api',
  );


  static const String LoginByPhoneNum =
      "$baseUrl/auth/PhoneLogin";
  static const String GoogleAuth =
      "$baseUrl/auth/GoogleAuth";
  static const String MyProfile =
      "$baseUrl/auth/profile";
  static const String LogOut =
      "$baseUrl/auth/logout";
  static const String EnterCodeLogin =
      "$baseUrl/auth/EnterCodeLogin";
  static const String SendCodeAgain =
      "$baseUrl/auth/SendCodeAgain";

  static const String SentCodeForSignup =
      "$baseUrl/auth/SentCodeForSignup";
  static const String EntercodeSignup =
      "$baseUrl/auth/EntercodeSignup";
  static const String EntercodeAddAccount =
      "$baseUrl/auth/EntercodeAddPhoneSignup";


  static const String UnBinned =
      "$baseUrl/auth/UnBineedPhone";
  static const String Register =
      "$baseUrl/auth/Register";
  static const String SendCodeforgetpassword =
      "$baseUrl/auth/SendCodeForgetPassword";
  static const String ForgetPassword =
      "$baseUrl/auth/ForgetPassword";
  static const String UpdatePassword =
      "$baseUrl/auth/UpdatePassword";
  static const String GetMyFriend =
      "$baseUrl/user/GetMyFriend";

  static const String UserProfile =
      "$baseUrl/profile/UserProfile";

  static const String User_Profile_Room =
      "$baseUrl/profile/User_Profile_Room";

  static const String DeleteProfileImag =
      "$baseUrl/profile/DeleteProfileImage";

  static const String AddProfileImage =
      "$baseUrl/profile/AddProfileImage";

  static const String follow_user =
      "$baseUrl/user/follow_user";

  static const String un_follow_user =
      "$baseUrl/user/un_follow_user";


  static const String UpdateProfileImage =
      "$baseUrl/user/UpdateProfileImage";
  static const String UpdateProfile =
      "$baseUrl/user/UpdateProfile";
  static const String GetMoreMyFriend =
      "$baseUrl/user/GetMyFriend";
  static const String GetMyFollowed =
      "$baseUrl/user/GetMyFollowed";
  static const String GetMyFan =
      "$baseUrl/user/GetMyFans";
  static const String GetMedal =
      "$baseUrl/shop/GetMedal";
  static const String GetShopPackages =
      "$baseUrl/shop/GetShopPackages";
  static const String GetMineItemPackages =
      "$baseUrl/shop/getmyitem";
  static const String PurchaseItem =
      "$baseUrl/shop/PurchaseItem";
  static const String SendItem =
      "$baseUrl/shop/SendItemToFriend";
  static const String WearItem =
      "$baseUrl/shop/wearitem";
  static const String UnWearItem =
      "$baseUrl/shop/unwearitem";
  static const String GetVipShopPackage =
      "$baseUrl/vip/GetVipShop";
  static const String BuyVipSPackage =
      "$baseUrl/vip/PurchaseVip";
  static const String UseVip =
      "$baseUrl/vip/UseVip";
  static const String RemoveVip =
      "$baseUrl/vip/RemoveVip";

  static const String Exchangbeans =
      "$baseUrl/charge/Exchangbeans";

  static const String SearchForCharge =
      "$baseUrl/charge/SearchForCharge";

  static const String SearchForExchange =
      "$baseUrl/charge/SearchForExhange";
  static const String GetLevel =
      "$baseUrl/level/GetLevel";
  static const String SubmitFeedBack =
      "$baseUrl/user/FeedBack";

  static const String GetRoomConst =
      "$baseUrl/room/GetRoomConst";

  static const String GetVoiceRooms=
      "$baseUrl/room/show_voice_rooms";


  static const String CheckVoiceRoom=
      "$baseUrl/room/check_new_room";




  static const String JoinVoiceRoom=
      "$baseUrl/room/Join_Voice_Room";

  static const String EnterPasswordVoiceRoom=
      "$baseUrl/room/Enter_Password_Join_Voice_Room";

  static const String UnFollow_Voice_Room=
      "$baseUrl/room/UnFollow_Voice_Room";
  static const String Follow_Voice_Room=
      "$baseUrl/room/Follow_Voice_Room";

  static const String Invite_For_Room=
      "$baseUrl/room/Invite_For_Room";
  static const String UpdateroomImage =
      "$baseUrl/room/Update_Room_Image";

  static const String UpdateBackgroundImage =
      "$baseUrl/room/Update_Room_BackgroundImage";
  static const String UpdateRoomname =
      "$baseUrl/room/Update_Room_name";

  static const String UpdateRoomdescribe =
      "$baseUrl/room/Update_Room_describe";



  static const String LeaveVoiceRoom =
      "$baseUrl/room/Leave_Voice_Room";

  static const String GetJoinMemberRoom =
      "$baseUrl/room/Get_Join_Member_Room?page=";
  static String GetJoinMember() => '$GetJoinMemberRoom$JoinNextPage';


  static const String Search_Mmeber_Room =
      "$baseUrl/room/Search_Mmeber_Room";


  static const String lock_Chair =
      "$baseUrl/chair/lock_Chair";
  static const String Un_lock_Chair =
      "$baseUrl/chair/Un_lock_Chair";


  static const String Take_Seat_Chair =
      "$baseUrl/chair/Take_Seat_Chair";
  static const String Leave_Seat_Chair =
      "$baseUrl/chair/Leave_Seat_Chair";
  static const String Leave_Seat_Chair_admin =
      "$baseUrl/chair/Leave_Seat_Chair_Admin";


  static const String Open_Mic_Chair =
      "$baseUrl/chair/Open_Mic_Chair";
  static const String Close_Mic_Chair =
      "$baseUrl/chair/Close_Mic_Chair";


  static const String Emoje_Call =
      "$baseUrl/chair/Emoje_Call";


  static const String Get_All_Emoje =
      "$baseUrl/chair/Get_All_Emoje";


  static const String Send_Message_To_Room =
      "$baseUrl/chair/Send_Message_To_Room";


  static const String Kick_Host =
      "$baseUrl/room/Kick_Host";

  static const String Un_Kick_Host =
      "$baseUrl/room/Un_Kick_Host";

  static const String Get_Kicked_Host =
      "$baseUrl/room/Get_Kicked_Host";



  static const String GetCagift =
      "$baseUrl/gift/Get_Ca_gift";
  static const String Sent_Gift =
      "$baseUrl/gift/Sent_Gift";

  static const String Room_Day_Rank =
      "$baseUrl/rank/Room_Day_Rank";

  static const String Room_Week_Rank =
      "$baseUrl/rank/Room_Week_Rank";


  static const String Get_Inbox_Room =
      "$baseUrl/chat/Get_Inbox_Room";

}

