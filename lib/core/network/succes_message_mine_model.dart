
import 'package:ahlachat/shop/data/models/SalesPackageModel.dart';
import 'package:equatable/equatable.dart';

class SuccesMessageMineModel extends Equatable {
  bool? statusCode;
  int? errNum;
  String? statusMessage;
  List<SalesPackageModel>? package;




  SuccesMessageMineModel({this.statusCode, this.errNum,this.package, this.statusMessage});

  SuccesMessageMineModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status'];
    errNum = json['errNum'];
    statusMessage = json['message'];

    if (json['package'] != null) {
      package = <SalesPackageModel>[];
      json['package'].forEach((v) {
        package!.add(new SalesPackageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.statusCode;
    data['errNum'] = this.errNum;
    data['message'] = this.statusMessage;
    if (this.package != null) {
      data['package'] = this.package!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  List<Object?> get props => [
    statusCode,
    statusMessage,
    errNum,
    package
  ];
}



