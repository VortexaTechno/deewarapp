import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImageModel extends Equatable {

  final ImagePicker? Image;




  const ImageModel(
      {
        this.Image,

      });

  @override
  List<dynamic> get props => [
    Image,



  ];
}