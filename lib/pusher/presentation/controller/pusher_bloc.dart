import 'dart:async';
import 'dart:convert';

import 'package:ahlachat/chairs/data/ViewModel/emoje_view_model.dart';
import 'package:ahlachat/chairs/presentation/controller/chair_bloc.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/gift/data/models/GiftModel.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:ahlachat/roomchat/presentation/controller/roomchat_bloc.dart';
import 'package:ahlachat/svga/data/ViewModel/show_entry_view_model.dart';
import 'package:ahlachat/svga/data/ViewModel/show_gift_view_model.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'pusher_event.dart';
part 'pusher_state.dart';

class PusherBloc extends Bloc<PusherEvent, PusherState> {
  PusherBloc() : super(PusherState()) {
    on<StartUserSocketEvent>((event, emit) {

      GlopelPusher.subscribe(channelName: 'user$UserId',onEvent: (e){

        HandelUserSocket(data:jsonDecode(e.data),state:jsonDecode(e.data)['state']  );

      } );

    });

    on<DisconnectUserSocketEvent>((event, emit) {

      GlopelPusher.unsubscribe(channelName: 'user$UserId');

    });

    on<StartRoomSocketEvent>((event, emit) {

      GlopelPusher.subscribe(channelName: 'Room$RoomId',onEvent: (e){

        HandelRoomSocket(data:jsonDecode(e.data),state:jsonDecode(e.data)['state']  );

      } );

    });

    on<DisconnectRoomSocketEvent>((event, emit) {

      GlopelPusher.unsubscribe(channelName: 'Room${event.id}');

    });



  }

