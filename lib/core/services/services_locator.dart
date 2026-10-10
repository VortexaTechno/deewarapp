

import 'package:ahlachat/agora/presentation/controller/agora_bloc.dart';
import 'package:ahlachat/chairs/data/datasource/chair_remote_data_source.dart';
import 'package:ahlachat/chairs/data/repository/chair_repository.dart';
import 'package:ahlachat/chairs/domin/repository/base_chair_repository.dart';
import 'package:ahlachat/chairs/domin/usecases/close_mic_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/get_emoje_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/join_chair_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/leave_chair_admin_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/leave_chair_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/lock_chair_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/open_mic_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/send_emoje_usecase.dart';
import 'package:ahlachat/chairs/domin/usecases/unlock_chair_usecase.dart';
import 'package:ahlachat/chairs/presentation/controller/chair_bloc.dart';
import 'package:ahlachat/gift/data/datasource/gift_remote_data_source.dart';
import 'package:ahlachat/gift/data/repository/gift_repository.dart';
import 'package:ahlachat/gift/domin/repository/base_gift_repository.dart';
import 'package:ahlachat/gift/domin/usecases/get_gifts_usecase.dart';
import 'package:ahlachat/gift/domin/usecases/send_gifts_usecase.dart';
import 'package:ahlachat/gift/presentation/controller/gift_bloc.dart';
import 'package:ahlachat/leaderboard/data/datasource/leaderboard_remote_data_source.dart';
import 'package:ahlachat/leaderboard/data/repository/leaderboard_repository.dart';
import 'package:ahlachat/leaderboard/domin/repository/base_leaderboard_repository.dart';
import 'package:ahlachat/leaderboard/domin/usecases/get_daile_leaderboard_usecase.dart';
import 'package:ahlachat/leaderboard/domin/usecases/get_week_leaderboard_usecase.dart';
import 'package:ahlachat/leaderboard/presentation/controller/leaderboard_bloc.dart';
import 'package:ahlachat/profile/data/datasource/my_profile_remote_data_source.dart';
import 'package:ahlachat/profile/data/repository/my_profile_repository.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:ahlachat/profile/domin/usecases/get_friends_usecase.dart';
import 'package:ahlachat/profile/domin/usecases/get_level_use_case.dart';
import 'package:ahlachat/profile/domin/usecases/get_medal_use_case.dart';
import 'package:ahlachat/profile/domin/usecases/submit_feedback_use_case.dart';
import 'package:ahlachat/profile/domin/usecases/update_profile_image_usecase.dart';
import 'package:ahlachat/profile/domin/usecases/update_profile_usecase.dart';
import 'package:ahlachat/pusher/presentation/controller/pusher_bloc.dart';
import 'package:ahlachat/recharge/data/datasource/recharge_remote_data_source.dart';
import 'package:ahlachat/recharge/data/repository/recharge_repository.dart';
import 'package:ahlachat/recharge/domin/repository/base_recharge_repository.dart';
import 'package:ahlachat/recharge/domin/usecases/exchange_diamond_use_case.dart';
import 'package:ahlachat/recharge/domin/usecases/exchange_history_use_case.dart';
import 'package:ahlachat/recharge/domin/usecases/recharge_history_use_case.dart';
import 'package:ahlachat/recharge/presentation/controller/recharge_bloc.dart';
import 'package:ahlachat/room/data/datasource/room_remote_data_source.dart';
import 'package:ahlachat/room/data/repository/room_repository.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:ahlachat/room/domin/usecases/Search_member_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/check_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/enter_password_usecase.dart';
import 'package:ahlachat/room/domin/usecases/follow_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/get_kicked_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/get_room_const_usecase.dart';
import 'package:ahlachat/room/domin/usecases/get_rooms_usecase.dart';
import 'package:ahlachat/room/domin/usecases/invite_user_to_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/join_member_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/join_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/kick_user_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/leave_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/un_follow_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/unkick_user_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/update_room_background_image_usecase.dart';
import 'package:ahlachat/room/domin/usecases/update_room_descripe_usecase.dart';
import 'package:ahlachat/room/domin/usecases/update_room_image_usecase.dart';
import 'package:ahlachat/room/domin/usecases/update_room_name_usecase.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/roomchat/data/datasource/chat_room_data_source.dart';
import 'package:ahlachat/roomchat/data/repository/chat_room_repository.dart';
import 'package:ahlachat/roomchat/domin/repository/base_chat_room_repository.dart';
import 'package:ahlachat/roomchat/domin/usecases/get_room_Inbox_message_usecase.dart';
import 'package:ahlachat/roomchat/domin/usecases/send_room_message_usecase.dart';
import 'package:ahlachat/roomchat/presentation/controller/roomchat_bloc.dart';
import 'package:ahlachat/shop/data/datasource/shop_remote_data_source.dart';
import 'package:ahlachat/shop/data/repository/shop_repository.dart';
import 'package:ahlachat/shop/domin/repository/base_shop_repository.dart';
import 'package:ahlachat/shop/domin/usecases/buy_item_usecase.dart';
import 'package:ahlachat/shop/domin/usecases/get_mine_item_usecae.dart';
import 'package:ahlachat/shop/domin/usecases/get_shop_package_usecase.dart';
import 'package:ahlachat/shop/domin/usecases/send_item_usecase.dart';
import 'package:ahlachat/shop/domin/usecases/un_wear_item_usecase.dart';
import 'package:ahlachat/shop/domin/usecases/wear_item_usecase.dart';
import 'package:ahlachat/shop/presentation/controller/shop_bloc.dart';
import 'package:ahlachat/svga/presentation/controller/svga_bloc.dart';
import 'package:ahlachat/userprofile/data/datasource/use_profile_remote_data_source.dart';
import 'package:ahlachat/userprofile/data/repository/user_profile_repository.dart';
import 'package:ahlachat/userprofile/domin/repository/base_user_profile_repository.dart';
import 'package:ahlachat/userprofile/domin/usecases/delete_user_image_profile_usecase.dart';
import 'package:ahlachat/userprofile/domin/usecases/follow_user_usecase.dart';
import 'package:ahlachat/userprofile/domin/usecases/get_user_profile_in_room_usecase.dart';
import 'package:ahlachat/userprofile/domin/usecases/get_user_profile_usecase.dart';
import 'package:ahlachat/userprofile/domin/usecases/upload_new_profile_image_usecase.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:ahlachat/users/data/datasource/user_remote_data_source.dart';
import 'package:ahlachat/users/data/repository/user_repository.dart';
import 'package:ahlachat/users/domin/repository/base_users_repository.dart';
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
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:ahlachat/vip/data/datasource/vip_shop_remote_data_source.dart';
import 'package:ahlachat/vip/data/repository/vip_shop_repository.dart';
import 'package:ahlachat/vip/domin/repository/base_vip_shop_repository.dart';
import 'package:ahlachat/vip/domin/usecases/buy_vip_use_case.dart';
import 'package:ahlachat/vip/domin/usecases/get_vip_shop_use_case.dart';
import 'package:ahlachat/vip/domin/usecases/remove_vip_use_case.dart';
import 'package:ahlachat/vip/domin/usecases/use_vip_use_case.dart';
import 'package:ahlachat/vip/presentation/controller/vip_bloc.dart';

