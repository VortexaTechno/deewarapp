import 'dart:convert';

import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/vip/data/models/VipContentModel.dart';
import 'package:ahlachat/vip/data/models/VipTapsModel.dart';

class Images {

  static const String  icon_follow ='assets/image/Profile/icon_follow.png';
  static const String  icon_huili ='assets/image/Profile/icon_huili.png';
  static const String  icon_msg ='assets/image/Profile/icon_msg.png';
  static const String  gift_count_one ='assets/image/room/gift_count_one.png';
  static const String  gift_count_seven ='assets/image/room/gift_count_seven.png';
  static const String  gift_count_seven_seven ='assets/image/room/gift_count_seven_seven.png';
  static const String  gift_count_seven_seven_seven ='assets/image/room/gift_count_seven_seven_seven.png';
  static const String  ic_ranking_room_headet ='assets/image/room/ic_ranking_room_header_first.png';

  static const String  bg_cover_blind ='assets/image/chat/bg_hotlives_entry_family.png';
  static const String  bg_cover_truth ='assets/image/chat/bg_hotlives_entry_topboard.png';



  static const String  sticker_countdown ='assets/image/game/sticker_countdown.png';
  static const String  sticker_dice ='assets/image/game/sticker_dice_1.png';
  static const String  sticker_mora_2 ='assets/image/game/sticker_mora_2.png';
  static const String  sticker_pump_mic ='assets/image/game/sticker_pump_mic.png';


  static const String  unselected ='assets/image/room/dating_dislike_unselected.png';

  static const String  Tears_of_Joy ='assets/image/game/Tears_of_Joy.gif';

  static const String  send_icon ='assets/image/room/dating_im_send_icon.png';

  static const String  Mic ='assets/image/room/bar_mic.png';
  static const String  Mic_disable ='assets/image/room/bar_mic_disable.png';
  static const String  bar_more ='assets/image/room/bar_more.png';
  static const String  Volume ='assets/image/room/bar_volume.png';
  static const String  Volume_disable ='assets/image/room/bar_volume_disable.png';
  static const String  Chat_Message ='assets/image/room/chat_message.png';

  static const String  bar_chat ='assets/image/room/bar_chat.png';
  static const String  bar_emoji ='assets/image/room/bar_emoji.png';

  static const String  gift_icon ='assets/image/room/gift_icon.svga';

  static const String  LockChair ='assets/image/room/ic_live_seat_lock.png';