  HandelUserSocket({data,state}) async{

    switch (state) {
      // case 0:
      //   user.UpdateFrame(frames:data['data']['frame'] );
      //   break;
      // case 1:
      //   user.UpdateEntry(Entry: data['data']['entry'] );
      //   break;
      // case 2:
      //   user.removeFrame();
      //   break;
      // case 3:
      //   user.removeEntry();
      //   break;
      // case 4:
      //
      //   InboxRoomModel Inbox=InboxRoomModel.fromJson(data['data']['InboxRoom']);
      //
      //
      //   Inboxroom.AddnewInboxRoom(value: Inbox);
      //   break;
      // case 5:
      //   Message messages=Message.fromJson(data['data']['Messages']);
      //
      //   var Inbox= Inboxroom.Inboxrooms.where((element) => element.id==messages.inboxroomId);
      //   if(Inboxroom.inroomid==messages.inboxroomId){
      //
      //     if(Inbox.isNotEmpty){
      //       Inboxroom.Inboxrooms.where((element) => element.id==messages.inboxroomId).first.numberUnread=0 ;
      //     }
      //
      //     Inboxroom.AlreadyinInboxRoom();
      //   }else{
      //     if(Inbox.isNotEmpty){
      //       Inboxroom.Inboxrooms.where((element) => element.id==messages.inboxroomId).first.numberUnread=Inboxroom.Inboxrooms.where((element) => element.id==messages.inboxroomId).first.numberUnread!+1;
      //
      //     }
      //   }
      //   if(Inbox.isNotEmpty){
      //     Inboxroom.Inboxrooms.where((element) => element.id==messages.inboxroomId).first.updatedAt=messages.createdAt ;
      //   }
      //
      //
      //   if(messages.senderId.toString()!=user.userinfo?.id.toString()){
      //     LocalNotificationService().showNotification(body: messages.message??"",id: 1, title:'رساله جديده',  );
      //
      //     Inboxroom.AddMessageInbox(value: messages,id:messages.inboxroomId,context: roomcontext );
      //   }
      //
      //   if(messages.userId.toString()==user.userinfo?.id.toString()){
      //     //  Dialogs().ShowMessage(name: 'رساله جديده',message:messages.message);
      //     LocalNotificationService().showNotification(body: messages.message??"",id: 1, title:'رساله جديده',  );
      //     user.changeNewmessage(true);
      //
      //     Helper().PlayMusic(path: AppConstants.Chatnotifi);
      //   }
      //   break;
      // case 6:
      //
      //   user.AddCoinspluse(value:int.parse(data['data']['coins'].toString()));
      //   break;
      case 7:
         print( ' 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7');
         if(RoomId!=data['data']['id']){
           showCustomInvitationDialog(name: data['data']['name'],image: AppConstance.imageThumbnailsUrl(data['data']['image']??"") ,room: data['data']['room'],context: NavigationService.CurrentContext,tittle: "لقد تلقيت دعوه الانضمام الي غرفه اخري",Btitle:"هل انت متأكد من مغادره الغرفه ؟",ontap: (){
             final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
             if(InRoom==true){
               myBloc.add(JoinVoiceRoomInRoomEvent(id:int.parse( data['data']['id'])));

             }else{
               myBloc.add(JoinVoiceRoomEvent(id:int.parse( data['data']['id'])));
             }
             Navigator.pop(NavigationService.CurrentContext);
           });

         }

           // Rooms.InviteToRoom(Roominfo:  data['data']['Room'], user:  data['data']['user'],context:roomcontext );
        break;
      // case 8:
      //   Rooms.InviteToChair(Roominfo:  data['data']['Room'], user:  data['data']['user'],Chair_id:data['data']['chair_id'] ,context:roomcontext );
      //
      //
      //   break;
      // case 9:
      //
      //   user.Changecoins(value:int.parse(data['data']['coins'].toString()));
      //   break;
      // case 10:
      //
      //   user.MinusCoinspluse(value:int.parse(data['data']['coins'].toString()));
      //
      //   break;
      // case 11:
      //   Dialogs().showtoast('    لقد ربحت  ${data['data']['coins'].toString()} ماسه   ');
      //   user.AddCoinspluse(value:int.parse(data['data']['coins'].toString()));
      //
      //   break;
      // case 12:
      //   user.removeEnterbubles();
      //   break;
      // case 13:
      //   user.UpdateEnterbubles(frames:data['data']['frame'] );
      //   break;
      // case 14:
      //
      //   var user=usermodel.fromJson(data['data']['sender']);
      //   LocalNotificationService().showNotification(body:'  قام ${user.name} بمتابعتك  ',id: 5, title:'رساله جديده',  );
      //   showDialog(context: NavigationService.navigatorKey.currentContext!,builder: (context) {
      //     return AlertDialog(backgroundColor:  Color(0xFF2b2f3b),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),content:Container(
      //       child:Text('  قام ${user.name} بمتابعتك  ',style: style3.copyWith(color: Color(0xFFeae2be)  ,fontWeight: FontWeight.bold,fontSize: 16),textDirection: TextDirection.rtl  ),
      //     ),actions: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
      //           InkWell(onTap:(){
      //             Provider.of<FollowViewModel>(context,listen: false).ReturnFollow(context: NavigationService.navigatorKey.currentContext!,Senderid:user.id);
      //
      //             Navigator.pop(context);
      //           },child: Container(child: Center(child:  Text('رد المتابعه',style: style6.copyWith(fontSize: 15),)),width: 80,height: 37,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFFeae2be)))),
      //
      //           InkWell(onTap:()=>Navigator.pop(context),child: Container(child: Center(child:  Text(getLang( context: context, key: "Close"),style:  style6.copyWith(fontSize: 15),)),width: 80,height: 37,decoration: BoxDecoration(color: Color(0xFFeae2be),borderRadius: BorderRadius.circular(20), ))),
      //
      //         ],),
      //       )
      //     ],);
      //   },);
      //
      //   break;
      // case 15:
      //   user.removeProfilebubles();
      //   break;
      // case 16:
      //   user.UpdateProfilebubles(frames:data['data']['frame'] );
      //   break;
      // case 17:
      //   LocalNotificationService().showNotification(body:'تم حظر هذا الحساب',id: 2, title:'رساله جديده',  );
      //   Dialogs().showtoast('تم حظر هذا الحساب');
      //   SystemNavigator.pop();
      //   break;
      // case 18:
      //   LocalNotificationService().showNotification(body:data['data']['message'],id: 8, title:'رساله جديده',  );
      //   break;
      // case 19:
      //   print('191999999999999999999999999999999999999999999999999999191999999999999999999999999999999999999999999999999999');
      //   print(data['data']['deviceid']);
      //   print(deviceId);
      //   if(data['data']['deviceid']==deviceId){
      //
      //   }else{
      //     AgoraViewmodel Agora=Provider.of<AgoraViewmodel>( NavigationService.navigatorKey.currentContext!,listen: false);
      //     Dialogs().showtoast('تم فتح  هذا الحساب علي جوال اخر');
      //     Agora.EndAgora();
      //     SystemNavigator.pop();
      //
      //
      //   }
      //
      //
      //   break;
      default:

    }
  }

