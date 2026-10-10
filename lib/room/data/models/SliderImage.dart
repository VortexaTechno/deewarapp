import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:equatable/equatable.dart';

class Sliderbanners extends Equatable {
  final  int? id;
  final String? image;

  Sliderbanners({this.id, this.image});

  factory  Sliderbanners.fromJson(Map<String, dynamic> json) {
    return    Sliderbanners(
      image: AppConstance.BannerlevelUrl(json['image']) ,
      id:  json['id'],

    );

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }

  @override
  List<dynamic> get props => [
    id,
    image,

  ];
}