import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final  int? id;
  final String? transtitle;
  final int? status;
  final  String? flag;

  Category(
      {
        this.id,
        this.transtitle,
        this.status,
        this.flag
      });

  factory  Category.fromJson(Map<String, dynamic> json) {
    return    Category(
        flag: json['flag'],
        id:  json['id'],
        transtitle: json['transtitle']
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transtitle'] = this.transtitle;
    data['flag'] = this.flag;
    return data;
  }

  @override
  List<dynamic> get props => [
    id,
    transtitle,
    flag
  ];

}