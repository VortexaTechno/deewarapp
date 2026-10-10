import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class SelectCodeModel extends Equatable {

  final String? code;
  final String? flag;
  final String? Country;



  const SelectCodeModel(
      {
        this.code,
        this.flag,
        this.Country,

      });

  @override
  List<dynamic> get props => [
    code,
    flag,
    Country,



  ];
}