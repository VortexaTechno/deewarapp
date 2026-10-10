import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RoomChairs {
final  int? id;
int? hostId;
final int? roomId;
final int? chairId;
int? lock;
int? mic;
final  int? karisma;
 UserModel? user;

  RoomChairs(
      {this.id,
        this.hostId,
        this.roomId,
        this.chairId,
        this.lock,
        this.user,
        this.mic,
        this.karisma});

RoomChairs copyWith({

  int? id,
  int? hostId,
  int? roomId,
  int? chairId,
  int?   lock,
  UserModel ?user,
  int? karisma,
  int?mic,


}) {
  return RoomChairs(
      id:id??this.id,
      user: user??this.user,
     roomId: roomId??this.roomId,
     chairId: chairId??this.chairId,
     hostId: hostId??this.hostId,
     karisma: karisma??this.karisma,
     lock: lock??this.lock,
     mic: mic??this.mic


  );
}


  factory RoomChairs.fromJson(Map<String, dynamic> json)  {

  return    RoomChairs(
      id : json['id'],
      hostId : json['host_id'],
      roomId : json['room_id'],
      chairId : json['chair_id'],
      lock : json['Lock'],
      karisma : json['Karisma'],
      mic: json['mic'],
      user: json['user'] != null ? new UserModel.fromJson(json['user']) : null,

  );

}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['host_id'] = this.hostId;
    data['room_id'] = this.roomId;
    data['chair_id'] = this.chairId;
    data['Lock'] = this.lock;
    data['Karisma'] = this.karisma;
    data['mic']=this.mic;
    return data;
  }

@override
List<dynamic> get props => [
  id,
  hostId,
  roomId,
  chairId,
  lock,
  karisma,
  user,
  mic
];


}