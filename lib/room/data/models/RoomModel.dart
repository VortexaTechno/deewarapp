import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/room/data/models/ChairModel.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:equatable/equatable.dart';

class RoomModel extends Equatable {
  final int? id;
  final String? name;
  final  String? image;
  final String? screanImage;
  final String?   token;
  final String ?voiceToken;
  final  int? joinNum;
  final int? secure;
  final  int? donate;
  final  int?  FollowRoom;
  final  String? describe;
  final  UserModel? owner;

  final  List<UserModel>? highmembers;
  final  List<RoomChairs>? roomChairs;

 const RoomModel(
      {this.id,
        this.name,
        this.image,
        this.owner,
        this.screanImage,
        this.joinNum,
        this.voiceToken,
        this.secure,
        this.FollowRoom,
        this.donate,
        this.token,
        this.highmembers,
        this.describe,this.roomChairs});
  RoomModel copyWith({

      int? id,
      String? name,
       String? image,
      String? screanImage,
      String?   token,
      String ?voiceToken,
       int? joinNum,
      int? secure,
       int? donate,
       int?  FollowRoom,
       String? describe,
       UserModel? owner,

    List<UserModel>? highmembers,

    List<RoomChairs>? roomChairs,

  }) {
    return RoomModel(
       id:id??this.id,
      name:name??this.name,
      image:image??this.image,
       screanImage:screanImage??this.screanImage,
       token:token??this.token,
       voiceToken:voiceToken??this.voiceToken,
       joinNum:joinNum??this.joinNum,
       secure:secure??this.secure,
       donate:donate??this.donate,
       FollowRoom:FollowRoom??this.FollowRoom,
       describe:describe??this.describe,
       owner:owner??this.owner,
       roomChairs:roomChairs??this.roomChairs,
      highmembers: highmembers??this.highmembers



    );
  }

  factory RoomModel.fromJson(Map<String, dynamic> json)  {
    List<RoomChairs> Chairs=[];
List<UserModel> highmembers=[];
    if (json['highmembers'] != null) {

      json['highmembers'].forEach((v) {
        highmembers.add(new UserModel.fromJson(v));
      });
    }
    if (json['room_chairs'] != null) {

      json['room_chairs'].forEach((v) {
        Chairs.add(new RoomChairs.fromJson(v));
      });
    }
  return    RoomModel(
      id: json['id'],
      name : json['name'],
      image:  AppConstance.imageThumbnailsUrl(json['image']),
      describe:  json['describe'],
      donate:  json['donate'],
      joinNum: json['join_num'],
      screanImage: AppConstance.ImageUrl(json['screan_image']),
      secure: json['secure'],
      owner:json['owner'] != null ? new UserModel.fromJson(json['owner']) : null,
      roomChairs: Chairs,
      highmembers: highmembers,
      token: json['token'],
      voiceToken: json['voiceToken'],
      FollowRoom: json['FollowRoom']


  );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['screan_image'] = this.screanImage;
    data['join_num'] = this.joinNum;
    data['secure'] = this.secure;
    data['donate'] = this.donate;
    data['token']=this.token;
    data['voiceToken']=this.voiceToken;
    data['describe'] = this.describe;
    data['FollowRoom']=this.FollowRoom;
    if (this.roomChairs != null) {
      data['room_chairs'] =
          this.roomChairs!.map((v) => v.toJson()).toList();
    }

    if (this.highmembers != null) {
      data['highmembers'] =
          this.highmembers!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  @override
  // TODO: implement props
  @override
  List<dynamic> get props => [
    id,
    name,
    image,
    screanImage,
    secure,
    donate,
    describe,
    joinNum,
    token,
    voiceToken,
    FollowRoom,
    highmembers

  ];
}