  HandelRoomSocket({data,state})async{


    switch (state) {

          case 1:
            final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
            print(data );

           myBloc.add(ChangeImageEvent(image: AppConstance.imageThumbnailsUrl(data['data']['image'] ) ));
            print('111111111111111111111111111111111111111111111111111111');
      break;
      case 2:
        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
        print(data );

        myBloc.add(ChangeBackImageEvent(image: AppConstance.ImageUrl(data['data']['screan_image'] ) ));
        print('screan_imagescrean_imagescrean_image');
        break;   case 3:
      final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
      print(data );

      myBloc.add(ChangenameEvent(image: data['data']['name']  ));
      print('111111111111111111111111111111111111111111111111111111');
      break;
      case 4:
      final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
      print(data );

      myBloc.add(ChangedescripEvent(image: data['data']['descripe']  ));
      print('111111111111111111111111111111111111111111111111111111');
      break;
      case 5:
      Showtoast(message: 'Leave Room');
      UserModel UserData= UserModel.fromJson( data['data']['user']);

      print('111111111111111111111111111111111111111111111111111111');
      final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
      final myBloc2 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);
      myBloc.add(RemoveUserFromRoomEvent( id: UserData.id??0));

      myBloc2.add( AddNewMessageToChatEvent(status: 0,user: UserData,tittle: 'Leave Room'));
      break;
      case 0:
      Showtoast(message: 'Join Room');
      UserModel UserData= UserModel.fromJson( data['data']);

      final myBloc = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);
        myBloc.add( AddNewMessageToChatEvent(status: 0,user: UserData,tittle: 'Join Room'));


      Provider.of<ShowEntryViewmodel>(NavigationService.CurrentContext,listen: false).ShowRoomEntryEvent(user: UserData,);


      print('111111111111111111111111111111111111111111111111111111');
      break;
      case 6:
        Showtoast(message: 'Unlock Chair');
        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

        myBloc.add(ChangeChairEvent(status:0,index:int.parse( data['data']['chairIndex'] ) ));
        print('111111111111111111111111111111111111111111111111111111');
        break;
      case 7:
        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

        myBloc.add(ChangeChairEvent(status: 1,index:int.parse( data['data']['chairIndex'] ) ));
        Showtoast(message: 'lock Chair');
        print('111111111111111111111111111111111111111111111111111111');
        break;
      case 8:
 print(data['data']);
        Showtoast(message: 'join Chair');
        print('111111111111111111111111111111111111111111111111111111');
 final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
 UserModel UserData= UserModel.fromJson( data['data']['user']);

 myBloc.add(AddUserToChairEvent(user:UserData, index:int.parse( data['data']['chairIndex'] ) ));

        break;
      case 9:
        print(data['data']);
        Showtoast(message: 'Leave Chair');
        print('111111111111111111111111111111111111111111111111111111');
        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
        UserModel UserData= UserModel.fromJson( data['data']['user']);
        myBloc.add( RemoveUserToChairEvent  (user:UserData, index:int.parse( data['data']['chairIndex'] ) ));

