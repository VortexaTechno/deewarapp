import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/shop/data/models/ItemModel.dart';

class VipModel {
  final int? id;
  final String? medal;
  final String? name;
  final String? nameCard;
  final String? fontColor;
  final String? exclusiveGift;
  final  String? roomEntry;
  final  String? roomFrame;
  final  String? antiSilence;
  final String? antiKick;
  final  String? specialId;
  final  String? onlineNotic;
  final  String? bonus;
  final  ItemsModel? frame;
  final  ItemsModel? entry;
  final int? price;
  final int? days;
 const VipModel(
      {this.id,
        this.medal,
        this.nameCard,
        this.fontColor,
        this.exclusiveGift,
        this.roomEntry,
        this.roomFrame,
        this.antiSilence,
        this.antiKick,
        this.name,
        this.specialId,
        this.onlineNotic,
        this.bonus,
        this.frame,
        this.entry,
        this.price,
        this.days
      });

  factory VipModel.fromJson(Map<String, dynamic> json) => VipModel(
    id: json['id'],
    antiKick:json['anti_kick'],
    antiSilence:json['anti_silence'],
    bonus: json['bonus'],
    entry:json['entry'] != null ? new ItemsModel.fromJson(json['entry']) : null,
    exclusiveGift: json['exclusive_gift'],
    fontColor: json['font_color'],
    frame:json['frame'] != null ? new ItemsModel.fromJson(json['frame']) : null,
    medal:AppConstance.imageVipUrl(json['medal']??''),
    nameCard: json['name_card'],
    onlineNotic: json['online_notic'],
    roomEntry: json['room_entry'],
    roomFrame:json['room_frame'],
    specialId: json['special_id'],
    name: json['name'],
    price:  json['price'],
    days: json['days']
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medal'] = this.medal;
    data['name_card'] = this.nameCard;
    data['font_color'] = this.fontColor;
    data['exclusive_gift'] = this.exclusiveGift;
    data['room_entry'] = this.roomEntry;
    data['name']= this.name;
    data['room_frame'] = this.roomFrame;
    data['anti_silence'] = this.antiSilence;
    data['anti_kick'] = this.antiKick;
    data['special_id'] = this.specialId;
    data['price']== this.price;
    data['online_notic'] = this.onlineNotic;
    data['bonus'] = this.bonus;
    data['days']=this.days;
    if (this.frame != null) {
      data['frame'] = this.frame!.toJson();
    }
    if (this.entry != null) {
      data['entry'] = this.entry!.toJson();
    }
    return data;
  }
}
