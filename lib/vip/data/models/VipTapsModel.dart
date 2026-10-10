import 'package:equatable/equatable.dart';

class VipTapModel extends Equatable{


  bool Status;

  int  Index;

  VipTapModel({required this.Status,required this.Index});
  @override
  List<Object?> get props => [Status,Index];

}