  static const String  Chair ='assets/image/room/ic_live_seat_add_56.png';
  static const String  logo = 'assets/image/App/KokyLogo.jpeg';
  static const String  FollowRoom = 'assets/image/room/follow.png';
  static const String  UnFollowRoom = 'assets/image/room/unfollow.png';
  static const String  ShareRoom = 'assets/image/room/share2_h.png';
  static const String  fun_setting = 'assets/image/room/fun_setting.png';
  static const String  ExitRoom = 'assets/image/room/icon_exit.png';
  static const String  facebook_h ='assets/image/room/facebook_h.png';
  static const String  whatsapp_h ='assets/image/room/whatsapp_h.png';
  static const String  ins_h ='assets/image/room/ins_h.png';
  static const String  LoginEffect = 'assets/image/backgrounds/login_bg.svga';
  static const String  LoginBackground ='assets/image/backgrounds/img_main_me_background.jpg';
  static const String  Rocket ='assets/image/App/Rocket.png';
  static const String  HomeIcon ='assets/image/NavBar/icon_shouye.png';
  static const String  MessageIcon ='assets/image/NavBar/icon_xiaoxi.png';
  static const String  ExploreIcon ='assets/image/NavBar/icon_faixan.png';
  static const String  ProfileIcon ='assets/image/NavBar/icon_wode.png';
  static const String  CheckRoom ='assets/image/NavBar/icon_kaizhibo_selected.png';
  static const String  HomeIconSelect ='assets/image/NavBar/icon_shouye_selected.png';
  static const String  MessageIconSelect ='assets/image/NavBar/icon_xiaoxi_selected.png';
  static const String  ProfileIconSelect ='assets/image/NavBar/icon_wode_selected.png';
  static const String  ExploreIconSelect ='assets/image/NavBar/icon_faixan_selected.png';
  static const String  IconAudio ='assets/image/App/ic_me_icon_audio.png';
  static const String  IconMall ='assets/image/App/ic_me_icon_mall.png';
  static const String  IconVip ='assets/image/App/ic_me_icon_vip.png';
  static const String  IconSetting ='assets/image/App/ic_me_settings.png';
  static const String  IconMedal ='assets/image/App/ic_mine_user_medal.png';
  static const String  IconFeedback ='assets/image/App/me_icon_feedback.png';
  static const String  IconLevel ='assets/image/App/ic_me_gradee.png';
  static const String  ProfileAgency ='assets/image/Profile/bg_mine_agency.png';
  static const String  ProfileIncome ='assets/image/Profile/bg_mine_income.png';
  static const String  Coins ='assets/image/App/com_ic_coin.png';
  static const String  diamond ='assets/image/charge/ic_small_diamond.png';
  static const String  search ='assets/image/App/ic_tb_action_search_dark.png';
  static const String  leaderboard ='assets/image/App/ic_nav_leaderboard_24.png';
  static const String  ShopBackground = 'assets/image/shop/ic_shop_edit_bg.jpg';
  static const String  vipBack = 'assets/image/vip/vipBack.png';
  static const String  vipBack2 = 'assets/image/vip/vipBack2.png';
  static const String  vipBack3 = 'assets/image/vip/vipBack3.png';
  static const String  vipAssetsContent1 ='${AppConstance.vopImageUrl}vipAssetsContent1.png';
  static const String  vipAssetsContent2 ='${AppConstance.vopImageUrl}vipAssetsContent2.png';
  static const String  vipAssetsContent3 ='${AppConstance.vopImageUrl}vipAssetsContent3.png';
  static const String  vipAssetsContent4 ='${AppConstance.vopImageUrl}vipAssetsContent4.png';
  static const String  vipAssetsContent5 ='${AppConstance.vopImageUrl}vipAssetsContent5.png';
  static const String  vipAssetsContent6 ='${AppConstance.vopImageUrl}vipAssetsContent6.png';
  static const String  vipAssetsContent7 ='${AppConstance.vopImageUrl}vipAssetsContent7.png';
  static const String  vipAssetsContent8 ='${AppConstance.vopImageUrl}vipAssetsContent8.png';
  static const String  vipAssetsContent ='${AppConstance.vopImageUrl}vipGodKingContent.png';
  static const String  vipAssetsContent10 ='${AppConstance.vopImageUrl}vipAssetsContent10.png';
  static const String  vipAssetsContent11 ='${AppConstance.vopImageUrl}vipAssetsContent11.png';
  static const String  vipAssetsContent12 ='${AppConstance.vopImageUrl}vipAssetsContent12.png';
  static const String  vipAssetsContent13 ='${AppConstance.vopImageUrl}vipAssetsContent13.png';
  static const String  vipAssetsContent14 ='${AppConstance.vopImageUrl}vipAssetsContent14.png';
  static const String  vipAssetsContent15 ='${AppConstance.vopImageUrl}vipAssetsContent15.png';
  static const String  vipAssetsContent16 ='${AppConstance.vopImageUrl}vipAssetsContent16.png';
  static const String  vipAssetsContent17 ='${AppConstance.vopImageUrl}vipAssetsContent17.png';
  static const String  vipAssetsTap19 ='${AppConstance.vopImageUrl}vipAssetsTitleLight19.png';
  static const String  vipAssetsTap18 ='${AppConstance.vopImageUrl}vipAssetsTitleLight18.png';
  static const String  vipAssetsTap5 ='${AppConstance.vopImageUrl}vipAssetsTitleLight5.png';
  static const String  vipAssetsTap6 ='${AppConstance.vopImageUrl}vipAssetsTitleLight6.png';
  static const String  vipAssetsTap7 ='${AppConstance.vopImageUrl}vipAssetsTitleLight7.png';
  static const String  vipAssetsTap14 ='${AppConstance.vopImageUrl}vipAssetsTitleLight14.png';
  static const String  vipAssetsTap17 ='${AppConstance.vopImageUrl}vipAssetsTitleLight17.png';
  static const String  vipAssetsTap4 ='${AppConstance.vopImageUrl}vipAssetsTitleLight4.png';
  static const String  vipAssetsTap11 ='${AppConstance.vopImageUrl}vipAssetsTitleLight11.png';
  static const String  vipAssetsTap12 ='${AppConstance.vopImageUrl}vipAssetsTitleLight12.png';
  static const String  vipAssetsTap15 ='${AppConstance.vopImageUrl}vipAssetsTitleLight15.png';
  static const String  vipAssetsTap22 ='${AppConstance.vopImageUrl}vipAssetsTitleLight22.png';
  static const String  vipAssetsTap23 ='${AppConstance.vopImageUrl}vipAssetsTitleLight23.png';
  static const String  vipAssetsTap19F ='${AppConstance.vopImageUrl}vipAssetsTitleLight19F.png';
  static const String  vipAssetsTap18F ='${AppConstance.vopImageUrl}vipAssetsTitleLight18F.png';
  static const String  vipAssetsTap5F='${AppConstance.vopImageUrl}vipAssetsTitleLight5F.png';
  static const String  vipAssetsTap6F ='${AppConstance.vopImageUrl}vipAssetsTitleLight6F.png';
  static const String  vipAssetsTap7F ='${AppConstance.vopImageUrl}vipAssetsTitleLight7F.png';
  static const String  vipAssetsTap14F ='${AppConstance.vopImageUrl}vipAssetsTitleLight14F.png';
  static const String  vipAssetsTap17F ='${AppConstance.vopImageUrl}vipAssetsTitleLight17F.png';
  static const String  vipAssetsTap4F ='${AppConstance.vopImageUrl}vipAssetsTitleLight4F.png';
  static const String  vipAssetsTap11F ='${AppConstance.vopImageUrl}vipAssetsTitleLight11F.png';
  static const String  vipAssetsTap12F ='${AppConstance.vopImageUrl}vipAssetsTitleLight12F.png';
  static const String  vipAssetsTap15F ='${AppConstance.vopImageUrl}vipAssetsTitleLight15F.png';
  static const String  vipAssetsTap22F ='${AppConstance.vopImageUrl}vipAssetsTitleLight22F.png';
  static const String  vipAssetsTap23F ='${AppConstance.vopImageUrl}vipAssetsTitleLight23F.png';
  static const String  vipStar = 'assets/image/vip/modulemine_full_star.png';
  static const String  ic_wallet='assets/image/charge/ic_wallet_right.png';
  static const String  ic_wallet_bg='assets/image/charge/ic_wallet_charge_bg.png';
  static const String  ic_withdraw_bg='assets/image/charge/ic_wallet_withdraw_bg.png';
  static const String  ic_g1='assets/image/Profile/g1.png';
  static const String  icequip='assets/image/Profile/equip_noble_icon_baron.png';
  static const String  income_icon_level='assets/image/Profile/meili_img_bg@2x.png';
  static const String  wealth_icon_level='assets/image/Profile/caifu_img_bg.png';
  static const String  google_ic_b='assets/image/Profile/icon_google.png';
  static const String  google_ic='assets/image/Profile/setting_icon_google.png';
  static const String  male_ic='assets/image/Profile/ic_room_male.png';
  static const String  femal_ic='assets/image/Profile/ic_room_female.png';
  static const String  male_bg='assets/image/room/male_bg.png';
  static const String  female_bg='assets/image/room/female_bg.png';
  static const String  all_='assets/image/room/all_bg.png';


