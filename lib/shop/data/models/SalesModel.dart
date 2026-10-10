import 'package:ahlachat/shop/data/models/ItemModel.dart';
import 'package:equatable/equatable.dart';

class SalesModel  extends Equatable {
final  int? id;
final  String? createdAt;
final  int? days;
final  int? kind;
final ItemsModel? items;
final ItemsModel? frame;
final ItemsModel? entry;
const  SalesModel({this.id, this.createdAt, this.items,this.days,this.frame,this.kind,this.entry});
factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
  id: json['id'],
  days:   json['dayes_id'],
  items: json['items'] != null ? new ItemsModel.fromJson(json['items']) : null,
  frame:  json['frameitems'] != null ? new ItemsModel.fromJson(json['frameitems']) :json['showframeitems'] != null ?new ItemsModel.fromJson(json['showframeitems']): null,
  entry:  json['entryitems'] != null ? new ItemsModel.fromJson(json['entryitems']) : null,
  createdAt: json['created_at'],
 kind:json['kind'],

);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dayes_id'] = this.days;
    data['kind']=this.kind;
    data['created_at'] = this.createdAt;
    if (this.items != null) {
      data['items'] = this.items!.toJson();
    }
    if (this.frame != null) {
      data['frameitems'] = this.frame!.toJson();
    }
    if (this.entry != null) {
      data['entryitems'] = this.entry!.toJson();
    }
    return data;
  }

@override
List<dynamic> get props => [
  id,
  createdAt,
  items,
  days,
  entry,
  frame

];


}