import 'package:get_it/get_it.dart';

import '../../profile/domin/usecases/get_fans_usecase.dart';
import '../../profile/domin/usecases/get_followed_usecase.dart';
import '../../profile/presentation/controller/my_profile_bloc.dart';


final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(() => UserloginBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => MyProfileBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => ShopBloc(sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => VipBloc(sl(),sl(),sl(),sl()));
    sl.registerFactory(() => RechargeBloc(sl(),sl(),sl()));
    sl.registerFactory(() => RoomBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => UserProfileBloc(sl() ,sl(),sl(),sl()));
    sl.registerFactory(() => AgoraBloc());
    sl.registerFactory(() => PusherBloc());

    sl.registerFactory(() => SvgaBloc());

    sl.registerFactory(() => RoomchatBloc(sl(),sl()));

    sl.registerFactory(() => GiftBloc(sl(),sl()));

    sl.registerFactory(() => ChairBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));

    sl.registerFactory(() => LeaderboardBloc(sl(),sl()));

    //------------------------------------------------------------------------------------------------------
    sl.registerLazySingleton(() =>    GetGiftUseCase(sl()));
    sl.registerLazySingleton(() =>    GetDaileleaderboardUseCase(sl()));
    sl.registerLazySingleton(() =>    GetweekleaderboardUseCase(sl()));
    sl.registerLazySingleton(() =>    SendGiftUseCase(sl()));

    sl.registerLazySingleton(() =>    GetInboxRoomsUseCase(sl()));

    sl.registerLazySingleton(() =>    GetKickRoomsUseCase(sl()));
    sl.registerLazySingleton(() =>    FollowUserUseCase(sl()));
    sl.registerLazySingleton(() =>    UnFollowUserUseCase(sl()));
    sl.registerLazySingleton(() =>    GetUserProfileinroomUseCase(sl()));

    sl.registerLazySingleton(() =>    LeaveChairAdminUseCase(sl()));

    sl.registerLazySingleton(() =>    KickUserRoomsUseCase(sl()));
    sl.registerLazySingleton(() =>    UnKickUserRoomsUseCase(sl()));

    sl.registerLazySingleton(() =>    SendMessageRoomsUseCase(sl()));

    sl.registerLazySingleton(() =>    SendEmojeUseCase(sl()));
    sl.registerLazySingleton(() =>    GetEmojeUseCase(sl()));

    sl.registerLazySingleton(() =>    OpenMicUseCase(sl()));
    sl.registerLazySingleton(() =>    CloseMicUseCase(sl()));

    sl.registerLazySingleton(() =>    JoinChairUseCase(sl()));
    sl.registerLazySingleton(() =>    LeaveChairUseCase(sl()));


    sl.registerLazySingleton(() =>    LockChairUseCase(sl()));
    sl.registerLazySingleton(() =>    UnLockChairUseCase(sl()));


    sl.registerLazySingleton(() =>    SearchMemberRoomsUseCase(sl()));


    sl.registerLazySingleton(() =>    UpdateRoomnameUseCase(sl()));

    sl.registerLazySingleton(() =>    MemberRoomsUseCase(sl()));

    sl.registerLazySingleton(() =>    LeaveRoomsUseCase(sl()));

    sl.registerLazySingleton(() =>    FollowRoomsUseCase(sl()));
    sl.registerLazySingleton(() =>    UnFollowRoomsUseCase(sl()));
    sl.registerLazySingleton(() =>    CheckRoomsUseCase(sl()));
    sl.registerLazySingleton(() =>    GetRoomConstUseCase(sl()));
    sl.registerLazySingleton(() =>    GetRoomsUseCase(sl()));
    sl.registerLazySingleton(() =>    ExchangeDiamondUseCase(sl()));
    sl.registerLazySingleton(() =>    UpdateProfileUseCase(sl()));
    sl.registerLazySingleton(() =>    UpdateRoomImageUseCase(sl()));
    sl.registerLazySingleton(() =>    UpdateRoombackgroundImageUseCase(sl()));

    sl.registerLazySingleton(() =>    EnterPasswordRoomsUseCase(sl()));

    sl.registerLazySingleton(() =>    UpdateRoomdescripeUseCase(sl()));

    sl.registerLazySingleton(() =>    InviteToRoomUseCase(sl()));
    sl.registerLazySingleton(() =>    JoinRoomsUseCase(sl()));

    sl.registerLazySingleton(() =>    UpdateProfileImageUseCase(sl()));

    sl.registerLazySingleton(() =>    RechargeHistoryUseCase(sl()));
    sl.registerLazySingleton(() =>    GetMedalUseCase(sl()));
    sl.registerLazySingleton(() =>    SubmitFeedbackUseCase(sl()));
    sl.registerLazySingleton(() =>    AddPhoneAccountCodeUseCase(sl()));
    sl.registerLazySingleton(() =>    GetLevelUseCase(sl()));
    sl.registerLazySingleton(() =>    UnBinnedPhoneUseCase(sl()));
    sl.registerLazySingleton(() =>    ExchangeHistoryUseCase(sl()));
    sl.registerLazySingleton(() =>    BuyVipUseCase(sl()));
    sl.registerLazySingleton(() =>    UseVipUseCase(sl()));
    sl.registerLazySingleton(() =>    RemoveVipUseCase(sl()));
    sl.registerLazySingleton(() =>    DeleteImageProfileUseCase(sl()));
    sl.registerLazySingleton(() =>    GetUserProfileUseCase(sl()));

    sl.registerLazySingleton(() =>    UploadImageProfileUseCase(sl()));

    sl.registerLazySingleton(() =>    GetVipShopUseCase(sl()));
    sl.registerLazySingleton(() =>    GetShopPackageUseCase(sl()));
    sl.registerLazySingleton(() =>    GetMineItemUseCase(sl()));
    sl.registerLazySingleton(() =>    WearItemUseCase(sl()));
    sl.registerLazySingleton(() =>    UnWearItemUseCase(sl()));
    sl.registerLazySingleton(() =>    BuyItemUseCase(sl()));
    sl.registerLazySingleton(() =>    SendItemUseCase(sl()));
    sl.registerLazySingleton(() =>    GetFriendsUseCase(sl()));
    sl.registerLazySingleton(() =>    GetFollowedUseCase(sl()));
    sl.registerLazySingleton(() =>    GetFanUseCase(sl()));



    sl.registerLazySingleton(() =>    GetMyUserProfileUseCase(sl()));
    sl.registerLazySingleton(() =>    LogOutUseCase(sl()));
    sl.registerLazySingleton(() =>    FirebaseGoogleUserAuthUseCase(sl()));
    sl.registerLazySingleton(() =>    SendCodeAgainUseCase(sl()));
    sl.registerLazySingleton(() =>    SendForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() =>    ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() =>    UpdatePasswordUseCase(sl()));
    sl.registerLazySingleton(() =>    EnterLoginCodeUseCase(sl()));
    sl.registerLazySingleton(() =>    GoogleUserAuthUseCase(sl()));
    sl.registerLazySingleton(() =>    LoginUserPhoneUseCase(sl()));
    sl.registerLazySingleton(() =>    SentCodeForSignupUseCase(sl()));
    sl.registerLazySingleton(() =>    EnterSignupCodeUseCase(sl()));
    sl.registerLazySingleton(() =>    RegisterNewAccountUseCase(sl()));
    //------------------------------------Repository


    sl.registerLazySingleton<BaseleaderboardRepository>(() => leaderboardRepository(sl()));

    sl.registerLazySingleton<BaseRechargRepository>(() => RechargeRepository(sl()));
    sl.registerLazySingleton<BasegiftRepository>(() => giftRepository(sl()));
    sl.registerLazySingleton<BaseUsersRepository>(() => UserRepository(sl()));
    sl.registerLazySingleton<BaseMyProfileRepository>(() => MyProfileRepository(sl()));
    sl.registerLazySingleton<BaseShopRepository>(() => ShopRepository(sl()));
    sl.registerLazySingleton<BaseVipRepository>(() => VipRepository(sl()));
    sl.registerLazySingleton<BaseUsersProfileRepository>(() => UserProfileRepository(sl()));
    sl.registerLazySingleton<BaseRoomRepository>(() => RoomRepository(sl()));
    sl.registerLazySingleton<BaseChairRepository>(() => ChairRepository(sl()));
    sl.registerLazySingleton<BaseChatRoomRepository>(() => ChatRoomRepository(sl()));
    //------------------------------------RemoteDataSource
    sl.registerLazySingleton<BaseRechargeRemoteDataSource>(() => RechargeRemoteDataSource());
    sl.registerLazySingleton<BaseMyProfileRemoteDataSource>(() => MyProfileRemoteDataSource());
    sl.registerLazySingleton<BaseShopRemoteDataSource>(() => ShopRemoteDataSource());
    sl.registerLazySingleton<BaseUserRemoteDataSource>(() => UserRemoteDataSource());
    sl.registerLazySingleton<BaseVipShopRemoteDataSource>(() => VipRemoteDataSource());
    sl.registerLazySingleton<BaseUserProfileRemoteDataSource>(() => UserProfileRemoteDataSource());
    sl.registerLazySingleton<BaseRoomRemoteDataSource>(() => RoomRemoteDataSource());
    sl.registerLazySingleton<BaseChairRemoteDataSource>(() => ChairRemoteDataSource());

    sl.registerLazySingleton<BasegiftRemoteDataSource>(() => giftRemoteDataSource());

    sl.registerLazySingleton<BaseleaderboardRemoteDataSource>(() => leaderboardRemoteDataSource());

    sl.registerLazySingleton<BaseChatRoomDataSource>(() => ChatRoomRemoteDataSource());

  }}