  static const String  ic_room_exception= 'assets/image/App/ic_room_exception.png';
  static const String ic_image= 'assets/image/App/image.png';
  static const String ic_edit= 'assets/image/Profile/ic_pwd_edit.png';
  static const String room_locak= 'assets/image/App/roomlocak.png';
  static const String vip_room_frame= 'assets/image/App/room_rank_head_1.png';
  static const String   live= 'assets/image/NavBar/ic_hk_voice.svga';
  static const String   exitroom= 'assets/image/room/ic_audio_room_exit.png';
  static const String   saveroom= 'assets/image/room/ic_audio_room_minimize.png';
  static const String   reportroom= 'assets/image/room/ic_audio_room_report.png';
  static const String   roomrank= 'assets/image/room/room_rank_cup.png';






}

List<VipContentModel>vipAssetsContent=[
  VipContentModel(Image:Images.vipAssetsContent17,Content: 'Exclusive frames' ,MainTitle: 'Special Frame',icon:Images.vipAssetsTap19,Bicon:Images.vipAssetsTap19 ),
  VipContentModel(Image:Images.vipAssetsContent10,Content: 'Exclusive medals' ,MainTitle: 'Special Medal',icon:Images.vipAssetsTap5,Bicon: Images.vipAssetsTap5F ),
  VipContentModel(Image:Images.vipAssetsContent7,Content: 'Exclusive Entrance' ,MainTitle: 'Special Entrance',icon:Images.vipAssetsTap6,Bicon:Images.vipAssetsTap6F),
  VipContentModel(Image:Images.vipAssetsContent3,Content: 'Exclusive Name Cards' ,MainTitle: 'Special Name Card',icon:Images.vipAssetsTap7,Bicon:Images.vipAssetsTap19F),
  VipContentModel(Image:Images.vipAssetsContent1,Content: 'Be different than the rest of the users with a different writing color' ,MainTitle: 'Font Color',icon:Images.vipAssetsTap14, Bicon:Images.vipAssetsTap14F),
  VipContentModel(Image:Images.vipAssetsContent2,Content: 'Exclusive gifts for Aristocracy' ,MainTitle: 'Special Gifts',icon:Images.vipAssetsTap17,Bicon:Images.vipAssetsTap17F),
  VipContentModel(Image:Images.vipAssetsContent5,Content: 'Notice in rooms' ,MainTitle: 'Room Announcement',icon:Images.vipAssetsTap4,Bicon:Images.vipAssetsTap4F),
  VipContentModel(Image:Images.vipAssetsContent12,Content: 'Speak freely and no one will be able to stop you' ,MainTitle: 'Anti-silence',icon:Images.vipAssetsTap11,Bicon:Images.vipAssetsTap11F),
  VipContentModel(Image:Images.vipAssetsContent13,Content: 'Cannot be kicked out of the room' ,MainTitle: 'Anti-kick',icon:Images.vipAssetsTap12,Bicon:Images.vipAssetsTap12F),
  VipContentModel(Image:Images.vipAssetsContent6,Content: 'Special ID with different types A/B/D/S' ,MainTitle: 'Special ID',icon:Images.vipAssetsTap15 ,Bicon:Images.vipAssetsTap15F),
  VipContentModel(Image:Images.vipAssetsContent,Content: 'The room you will be in this frame' ,MainTitle: 'Room Frame',icon:Images.vipAssetsTap22,Bicon:Images.vipAssetsTap22F),
  VipContentModel(Image:Images.vipAssetsContent16,Content: 'Once You enter online,everyone will know your presence' ,MainTitle: 'Online Notice',icon:Images.vipAssetsTap18, Bicon:Images.vipAssetsTap18F),
  VipContentModel(Image:Images.vipAssetsContent11,Content: 'Recharge and get extra diamonds' ,MainTitle: 'Bonus',icon:Images.vipAssetsTap23,Bicon:Images.vipAssetsTap23F),
];