        break;

      case 10:
        print(data['data']);
        Showtoast(message: 'User Enter Another Room ');
        print('111111111111111111111111111111111111111111111111111111');
        UserModel UserData= UserModel.fromJson(  data['data'] );
        final myBloc2 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);


        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

        myBloc.add(RemoveUserFromRoomEvent( id: UserData.id??0 )); 
        myBloc2.add( AddNewMessageToChatEvent(status: 0,user: UserData,tittle: 'Leave to Another Room'));

        break;
      case 11:
        print( data['data']['chairIndex']);
        Showtoast(message: 'User Open Mice ${data['data']['chairIndex']}');
        print('111111111111111111111111111111111111111111111111111111');
        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

        myBloc.add(ChangemicEvent(status: 0,index: data['data']['chairIndex']  ));

        break;
      case 12:
        print( data['data']['chairIndex']);
        Showtoast(message: 'User Close Mice ${data['data']['chairIndex']}');
        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

        myBloc.add(ChangemicEvent(status: 1,index: data['data']['chairIndex']  ));

        print('111111111111111111111111111111111111111111111111111111');


        break;
      case 13:
        print( data['data']);
        Showtoast(message: 'User Send Emoje');


        print('111111111111111111111111111111111111111111111111111111');
        Provider.of<EmojeViewmodel>(NavigationService.CurrentContext,listen: false).adduserimoge(id: int.parse(data['data']['chairId']), emoje: data['data']['emoje']);

        break;
      case 14:
        Showtoast(message: 'User Send Message in Room ');
        UserModel UserData= UserModel.fromJson(  data['data']['user'] );
        if(UserData.id.toString()!=UserId){
          final myBloc2 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);

          myBloc2.add( AddNewMessageToChatEvent(status: 0,user: UserData,tittle:data['data']['message']));
        }

        break;
      case 15:
        Showtoast(message: 'User Kicked from  Room ');
        UserModel UserData= UserModel.fromJson(  data['data'] );
        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
        final myBloc2 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);
        myBloc.add(KickUserFromRoomEvent( id: UserData.id??0 ));
        myBloc2.add( AddNewMessageToChatEvent(status: 0,user: UserData,tittle: 'Kicked from  Room'));

        break;
      case 16:
        Showtoast(message: 'User Kicked from  Chair ');
        UserModel UserData= UserModel.fromJson(  data['data'] );
        final myBloc = BlocProvider.of<ChairBloc>(NavigationService.CurrentContext);

        if(UserData.id.toString()==UserId){
          myBloc.add(ChangeUserChairEvent( ));

        }
        final myBloc2 = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

        myBloc2.add( RemoveUserToChairEvent  (user:UserData, index:int.parse( data['data']['chairIndex'] ) ));


        break;
      case 17:
        Showtoast(message: 'User Send  Gift   ');
        UserModel Sender= UserModel.fromJson(  data['data']['sender'] );
        UserModel Reciver= UserModel.fromJson(  data['data']['reciver'] );
        GiftModel Gift=GiftModel.fromJson(  data['data']['gift'] );
        String quant= data['data']['quan'];

        Provider.of<ShowGiftViewmodel>(NavigationService.CurrentContext,listen: false).ShowGiftSvga(Give: Gift,context: NavigationService.CurrentContext);

        if(Sender.id.toString()!=UserId){
          final myBloc2 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);

          myBloc2.add( AddNewMessageToChatEvent(status: 2,user: Sender,reciver: Reciver,quant: quant,tittle:'Send Gift',Gift: Gift));

        }

        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);
        var total =(int.parse(quant)*int.parse(Gift.price??'0')) ;
        myBloc.add(IncreaseCurrentRoomDonate(Coins: total));

        break;

