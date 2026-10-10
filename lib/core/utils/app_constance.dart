import 'package:ahlachat/core/localization/languagemodel.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
var thiscontext;
String? MyToken;
String? UserId;
String ?RoomId;
String Lang='ar';
bool InRoom=false;
bool JoinChairStatus=false;
int? JoinChairId;
List GiftCount=['1','7','77','777'];

int FollowNextPage=1;
int JoinNextPage=1;
int? SelectedRoomCategory;
final String APP_ID = '8a9f051b1f994a18bda7f6e8fd105e62';
PusherChannelsFlutter GlopelPusher = PusherChannelsFlutter.getInstance();
class AppConstance {
  static const app_name = "ديوار";
  /// Override this at build/run time with `--dart-define=SERVER_URL=...`.
  /// For a physical device on the same network, use the computer's LAN IP.
  static const String basedomin = String.fromEnvironment(
    'SERVER_URL',
    defaultValue: 'https://deewar.egyptiantechs.com',
  );
  static const String BASE_URL = '$basedomin/';
  static const String Image_URL = '$basedomin/images/';
  static const String baseUrl = '$basedomin/api';
  static const String thumbnailsImageUrl = '$basedomin/thumbnails/';
  static const String shopImageUrl = '$basedomin/shopfiels/';
  static const String vopImageUrl = '$basedomin/vip/';
  static const String ImagesUrl = '$basedomin/images/';
  static const String levelImageUrl = '$basedomin/level/';
  static const String EmojeImageUrl = '$basedomin/emoje/';

  static const String bannerImageUrl = '$basedomin/banner/';
  static const String giftsImageUrl = '$basedomin/gifts/';
  static String imagegiftsUrl(String path) => '$giftsImageUrl$path';

  static String imageThumbnailsUrl(String path) => '$thumbnailsImageUrl$path';
  static String imageVipUrl(String path) => '$vopImageUrl$path';
  static String imageShopUrl(String path) => '$shopImageUrl$path';

  static String imageEmojeUrl(String path) => '$EmojeImageUrl$path';

  static String imagelevelUrl(String path) => '$levelImageUrl$path';
  static String BannerlevelUrl(String path) => '$bannerImageUrl$path';
  static String ImageUrl(String path) => '$ImagesUrl$path';
}

class RouteConstance {
  static const splash_screan = "/";
  static const Shop_Screan = "/ShopScrean";

}

 List<LanguageModel> languages = [
  LanguageModel(countryCode: 'US', languageCode: 'en',countryName: 'English'),
  LanguageModel(countryCode: 'SA', languageCode: 'ar',countryName: 'ألعربيه'),
];


