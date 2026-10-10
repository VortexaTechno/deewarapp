
import 'package:equatable/equatable.dart';


class ErrorMessageModel extends Equatable   {
  bool? statusCode;
  int? errNum;
  String? statusMessage;

  ErrorMessageModel({required this.statusCode, required this.errNum, required this.statusMessage});



  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.statusCode;
  //   data['errNum'] = this.errNum;
  //   data['message'] = this.statusMessage;
  //   return data;
  // }
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode:  json['status'],
      statusMessage: json['message'] ,
      errNum: json["errNum"],
    );
  }

  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
  ];
}

