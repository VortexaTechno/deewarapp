import 'package:ahlachat/room/data/models/RoomCategoryModel.dart';
import 'package:ahlachat/room/data/models/SliderImage.dart';
import 'package:equatable/equatable.dart';

class ConstdataModle extends Equatable {
 final List<Category>? category;
 final List<Sliderbanners>? sliderbanners;
 final List<Sliderbanners>? Backsliderbanners;
 ConstdataModle({this.category, this.sliderbanners,this.Backsliderbanners});

  factory  ConstdataModle.fromJson(Map<String, dynamic> json) {
    List<Category> Categories=[];
    List<Sliderbanners> Sliderbanner=[];
    List<Sliderbanners> Backsliderbanners=[];
    if (json['Category'] != null) {

      json['Category'].forEach((v) {
        Categories.add(new Category.fromJson(v));
      });
    }
    if (json['sliderbanners'] != null) {

      json['sliderbanners'].forEach((v) {
        Sliderbanner.add(new Sliderbanners.fromJson(v));
      });
    }
    if (json['backbanners'] != null) {

      json['backbanners'].forEach((v) {
        Backsliderbanners.add(new Sliderbanners.fromJson(v));
      });
    }

    return    ConstdataModle(
      category: Categories,
      sliderbanners: Sliderbanner,
      Backsliderbanners: Backsliderbanners
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['Category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.sliderbanners != null) {
      data['sliderbanners'] =
          this.sliderbanners!.map((v) => v.toJson()).toList();
    }
    if (this.Backsliderbanners != null) {
      data['backbanners'] =
          this.Backsliderbanners!.map((v) => v.toJson()).toList();
    }

    return data;
  }


  @override
  List<dynamic> get props => [
    category,
    sliderbanners,
    Backsliderbanners

  ];
}






