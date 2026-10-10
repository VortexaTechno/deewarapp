import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:equatable/equatable.dart';

class LevelModel {
  int? id;
  String? startlevel;
  String? endlevel;

  String? icon;

  LevelModel({this.id, this.startlevel, this.endlevel,   this.icon});

  LevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startlevel = json['startlevel'];
    endlevel = json['endlevel'];

    icon =AppConstance.imagelevelUrl(json['icon']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startlevel'] = this.startlevel;
    data['endlevel'] = this.endlevel;

    data['icon'] = this.icon;
    return data;
  }
}



class CheckLevelModel extends Equatable{
 final int? Level;
 final int? Amount;
 final  String? image;


const  CheckLevelModel({required this.Level,required this.Amount,required  this.image });

  @override
  // TODO: implement props
  List<Object?> get props => [
    Level,
    Amount,
    image

  ];


}