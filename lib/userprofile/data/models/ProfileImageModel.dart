import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:equatable/equatable.dart';

class ProfileImageModel  extends Equatable{
 final int? id;
 final String? image;

const  ProfileImageModel({this.id, this.image});


 factory ProfileImageModel.fromJson(Map<String, dynamic> json) {
   return ProfileImageModel(
     id:    json['id'],
     image:  AppConstance.imageThumbnailsUrl(json['image'])

   );
 }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,image
  ];
}