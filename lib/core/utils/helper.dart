import 'dart:convert';
import 'dart:io';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/data/models/levelModel.dart';
import 'package:ahlachat/profile/data/models/medalModel.dart';
import 'package:ahlachat/pusher/presentation/controller/pusher_bloc.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

void SaveTokenAndUserData({String? Token, UserModel? UserData}) async{
  if(Token==null){
    Showtoast(message: 'Token Expired');
  }else{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token',Token);
    if(UserData!=null){
      prefs.setString('UserData',jsonEncode(UserData)) ;
    }
    MyToken=Token;
  }

}

bool CheckRoomOwner({id}){
  if(UserId==id.toString()){
    return true;
  }
  return false;
}
RequestPermissions()async{
  Map<Permission, PermissionStatus> statuses = await [
    Permission.microphone,
    Permission.storage,
  ].request();


}
Future<void> initDynamicLinks() async {}

PusherInit()async{
  await GlopelPusher.init(
    apiKey: "82665959f9718e802a85",
    cluster: "mt1",
    onConnectionStateChange: onConnectionStateChange,
  );
  await GlopelPusher.connect();
  final myBloc = BlocProvider.of<PusherBloc>(NavigationService.CurrentContext);
  myBloc.add(StartUserSocketEvent());
}





void onConnectionStateChange(dynamic currentState, dynamic previousState) {


  if(currentState=='RECONNECTING'){
    Showtoast(message: 'RECONNECTING');

    SystemNavigator.pop();
  }
}

CutName3({required String name,required length}){
  if(name.length >length ){
    return name.substring(0, length)+'...';
  }else{
    return name;
  }

}

void SaveToken({String? Token}) async{
  if(Token==null){
    Showtoast(message: 'Token Expired');
  }else{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token',Token);
    MyToken=Token;
    print(MyToken);
  }

}

 Future<String?>  GetSavedToken() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
  final token=prefs.getString('token');
   if(token==null){
     return null;
   }else{
     return token;
   }
}

 GetSavedUserData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
final data=  prefs.getString('UserData');
if(data!=null){
  return jsonDecode(data);
}
return null;
}

ClearSavedUserData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
String k_m_b_generator(num) {
  if (num > 999 && num < 99999) {
    return "${(num / 1000).toStringAsFixed(1)} K";
  } else if (num > 99999 && num < 999999) {
    return "${(num / 1000).toStringAsFixed(0)} K";
  } else if (num > 999999 && num < 999999999) {
    return "${(num / 1000000).toStringAsFixed(1)} M";
  } else if (num > 999999999) {
    return "${(num / 1000000000).toStringAsFixed(1)} B";
  } else {
    return num.toString();
  }
}

Future<Dio> DioInstance() async {

  Map<String, dynamic> headers = {};
  headers['Content-Type'] = 'application/json';
  headers['RESPONSE-VERSION'] = '2';
  headers['Authorization'] = 'Bearer $MyToken';


  return Dio(
    BaseOptions(receiveDataWhenStatusError: true,
      headers: {
        'Accept': 'application/json',
        'lang':Lang,
        'Authorization':"Bearer ${MyToken??''}",
      },
    ),
  );
}

 AudioPlayer?  player;
PlaySoundUrl({url})async{
     player = AudioPlayer();                   // Create a player
  await player?.setUrl(           // Load a URL
      url,preload: false);                 // Schemes: (https: | file: | asset: )
  await player?.play();
}
StopSoundUrl()async{
  await player?.stop();
  //await player.play();
}


CountLeftDays({required String  Create,required int days}){
  DateTime Data1=DateTime.parse(Create);
  DateTime Data2=DateTime.parse(Create).add(Duration(days: days));
  return Data2.difference(Data1).inDays;
}

