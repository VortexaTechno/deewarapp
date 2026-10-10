import 'package:equatable/equatable.dart';

class VipContentModel extends Equatable{

  String Image;
  String Content;
  String MainTitle;
  String icon;
  String Bicon;
  VipContentModel({required this.Image,required this.Content,required this.MainTitle,required this.icon,required this.Bicon});
  @override
  List<Object?> get props => [Image,Content,MainTitle,icon,Bicon];

}