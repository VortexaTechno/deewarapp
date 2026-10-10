// import 'package:ahlachat/users/data/models/UserModel.dart';
// import 'package:ahlachat/view/widgets/LevelWidget.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:country_calling_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import '../../models/Usermodel.dart';
// import '../../util/Dialogs.dart';
// import '../../util/Localization.dart';
// import '../../util/helperclass.dart';
// import '../../util/images.dart';
// import '../../util/styles.dart';
// import '../../viewmodels/Room_Viewmodel/Room_Viewmodel.dart';
//
// class UserInfoCenterWidget extends StatelessWidget {
//
//   UserModel? UserDate;
//   Color TextColor;
//   UserInfoCenterWidget({this.UserDate,this.TextColor=Colors.black,});
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
//       Row(mainAxisSize: MainAxisSize.min,
//         children: [
//           if(UserDate?.Flag!=null)    Image.asset(
//             UserDate?.Flag??'',
//             package: countryCodePackageName,
//             width: 25,
//           ),
//           SizedBox(width: 10,),
//           Row(
//             children: [
//               Text(Helper().CutName(UserDate?.name??'') ,style: Namestyle.copyWith(fontSize: 16,color: TextColor,overflow: TextOverflow.ellipsis),),
//               SizedBox(width: 5,),
//               if(UserDate?.SuporrtedImage!=null)CachedNetworkImage(imageUrl: UserDate?.SuporrtedImage??'' ,height: 15),
//             ],
//           ),
//         ],
//       ),
//
//
//       Row(mainAxisSize: MainAxisSize.min,
//         children: [
//
//           LevelWidget(Karisma:UserDate?.Karisma??0 ),
//
//           SizedBox(width: 2,),
//           if(UserDate?.MyVip!=null&&UserDate?.MyVip?.Vip?.vipicon!=null) Row(
//             children: [
//               const SizedBox(width: 3,),
//               CachedNetworkImage(imageUrl: UserDate?.MyVip?.Vip?.vipicon??"",height: 15, ),
//             ],
//           ),
//           if(UserDate?.Supporter==1)Image.asset(Images.Supporter,height: 16),
//           SizedBox(width: 2,),
//           Image.asset(UserDate?.ginder=='0'?Images.sexman:Images.sexwoman,height: 16),
//         ],
//       ),
//       SizedBox(height:  2,),
//       Row(mainAxisSize: MainAxisSize.min,
//         children: [
//           Text( UserDate?.Newid??UserDate?.myappid??""  ,style: style6.copyWith(color:TextColor,fontSize: 12,height: 1) ),
//           SizedBox(width: 5,),
//           InkWell(onTap: (){
//             Clipboard.setData(ClipboardData(text:UserDate?.Newid??UserDate?.myappid??"" ));
//             Dialogs().showtoast(getLang(context: context, key: "Copied"));
//           },child:  Icon(Icons.copy_outlined,color: TextColor,size: 13,)),
//           if(UserDate?.MyVip!=null&&UserDate?.MyVip?.Vip?.vipicon!=null) CachedNetworkImage(imageUrl: UserDate?.MyVip?.Vip?.gif??"",height: 25, ),
//
//         ],
//       ),
//       SizedBox(height:  2,),
//
//       Row(mainAxisSize: MainAxisSize.min,children: [
//         if(UserDate?.MyFamil!=null) if(UserDate?.MyFamil?.model!=null)CachedNetworkImage(imageUrl:  UserDate?.MyFamil?.model??'',height: 16),
//         if(UserDate?.Admin==1)   Image.asset(Images.Manager,height: 16),
//         if(UserDate?.SuperAdmin==1)   Image.asset(Images.SuperManager,height: 16),
//         if(UserDate?.Official==1) Image.asset(Images.Official,height: 16),
//         if(UserDate?.MoneyAgency==1)  Image.asset(Images.MoneyAgency,height: 16),
//         if(UserDate?.CustomersService==1)  Image.asset(Images.CustomerService,height: 16),
//         if(UserDate?.MemberAgency==1)  Image.asset(Images.ServicesAgency,height: 16),
//         if(UserDate?.AgencyId!=null) Image.asset(Images.Services,height: 16),
//         if(UserDate?.Announcer==1)  Image.asset(Images.Announcer,height: 16),
//         if(UserDate?.DB==1)  Image.asset(Images.DB,height: 16),
//       ]),
//
//     ],);
//   }
// }