ConvertTimeToday({required String Time}){
  DateTime parsedDateTime = DateTime.parse(Time);
  String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDateTime);
  return formattedDate;
}


  List<CheckLevelModel> WealthLevel=  [
  CheckLevelModel(Level:0 ,Amount:00 ,image:  AppConstance.imagelevelUrl('lv0.webp')),
  CheckLevelModel(Level:1 ,Amount:20 ,image: AppConstance.imagelevelUrl('lv1.webp')),
  CheckLevelModel(Level:2 ,Amount:100 ,image: AppConstance.imagelevelUrl('lv2.webp')),
  CheckLevelModel(Level:3 ,Amount:200 ,image: AppConstance.imagelevelUrl('lv3.webp')),
  CheckLevelModel(Level:4 ,Amount:300 ,image: AppConstance.imagelevelUrl('lv4.webp')),
  CheckLevelModel(Level:5 ,Amount:400,image: AppConstance.imagelevelUrl('lv5.webp')),
  CheckLevelModel(Level:6 ,Amount:500 ,image: AppConstance.imagelevelUrl('lv6.webp')),
  CheckLevelModel(Level:7 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv7.webp')),
  CheckLevelModel(Level:8 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv8.webp')),
  CheckLevelModel(Level:9 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv9.webp')),
  CheckLevelModel(Level:10 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv10.webp')),
  CheckLevelModel(Level:11 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv11.webp')),
  CheckLevelModel(Level:12 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv12.webp')),
  CheckLevelModel(Level:13 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv13.webp')),
  CheckLevelModel(Level:14 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv14.webp')),
  CheckLevelModel(Level:15 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv15.webp')),
  CheckLevelModel(Level:16 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv16.webp')),
  CheckLevelModel(Level:17 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv17.webp')),
  CheckLevelModel(Level:18 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv18.webp')),
  CheckLevelModel(Level:19 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv19.webp')),
  CheckLevelModel(Level:20 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv20.webp')),
  CheckLevelModel(Level:21 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv21.webp')),
  CheckLevelModel(Level:22 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv22.webp')),
  CheckLevelModel(Level:23 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv23.webp')),
  CheckLevelModel(Level:24 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv24.webp')),
  CheckLevelModel(Level:25 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv25.webp')),
  CheckLevelModel(Level:26 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv26.webp')),
  CheckLevelModel(Level:27 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv27.webp')),
  CheckLevelModel(Level:28,Amount:600 ,image: AppConstance.imagelevelUrl('lv28.webp')),
  CheckLevelModel(Level:29 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv29.webp')),
  CheckLevelModel(Level:30 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv30.webp')),
  CheckLevelModel(Level:31 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv31.webp')),
  CheckLevelModel(Level:32,Amount:600 ,image: AppConstance.imagelevelUrl('lv32.webp')),
  CheckLevelModel(Level:33 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv33.webp')),
  CheckLevelModel(Level:34 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv34.webp')),
  CheckLevelModel(Level:35 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv35.webp')),
  CheckLevelModel(Level:36 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv36.webp')),
  CheckLevelModel(Level:37 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv37.webp')),
  CheckLevelModel(Level:38 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv38.webp')),
  CheckLevelModel(Level:39 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv39.webp')),
  CheckLevelModel(Level:40 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv40.webp')),
  CheckLevelModel(Level:41 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv41.webp')),
  CheckLevelModel(Level:42 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv42.webp')),
  CheckLevelModel(Level:43 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv43.webp')),
  CheckLevelModel(Level:44 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv44.webp')),
  CheckLevelModel(Level:45 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv45.webp')),
  CheckLevelModel(Level:46 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv46.webp')),
  CheckLevelModel(Level:47 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv47.webp')),
  CheckLevelModel(Level:48 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv48.webp')),
  CheckLevelModel(Level:49 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv49.webp')),
  CheckLevelModel(Level:50 ,Amount:600 ,image: AppConstance.imagelevelUrl('lv50.webp')),


];
List<CheckLevelModel> IncomeLevel=  [
  CheckLevelModel(Level:0 ,Amount:00 ,image:  AppConstance.imagelevelUrl('ml0.webp')),
  CheckLevelModel(Level:1 ,Amount:20 ,image: AppConstance.imagelevelUrl('ml1.webp')),
  CheckLevelModel(Level:2 ,Amount:100 ,image: AppConstance.imagelevelUrl('ml2.webp')),
  CheckLevelModel(Level:3 ,Amount:200 ,image: AppConstance.imagelevelUrl('ml3.webp')),
  CheckLevelModel(Level:4 ,Amount:300 ,image: AppConstance.imagelevelUrl('ml4.webp')),
  CheckLevelModel(Level:5 ,Amount:400,image: AppConstance.imagelevelUrl('ml5.webp')),
  CheckLevelModel(Level:6 ,Amount:500 ,image: AppConstance.imagelevelUrl('ml6.webp')),
  CheckLevelModel(Level:7 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml7.webp')),
  CheckLevelModel(Level:8 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml8.webp')),
  CheckLevelModel(Level:9 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml9.webp')),
  CheckLevelModel(Level:10 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml10.webp')),
  CheckLevelModel(Level:11 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml11.webp')),
  CheckLevelModel(Level:12 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml12.webp')),
  CheckLevelModel(Level:13 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml13.webp')),
  CheckLevelModel(Level:14 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml14.webp')),
  CheckLevelModel(Level:15 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml15.webp')),
  CheckLevelModel(Level:16 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml16.webp')),
  CheckLevelModel(Level:17 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml17.webp')),
  CheckLevelModel(Level:18 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml18.webp')),
  CheckLevelModel(Level:19 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml19.webp')),
  CheckLevelModel(Level:20 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml20.webp')),
  CheckLevelModel(Level:21 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml21.webp')),
  CheckLevelModel(Level:22 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml22.webp')),
  CheckLevelModel(Level:23 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml23.webp')),
  CheckLevelModel(Level:24 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml24.webp')),
  CheckLevelModel(Level:25 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml25.webp')),
  CheckLevelModel(Level:26 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml26.webp')),
  CheckLevelModel(Level:27 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml27.webp')),
  CheckLevelModel(Level:28,Amount:600 ,image: AppConstance.imagelevelUrl('ml28.webp')),
  CheckLevelModel(Level:29 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml29.webp')),
  CheckLevelModel(Level:30 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml30.webp')),
  CheckLevelModel(Level:31 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml31.webp')),
  CheckLevelModel(Level:32,Amount:600 ,image: AppConstance.imagelevelUrl('ml32.webp')),
  CheckLevelModel(Level:33 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml33.webp')),
  CheckLevelModel(Level:34 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml34.webp')),
  CheckLevelModel(Level:35 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml35.webp')),
  CheckLevelModel(Level:36 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml36.webp')),
  CheckLevelModel(Level:37 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml37.webp')),
  CheckLevelModel(Level:38 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml38.webp')),
  CheckLevelModel(Level:39 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml39.webp')),
  CheckLevelModel(Level:40 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml40.webp')),
  CheckLevelModel(Level:41 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml41.webp')),
  CheckLevelModel(Level:42 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml42.webp')),
  CheckLevelModel(Level:43 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml43.webp')),
  CheckLevelModel(Level:44 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml44.webp')),
  CheckLevelModel(Level:45 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml45.webp')),
  CheckLevelModel(Level:46 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml46.webp')),
  CheckLevelModel(Level:47 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml47.webp')),
  CheckLevelModel(Level:48 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml48.webp')),
  CheckLevelModel(Level:49 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml49.webp')),
  CheckLevelModel(Level:50 ,Amount:600 ,image: AppConstance.imagelevelUrl('ml50.webp')),


];


void ShowModelDetales({required medalModel Model}){
  showDialog(
      barrierColor: Colors.black26,
      barrierDismissible: true,
      context: NavigationService.CurrentContext,
      builder: (_) => new Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(height: SizeConfig.screenHeight,width: SizeConfig.screenWidth!/2,child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(imageUrl:Model.image ??'' ,),
              SizedBox(height: 10,),
              Text(Model.description??'' ,style: StyleTitleW,textAlign: TextAlign.center,)

            ],
          ),
          )));
}

PlaylinkMusic({path})async{
  final player = AudioPlayer();                   // Create a player
  await player.setUrl(           // Load a URL
      path,preload: false);                 // Schemes: (https: | file: | asset: )
  await player.play();
}

Cropedimage({required value})async{
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: value.path,
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),

    ],
  );
  if(croppedFile!=null){
   var ChatuserImage=File(croppedFile.path);
print('CropedimageCropedimage');
 return  ChatuserImage ;
  }
}


/*Future<String> generateProductDynamicLink({required String roomid}) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://gaproductom.page.link',
    link: Uri.parse('https://gaproductom.page.link/room/$roomid'),
    androidParameters: AndroidParameters(
      packageName: 'com.deewar.app',
    ),
    iosParameters: IosParameters(
      bundleId: 'com.deewar.app',
    ),
    socialMetaTagParameters:  SocialMetaTagParameters(
      title: 'room Details',
      description: 'Check out this amazing product!',
      imageUrl: Uri.parse('https://gaproductom.page.link/images/product.png'),
    ),
  );

  final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
  final Uri dynamicUrl = shortDynamicLink.shortUrl;

  print('We have funny topics here, come and join us !\ Link: $dynamicUrl');
return 'We have funny topics here, come and join us !\ Link: $dynamicUrl';
  // Use the dynamicUrl as needed (e.g., send it to a user via a messaging platform)
}*/

Future<String> generateProductDynamicLink({required String roomid}) async =>
    'We have funny topics here, come and join us! Link: https://gaproductom.page.link/room/$roomid';

Future  loadVideoItem(String image) {
  Future Function(String) decoder;
  if (image.startsWith(RegExp(r'https?://'))) {
    decoder = SVGAParser.shared.decodeFromURL;
  } else {
    decoder = SVGAParser.shared.decodeFromAssets;
  }
  return decoder(image);
}


String GiftQuant({quantity}){
  switch (quantity) {
    case '1':
      return  Images.gift_count_one;
    case '7':
      return  Images.gift_count_seven;
      break;
    case '77':
      return  Images.gift_count_seven_seven;
      break;
    case '777':
      return  Images.gift_count_seven_seven_seven;
      break;
    default:
      return  Images.gift_count_one;




  }
}