//       case 0:
//         var  userinfo = usermodel.fromJson(data['data']);
//         if(userinfo.Hidden==0){
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).ShowEnterWidget(Info: userinfo);
//           if(userinfo.entry!=null&&userinfo.entry!=''){
//             Provider.of<SvgViewmodel>(roomcontext,listen: false).getcontroller(sound:userinfo.sound ,enterImage: userinfo.image,entername: userinfo.name,svga: userinfo.entry??'');
//             if(userinfo.id.toString()!=user.userinfo?.id.toString()&&userinfo.Hidden!=1){
//               if(userinfo.entry==null||userinfo.entry==''){
//                 EnterImage=userinfo.image;
//                 Entername=userinfo.name;
//               }
// //hidden,id,name,image
//               Provider.of<GiftsViewModel>(roomcontext,listen: false).sidepanner();
//             }
//           }
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: Chatroom(kind: 3,user:userinfo,content: '${userinfo.name} Enter Room' ));
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddusertoRoom(JoinRoom:joinRoom(user: userinfo,id: 45,index: 1,roomId: Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id,userId: userinfo.id,updatedAt: '',createdAt: '' ),join:userinfo,ctx: roomcontext,index: index );
//
//
//
//         }
//
//
//
//
//         // if(userinfo.id.toString()==  Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.adminId.toString()){
//         //   Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.chairs?[8].user=userinfo;
//         //   Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.chairs?[8].userId=userinfo.id.toString();
//         //   Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.chairs?[8].Karisma=0;
//         //   Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.chairs?[8].mute=0;
//         //   Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.chairs?[8].adminleaved=0;
//         // }
//         break;
//       case 1:
//         var  Chair = Chairs.fromJson(data['data']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddusertoChair(ctx:roomcontext, data:Chair );
//         break;
//       case 2:
//         var  userinfo = usermodel.fromJson(data['data']);
//         if(userinfo.Hidden==0){
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: Chatroom(kind: 3,user:userinfo,content: '${userinfo.name} Leaved Room' ));
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).RemoveuserfromRoom(id:userinfo.id.toString());
//         }
//
//         break;
//       case 3:
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).RemoveuserfromChair(id:data['data'].toString());
//         break;
//       case 4:
//         var  CHATROOM = Chatroom.fromJson(data['data']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: CHATROOM);
//         break;
//       case 5:
//         var  Give = givegifts.fromJson(data['data']['gift']);
//         var user=usermodel.fromJson(data['data']['user']);
//         Give.ListUser.forEach((elements) {
//           List ?SSS= Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.joinRooms?.where((element) => element.userId.toString()==elements.toString()).toList();
//           if(SSS?.length!=0 ){
//             usermodel ? userinfo=SSS?.first.user;
//             Provider.of<RoomViewmodel>(roomcontext,listen: false).Addmessagetocurrentroom(message: Chatroom(kind:2 ,user: user,id: 0,content:'xxxxxxxxxx',userId:user.id.toString(),updatedAt:        Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.updatedAt,roomId:  Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id.toString(),createdAt:        Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.createdAt,Gift:Give,RecevedUser: userinfo ));
//           }else{
//             Provider.of<RoomViewmodel>(roomcontext,listen: false).Addmessagetocurrentroom(message: Chatroom(kind:2 ,user: user,id: 0,content:'xxxxxxxxxx',userId:user.id.toString(),updatedAt:        Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.updatedAt,roomId: Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id.toString(),createdAt:        Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.createdAt,Gift:Give,RecevedUser:Provider.of<LoginViewmodel>(roomcontext,listen: false).userinfo  ));
//           }
//         });
//
//         Provider.of<RoomViewmodel>(roomcontext,listen: false). updatekaresma( context:roomcontext,Amount: Give.ListUser.length*Give.price!* int.parse(Give.quantity??"0") );
//         if(data['data']['kind']==1||data['data']['kind']=='1'){
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddKaresmaChair(userids: Give.ListUser,Amount: ((int.parse(Give.quantity??'0')*(Give.price??0))/10).round() ) ;
//         }else{
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddKaresmaChair(userids: Give.ListUser,Amount:int.parse(Give.quantity??'0')*(Give.price??0) );
//
//         }
//         Provider.of<SvgViewmodel>(roomcontext,listen: false).getcontroller2(svga:Give.svga,Give: Give,context: roomcontext,userinfo:   user);
//
//         break;
//       case 6:
//
//         var users=usermodel.fromJson(data['data']);
//
//         if(users.id.toString()==user.userinfo?.id.toString()){
//           Provider.of<SocketViewmodel>(roomcontext,listen: false).DisConnect(id: Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id.toString());
//           Provider.of<SvgViewmodel>(roomcontext,listen: false).dispose();
//           Provider.of<RoomPlayViewModel>(roomcontext, listen: false).changeHasRoomstate(false);
//           Provider.of<RoomPlayViewModel>(roomcontext, listen: false).changeIsRoomstate( false);
//           JoinChairs=false;
//           Agora.EndAgora();
//           if(Provider.of<RoomPlayViewModel>(roomcontext, listen: false).IsRoom==true){
//             Navigator.pop(roomcontext);
//           }
//           Future.delayed(Duration(seconds: 1),() {
//             Provider.of<RoomViewmodel>(roomcontext,listen: false).ClearCurrentroom();
//           },);
//         }
//         //  Provider.of<RoomViewmodel>(roomcontext,listen: false).RemoveChatofuser(userid:users.id );
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).RemoveuserfromRoom(id:users.id.toString());
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: Chatroom(kind: 3,user:users,content: '${users.name} Leaved Room' ));
//
//         break;
//       case 7:
//
//         var  Rooms = RoomModel.fromJson(data['data']['room']);
//
//         if(Rooms.adminId.toString()!=user.userinfo?.id.toString()){
//           Provider.of<SocketViewmodel>(roomcontext,listen: false).DisConnect(id: Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id.toString());
//           Provider.of<SvgViewmodel>(roomcontext,listen: false).dispose();
//           Provider.of<RoomPlayViewModel>(roomcontext, listen: false).changeHasRoomstate(false);
//           JoinChairs=false;
//           Agora.EndAgora();
//           if( Provider.of<RoomPlayViewModel>(roomcontext, listen: false).IsRoom==true){
//             Navigator.pop(roomcontext);
//           }
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).RemoveRoomFromlist(RoomId: Rooms.id);
//           Dialogs().showtoast('Room Disbanded');
//         }
//         if(Rooms.adminId.toString()==user.userinfo?.id.toString()&&data['data']['admin']!=null){
//           Dialogs().showtoast('Room Disbanded By Admin !');
//           Provider.of<SocketViewmodel>(roomcontext,listen: false).DisConnect(id: Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id.toString());
//           Provider.of<SvgViewmodel>(roomcontext,listen: false).dispose();
//           Provider.of<RoomPlayViewModel>(roomcontext, listen: false).changeIsRoomstate( false);
//           JoinChairs=false;
//           Agora.EndAgora();
//           if( Provider.of<RoomPlayViewModel>(roomcontext, listen: false).IsRoom==true){
//             Navigator.pop(roomcontext);
//           }
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).RemoveRoomFromlist(RoomId: Rooms.id);
//           Provider.of<LoginViewmodel>(roomcontext, listen: false).userinfo?.currentroom=null;
//         }
//         break;
//       case 8:
//
//         if(data['data']['userid']==UserId&&data['data']['state']=='0'){
//           Agora.UnMute();
//
//         }else if(data['data']['userid']==UserId&&data['data']['state']=='1'){
//           Agora.Mute();
//         }
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).Changemicestateadmin(userId:data['data']['userid']  ,state: int.parse(data['data']['state']));
//
//         break;
//       case 9:
//
//         if(Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.adminId.toString()==UserId.toString()){
//
//         }else{
//           Provider.of<RoomViewmodel>(roomcontext,listen: false). LockChair(state:int.parse(data['data']['state']),chairId: int.parse(data['data']['chair']['chair_id'])-1);
//
//         }
//
//         break;
//       case 10:
//
//         if(data['data'].toString()==user.userinfo?.id.toString()){
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).DisposeController();
//           Provider.of<SocketViewmodel>(roomcontext,listen: false).DisConnect(id:  Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id.toString());
//           Provider.of<SvgViewmodel>(roomcontext,listen: false).dispose();
//           Provider.of<RoomPlayViewModel>(roomcontext, listen: false).changeHasRoomstate(false);
//           Provider.of<RoomPlayViewModel>(roomcontext, listen: false).changeIsRoomstate( false);
//           JoinChairs=false;
//           Agora.EndAgora();
//           if( Provider.of<RoomPlayViewModel>(roomcontext, listen: false).IsRoom==true){
//             Navigator.pop(roomcontext);
//           }
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).removecurrentroom();
//         }
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).RemoveuserfromRoom(id:data['data'].toString());
//         break;
//       case 11:
//         var  Rooms = RoomModel.fromJson(data['data']);
//
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).updateCurrentRoom(NewRoom: Rooms);
//         break;
//       case 12:
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).updateCurrentRoomPassword(Id: data['data']['room_id'],Password:data['data']['password']  );
//         break;
//       case 13:
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).deleteroomchat();
//         break;
//       case 14:
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).Addsupervisors(id: data['data']);
//         break;
//       case 15:
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).Removesupervisors(id: data['data']);
//         break;
//       case 16:
//
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).RemoveuserfromRoom(id:data['data'].toString());
//
//
//         break;
//       case 17:
//         Provider.of<LoginViewmodel>(roomcontext,listen: false).adduserimoge(id: int.parse(data['data']['user']),imoges:data['data']['emoji'] );
//         break;
//       case 18:
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).UpdateThronechair(value: int.parse(data['data'] ));
//         break;
//       case 19:
//         usermodel user=usermodel.fromJson(data['data']['user']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).ChangeRoomChair(user: user, newChair:data['data']['chair_id']);
//         break;
//       case 20:
//       //    usermodel user=usermodel.fromJson(data['data']['user']);
//       //    Provider.of<RoomViewmodel>(roomcontext,listen: false).returntoAdminRoomChair(user: user, newChair:data['data']['chair_id']);
//         break;
//       case 21:
//         usermodel user=usermodel.fromJson(data['data']['user']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: Chatroom(kind: 5,user:user,content: AppConstants.Image_URL+data['data']['dice'] ));
//         break;
//       case 22:
//         usermodel user=usermodel.fromJson(data['data']['user']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: Chatroom(kind: 6,user:user,content:  data['data']['name'] ));
//         break;
//       case 23:
//         usermodel users=usermodel.fromJson(data['data']['user']);
//         usermodel Reciveduser=usermodel.fromJson(data['data']['reciveruser']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: Chatroom(kind: 7,user:users,content:  data['data']['content'],RecevedUser: Reciveduser ));
//         break;
//       case 24:
//
//         usermodel users=usermodel.fromJson(data['data']['user']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: Chatroom(kind: 8,user:users,content:  AppConstants.Image_URL+ data['data']['content'], ));
//         break;
//       case 25:
//
//         var  Give = givegifts.fromJson(data['data']['gift']);
//         var usersender=usermodel.fromJson(data['data']['usersender']);
//
//         Provider.of<RoomViewmodel>(roomcontext,listen: false). addCombo(count:Give.quantity ,id:usersender.id,image:usersender.image??'',image2: Give.image );
//
//
//         List Listuser=data['data']['user'];
//         Listuser.forEach((elements) {
//
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).Addmessagetocurrentroom(message: Chatroom(kind:2 ,user: usersender,id: 0,content:'xxxxxxxxxx',userId:usersender.id.toString(),updatedAt:        Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.updatedAt,roomId:  Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id.toString(),createdAt:        Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.createdAt,Gift:Give,Coins: elements, ));
//         }
//         );
//
//         if(data['data']['kind']==1||data['data']['kind']=='1'){
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddKaresmaChair(userids: Give.ListUser,Amount: ((Give.ListUser.length*Give.price!*int.parse(Give.quantity??"0"))/20).round()) ;
//           Provider.of<RoomViewmodel>(roomcontext,listen: false). updatekaresma( context:roomcontext,Amount:  ((Give.ListUser.length*Give.price!*int.parse(Give.quantity??"0"))/20).round() );
//         }else{
//           Provider.of<RoomViewmodel>(roomcontext,listen: false). updatekaresma( context:roomcontext,Amount: Give.ListUser.length*Give.price!* int.parse(Give.quantity??"0") );
//
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddKaresmaChair(userids: Give.ListUser,Amount:int.parse(Give.quantity??'0')*(Give.price??0) );
//           Provider.of<SvgViewmodel>(roomcontext,listen: false).getcontroller2(svga:Give.svga,Give: Give,context: roomcontext,userinfo:   usersender);
//
//         }
//
//         break;
//       case 26:
//         usermodel user=usermodel.fromJson(data['data']['user']);
//
//         guessgamemodel Guessgame=guessgamemodel.fromJson(data['data']['Guessgame']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddChatRoom(message: Chatroom(kind: 9,Guess:Guessgame ,id: data['data']['Guessgameid'],user:user,content:data['data']['Guess'],Coins:data['data']['Coins']));
//         break;
//       case 27:
//         guessgamemodel Guessgame=guessgamemodel.fromJson(data['data']['Guessgame']);
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).AddGuessGame(winnerid:data['data']['winner'],guess: Guessgame );
//         Provider.of<RoomViewmodel>(roomcontext,listen: false).ChangeGuessGame(Guess:Guessgame,winnerid: data['data']['winner']   );
//         break;
//       case 28:
//         SmartDialog.dismiss();
//         Provider.of<LoginViewmodel>(roomcontext,listen: false).LuckYPackage(id: int.parse(data['data']['id'].toString()),Lucky: data['data']['user'] );
//
//         break;
//       case 29:
//         var  Give = givegifts.fromJson(data['data']['gift']);
//         var usersender=usermodel.fromJson(data['data']['usersender']);
//         List Listuser=data['data']['user'];
//         Listuser.forEach((elements) {
//
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).Addmessagetocurrentroom(message: Chatroom(kind:2 ,user: usersender,id: 0,content:'xxxxxxxxxx',userId:usersender.id.toString(),updatedAt:        Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.updatedAt,roomId:  Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.id.toString(),createdAt:        Provider.of<RoomViewmodel>(roomcontext,listen: false).Currentroom?.createdAt,Gift:Give,Coins: elements, ));
//         }
//         );
//
//         if(data['data']['kind']==1||data['data']['kind']=='1'){
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddKaresmaChair(userids: Give.ListUser,Amount: ((Give.ListUser.length*Give.price!*int.parse(Give.quantity??"0"))/20).round()) ;
//           Provider.of<RoomViewmodel>(roomcontext,listen: false). updatekaresma( context:roomcontext,Amount:  ((Give.ListUser.length*Give.price!*int.parse(Give.quantity??"0"))/20).round() );
//         }else{
//           Provider.of<RoomViewmodel>(roomcontext,listen: false). updatekaresma( context:roomcontext,Amount: Give.ListUser.length*Give.price!* int.parse(Give.quantity??"0") );
//
//           Provider.of<RoomViewmodel>(roomcontext,listen: false).AddKaresmaChair(userids: Give.ListUser,Amount:int.parse(Give.quantity??'0')*(Give.price??0) );
//
//         }
//         Provider.of<SvgViewmodel>(roomcontext,listen: false).getcontroller2(svga:Give.svga,Give: Give,context: roomcontext,userinfo:   usersender);
//
//         break;
      case 30:

        //Provider.of<LoginViewmodel>(roomcontext,listen: false).QuantityGifts(id: 0,Lucky: data['data']['svga'] );

        break;
      default:

    }
  }
}
