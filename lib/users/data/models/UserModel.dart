import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/profile/data/models/medalModel.dart';
import 'package:ahlachat/shop/data/models/SalesModel.dart';
import 'package:ahlachat/userprofile/data/models/ProfileImageModel.dart';
import 'package:ahlachat/vip/data/models/VipModel.dart';
import 'package:ahlachat/vip/data/models/VipSalesModel.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;

  final  int? coin;
  final  String? descript;
  final String? image;
  final  String? bId;
  final  String? nId;
  final  int? input;
  final  int? gInput;
  final int? donate;
  final  String? sex;
  final String? country;
  final String? flag;
  final String? email;
  final String? googleId;
  final String? phone;
  final String? password;
  final String? deviceId;
  final int? familyId;
  final String? Code;
  final int? agencyId;
  final String? nToken;
  final int? nFollower;
  final int? nFollowed;
  final int? nFriends;
  final String? date;
  final String? createdAt;
  final List<String>? role;
  final List<ProfileImageModel>? ProfileImage;
  final List<medalModel>? medals;
  final SalesModel? Frame;
  final SalesModel? Entry;
  final  VipSalesModel? CurrentVip;
  final bool? followstatus;
  const UserModel(
      {
        this.id,
        this.name,
        this.coin,
        this.descript,
        this.image,
        this.bId,
        this.followstatus,
        this.nId,
        this.input,
        this.gInput,
        this.donate,
        this.sex,
        this.country,
        this.flag,
        this.CurrentVip,
        this.email,
        this.googleId,
        this.phone,
        this.password,
        this.deviceId,
        this.familyId,
        this.agencyId,
        this.nToken,
        this.ProfileImage,
        this.nFollower,
        this.nFollowed,
        this.nFriends,
        this.date,
        this.createdAt,
        this.role,
        this.Code,
        this.Frame,
        this.Entry,
        this.medals
      });
  UserModel copyWith({
    int? id,
    String? name,
    String? descript,
    String? image,
    String? bId,
    String? nId,
    int? input,
    int? gInput,
    int? donate,
    String? sex,
    String? country,
    String? flag,
    String? email,
    String? googleId,
    bool?followstatus,
    var phone,
    String? password,
    String? deviceId,
    int? familyId,
    String? Code,
    int? agencyId,
    String? nToken,
    int? nFollower,
    int? nFollowed,
    var CurrentVip,
    int? nFriends,
    String? date,
    String? createdAt,
    List<String>? role,
    List<ProfileImageModel>?   ProfileImage,
    List<medalModel>?    medals,

    int? coin,
    var Frame,
    var Entry
  }) {

    return UserModel(
      image: image??this.image,
      date: date??this.date,
      name: name??this.name,
      Code: Code??this.Code,
      email: email??this.email,
      password:password??this.password,
      id: id??this.id,
      agencyId: agencyId??this.agencyId,
      country: country??this.country,
      medals: medals??this.medals,
      createdAt:createdAt??this.createdAt,
      descript:descript??this.descript,
      familyId: familyId??this.familyId,
      gInput: gInput??this.gInput,
      googleId: googleId??this.googleId,
      input: input??this.input,
      donate: donate??this.donate,
      deviceId: deviceId??this.deviceId,
      flag: flag??this.flag,
      nFollowed: nFollowed??this.nFollowed,
      nFollower: nFollower??this.nFollower,
      nFriends:nFriends??this.nFriends,
      nId:nId??this.nId,
      followstatus: followstatus??this.followstatus,
      bId: bId??this.bId,
      phone: phone==0?null:phone??this.phone,
      sex: sex??this.sex,
      nToken: nToken??this.nToken,
      role:role??this.role,
      CurrentVip: CurrentVip==0?null:CurrentVip??this.CurrentVip,
      coin:coin??this.coin,
      ProfileImage: ProfileImage??this.ProfileImage,
      Frame:Frame==0?null:Frame??this.Frame,
      Entry: Entry==0?null:Entry??this.Entry,


    );

  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
   List <ProfileImageModel> UserImages = <ProfileImageModel>[];
    if (json['profile_image'] != null) {

      json['profile_image'].forEach((v) {
        UserImages.add(new ProfileImageModel.fromJson(v));
      });
    }
   List <medalModel> Medals = <medalModel>[];
   if (json['modles'] != null) {

     json['modles'].forEach((v) {
       Medals.add(new medalModel.fromJson(v));
     });
   }
    return    UserModel(
        id: json['id'],
        name : json['name'],
        coin : json['Coin'],
        descript : json['descript'],
        image : AppConstance.imageThumbnailsUrl(json['image']??""),
        bId : json['B_id'],
        nId : json['N_id'],
        input : json['input'],
        gInput : json['g_input'],
        donate : json['donate'],
        sex : json['sex'].toString(),
        country : json['Country'],
        flag : json['Flag'],
        email : json['email'],
        googleId : json['google_id'],
        phone : json['phone'],
        password : json['password'],
        deviceId : json['device_id'],
        familyId : json['family_id'],
        agencyId :json['agency_id'],
        nToken : json['N_token'],
        nFollower :json['N_follower'],
        nFollowed : json['N_followed'],
        nFriends : json['N_friends'],
        date : json['date'],
        createdAt: json['created_at'],
        followstatus: json['follow_status'] == null?false: true,
        Frame: json['frame'] != null ? new SalesModel.fromJson(json['frame']) : json['showframe'] != null ?new SalesModel.fromJson(json['showframe']): null,
        Entry: json['entry'] != null ? new SalesModel.fromJson(json['entry']) : null,
        CurrentVip: json['currentvip'] != null ? new VipSalesModel.fromJson(json['currentvip']) : json['cvip'] != null?new VipSalesModel.fromJson(json['cvip']) : json['show_cvip'] != null?new VipSalesModel.fromJson(json['show_cvip']):null,
        medals: Medals,

        ProfileImage : UserImages
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Coin'] = this.coin;
    data['descript'] = this.descript;
    data['image'] = this.image;
    data['B_id'] = this.bId;
    data['N_id'] = this.nId;
    data['input'] = this.input;

    data['donate']= this.donate;
    data['sex']= this.sex;
    data['Country']= this.country;
    data['Flag']= this.flag;
    data['email']= this.email;
    data['google_id']= this.googleId;

    data['phone']=this.phone;
    data['password']=this.password;
    data['device_id']=this.deviceId;
    data['family_id']=this.familyId;
    data['agency_id']=this.agencyId;
    data['family_id']=this.familyId;
    data['N_token']=this.nToken;
    data['N_follower']=this.nFollower;
    data['N_followed']=this.nFollowed;
    data['N_friends']=this.nFriends;
    data['date']=this.date;
    data['created_at']=this.createdAt;
    if (this.Frame != null) {
      data['frame'] = this.Frame!.toJson();
    }
    if (this.Entry != null) {
      data['entry'] = this.Entry!.toJson();
    }

    data['currentvip']= this.CurrentVip;
    return data;
  }
  @override
  List<dynamic> get props => [
    id,
    name,
    Frame,
    Entry,
    coin,
    descript,
    image,
    bId,
    nId,followstatus,
    input,
    gInput,
    donate,
    CurrentVip,
    sex,
    country,
    flag,
    email,
    followstatus,
    googleId,
    phone,
    password,
    deviceId,
    familyId,
    agencyId,
    nToken,
    nFollower,
    nFollowed,
    nFriends,
    date,
    createdAt,
    role,
    Code,
    medals

  ];
}