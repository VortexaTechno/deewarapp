import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



const Color MainColor =const Color(0xFF2060C0);

const Color TextFormColor =const Color(0xFFfafafa);
const Color BackgroundGray =const Color(0xFFf6f7f9);

const Color VipBackground =const Color(0xFF0b0c2f);

const TextStyle StyleTitle =  TextStyle(
  fontWeight: FontWeight.bold,
  fontSize:13,
  color: MainColor,
);
const TextStyle StyleTitleW = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize:16,
  color: Colors.white,
);
const TextStyle StyleTitleVip = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize:16,
  color: Colors.brown,
);
const TextStyle StyleTitleWN = const TextStyle(
  fontWeight: FontWeight.normal,
  fontSize:16,
  color: Colors.white,
);
const TextStyle StyleTitleB = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize:16,
  color: Colors.black,
);
const TextStyle StyleTitleBN = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize:16,
  color: Colors.black,
);
const TextStyle StyleTitleG = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize:13,
  color: Colors.black26,
);

const TextStyle StyleTitleGN = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize:13,
  color: Colors.black26,
);

const VipGradiant=LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFc5a485),Color(0xFFddc084),Color(0xFFcfb26e),Color(0xFFba9952) ]);


const AppGradiant=LinearGradient(
begin: Alignment.centerLeft,
end: Alignment.centerRight,
colors: [
MainColor,
MainColor,
Color(0xFF3C82E4),
],
);