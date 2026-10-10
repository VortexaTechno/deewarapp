import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class FireBaseGoogleModel extends Equatable {

  final String? email;
  final String? name;
  final String? sex;
  final String? googleid;


  const FireBaseGoogleModel(
      {
        this.name,
        this.email,
        this.sex,
        this.googleid,
       });

  @override
  List<dynamic> get props => [
    name,
    email,
    sex,
    googleid,


  ];
}