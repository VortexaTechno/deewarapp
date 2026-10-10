
import 'package:ahlachat/gift/data/models/GiftModel.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';

import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final String? title;
  final  int? status;
  final UserModel? user;
  final UserModel? reciveruser;
  final String? quant;
  final GiftModel? Gift;
  const ChatModel(
      {
        this.title,
        this.status,
        this.user,
        this.reciveruser,
        this.Gift,
        this.quant

      });
  ChatModel copyWith({

    String? title,
    UserModel? user,
    int? status,
    UserModel? reciveruser,
    String? quant,
     GiftModel? Gift,
  }) {
    return ChatModel(
     status: status??this.status,
      user: user??this.user,
      title:  title??this.title,
      Gift: Gift??this.Gift,
      quant: quant??this.quant,
  reciveruser: reciveruser??this.reciveruser,

    );
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {

    return    ChatModel(
        status:json['status']  ,
        user:  json['user'] != null ? new UserModel.fromJson(json['user']) : null,
      title: json['title']  ,

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['title'] = this.title;

    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }

    return data;
  }
  @override
  List<dynamic> get props => [
    status,
    title,
    user,
    reciveruser,
    Gift,
    quant


  ];
}