import 'dart:async';
import 'dart:io';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:ahlachat/agora/presentation/controller/agora_bloc.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/pusher/presentation/controller/pusher_bloc.dart';
import 'package:ahlachat/room/data/models/ChairModel.dart';
import 'package:ahlachat/room/data/models/RoomCategoryModel.dart';
import 'package:ahlachat/room/data/models/RoomModel.dart';
import 'package:ahlachat/room/data/models/SliderImage.dart';
import 'package:ahlachat/room/domin/usecases/Search_member_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/enter_password_usecase.dart';
import 'package:ahlachat/room/domin/usecases/follow_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/get_kicked_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/get_room_const_usecase.dart';
import 'package:ahlachat/room/domin/usecases/get_rooms_usecase.dart';
import 'package:ahlachat/room/domin/usecases/check_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/invite_user_to_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/join_member_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/join_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/kick_user_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/leave_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/un_follow_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/unkick_user_room_usecase.dart';
import 'package:ahlachat/room/domin/usecases/update_room_background_image_usecase.dart';
import 'package:ahlachat/room/domin/usecases/update_room_descripe_usecase.dart';
import 'package:ahlachat/room/domin/usecases/update_room_image_usecase.dart';
import 'package:ahlachat/room/domin/usecases/update_room_name_usecase.dart';
import 'package:ahlachat/room/presentation/Screans/room_screan.dart';
import 'package:ahlachat/room/presentation/components/Enter_Password_dialog_widget.dart';
import 'package:ahlachat/roomchat/presentation/controller/roomchat_bloc.dart';
import 'package:ahlachat/svga/data/ViewModel/show_entry_view_model.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {

  final GetRoomConstUseCase Getroomconst;
  final GetRoomsUseCase GetRoomsusecase;
  final CheckRoomsUseCase CheckRoomsusecase;
  final JoinRoomsUseCase JoinVoiceRoom;
  final LeaveRoomsUseCase LeaveVoiceRoom;
  final MemberRoomsUseCase MemberRoomse;

  final GetKickRoomsUseCase GetKickedUseCase;

  final SearchMemberRoomsUseCase SearchJoin;

  final EnterPasswordRoomsUseCase  EnterPasswordVoiceRoom;
  final UpdateRoomnameUseCase UpdateRoomname;
  final UpdateRoomdescripeUseCase UpdateRoomdescripe;

  final FollowRoomsUseCase  FollowRooms;
  final UnFollowRoomsUseCase  UnFollowRooms;
  final UpdateRoomImageUseCase UpdateImage;

  final UpdateRoombackgroundImageUseCase UpdatebackgroundImage;

  final InviteToRoomUseCase  InviteToRoom;


  final KickUserRoomsUseCase  KickUser;
  final UnKickUserRoomsUseCase  UnKickUser;

  RoomBloc(this.GetRoomsusecase,this.Getroomconst,this.GetKickedUseCase,this.KickUser,this.UnKickUser,this.SearchJoin,this.MemberRoomse,this.LeaveVoiceRoom,this.UpdateRoomdescripe,this.UpdateRoomname,this.UpdatebackgroundImage,this.UpdateImage,this.InviteToRoom,this.UnFollowRooms,this.CheckRoomsusecase,this.JoinVoiceRoom,this.EnterPasswordVoiceRoom,this.FollowRooms) : super(RoomState()) {
    on<GetRoomConst>((event, emit)async{
      ShowGlopalLoading();
      emit(state.copyWith(
        GetConstState:       RequestState.loading,
      ));
      final result= await  Getroomconst.GetRoomConst();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          GetConstState:RequestState.error,

        ));

      }, (r){


        emit(state.copyWith(
          Banners: r.Constdata?.sliderbanners ,
          RoomCategory:r.Constdata?.category ,
          GetConstState:RequestState.loaded,
          BackBanners:  r.Constdata?.Backsliderbanners,


        ));



      }   );

    });
    on<GetRoomsevent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(
        GetRoomsState:        RequestState.loading,
      ));
      final result= await  GetRoomsusecase.GetRooms();
      DismissGlopalLoading();

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(
          GetRoomsState:RequestState.error,
        ));

      }, (r){


        emit(state.copyWith(
          GetRoomsState:RequestState.loaded,
          Rooms:  r.Rooms
        ));



      }   );

    });
    on<CheckRoomsevent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(
        CheckRoomsState:        RequestState.loading,
      ));
      final result= await  CheckRoomsusecase.CheckVoiceRoom();
      DismissGlopalLoading();

      result.fold((l) {
        print('sssssssssssssssssssssssssssss');
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(
          CheckRoomsState:RequestState.error,
        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');
        print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');

       // List<RoomModel>Update = state.Rooms;

     //   Update.insert(0, r.data!);
        emit(state.copyWith(
            CheckRoomsState:RequestState.loaded,
            CurrentRoom: r.data,
           // Rooms:  Update
        ));
        RoomId=r.data?.id.toString();
        final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

          myBloc.add(JoinVoiceRoomEvent(id: r.data?.id??0));




      }   );

    });
    on<JoinVoiceRoomEvent>((event, emit)async{
      InRoom=true;
      NavigateTo(context: NavigationService.CurrentContext, screen: RoomScrean());
      var roomid=event.id;
      ShowGlopalLoading();
      emit(state.copyWith(
        JoinVoiceRoomState:         RequestState.loading,
      ));
      final result= await  JoinVoiceRoom.JoinVoiceRoom(id: event.id);
      DismissGlopalLoading();

      result.fold((l) {
        print('sssssssssssssssssssssssssssss');
        Showtoast(message: l.statusMessage??'');
        if(l.errNum==1){
          showDialog(barrierDismissible: false,
            context: NavigationService.CurrentContext,
            builder: (context) => PasswordEntryDialog(id:roomid),
          ) ;
        }
        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.error,

        ));

      }, (r){
        final myBloc2 = BlocProvider.of<PusherBloc>(NavigationService.CurrentContext);
        if(RoomId!=null){
          myBloc2.add(DisconnectRoomSocketEvent(id:int.parse(RoomId!) ));
        }



        emit(state.copyWith(
            JoinVoiceRoomState:RequestState.loaded,
            CurrentRoom: r.data,

        ));
        RoomId=r.data?.id.toString();
        JoinChairStatus=false;
        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);
        if(r.data?.describe!=null){
          final myBloc3 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);

          myBloc3.add(AddWelcomeChatEvent(status: 0,user: r.data?.owner??UserModel() ,tittle:r.data?.describe??''));
        }

        myBloc.add(EndAgoraEvent());
        final myBloc3 = BlocProvider.of<UserloginBloc>(NavigationService.CurrentContext);

        Provider.of<ShowEntryViewmodel>(NavigationService.CurrentContext,listen: false).ShowRoomEntryEvent(user: myBloc3.state.UserProfile!,);

        myBloc.add(initializeagoraEvent(role: ClientRole.Audience,Token: r.data?.voiceToken??'',channelName: r.data?.token??''));


        myBloc2.add(StartRoomSocketEvent());



      }   );

    });

    on<JoinVoiceRoomInRoomEvent>((event, emit)async{
      InRoom=true;

      var roomid=event.id;
      ShowGlopalLoading();
      emit(state.copyWith(
        JoinVoiceRoomState:         RequestState.loading,
      ));
      final result= await  JoinVoiceRoom.JoinVoiceRoom(id: event.id);
      DismissGlopalLoading();

      result.fold((l) {
        print('sssssssssssssssssssssssssssss');
        Showtoast(message: l.statusMessage??'');
        if(l.errNum==1){
          showDialog(barrierDismissible: false,
            context: NavigationService.CurrentContext,
            builder: (context) => PasswordEntryDialog(id:roomid),
          ) ;
        }
        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.error,

        ));

      }, (r){

        final myBloc2 = BlocProvider.of<PusherBloc>(NavigationService.CurrentContext);
        if(RoomId!=null){
          myBloc2.add(DisconnectRoomSocketEvent(id:int.parse(RoomId!) ));
        }



        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.loaded,
          CurrentRoom: r.data,

        ));
        RoomId=r.data?.id.toString();
        JoinChairStatus=false;
        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);
        if(r.data?.describe!=null){
          final myBloc3 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);

          myBloc3.add(AddWelcomeChatEvent(status: 0,user: r.data?.owner??UserModel() ,tittle:r.data?.describe??''));
        }
        myBloc.add(EndAgoraEvent());
        final myBloc3 = BlocProvider.of<UserloginBloc>(NavigationService.CurrentContext);

        Provider.of<ShowEntryViewmodel>(NavigationService.CurrentContext,listen: false).ShowRoomEntryEvent(user: myBloc3.state.UserProfile!,);

        myBloc.add(initializeagoraEvent(role: ClientRole.Audience,Token: r.data?.voiceToken??'',channelName: r.data?.token??''));

         myBloc2.add(StartRoomSocketEvent());


      }   );

    });

    on<JoinVoiceRoomDynamicLinkEvent>((event, emit)async{
      InRoom=true;
      NavigateToReplacement(context: NavigationService.CurrentContext, screen: RoomScrean());
      var roomid=event.id;
      ShowGlopalLoading();
      emit(state.copyWith(
        JoinVoiceRoomState:         RequestState.loading,
      ));
      final result= await  JoinVoiceRoom.JoinVoiceRoom(id: event.id);
      DismissGlopalLoading();

      result.fold((l) {
        print('sssssssssssssssssssssssssssss');
        Showtoast(message: l.statusMessage??'');
        if(l.errNum==1){
          showDialog(barrierDismissible: false,
            context: NavigationService.CurrentContext,
            builder: (context) => PasswordEntryDialog(id:roomid),
          ) ;
        }
        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.error,

        ));

      }, (r){


        final myBloc2 = BlocProvider.of<PusherBloc>(NavigationService.CurrentContext);

        if(RoomId!=null){
          myBloc2.add(DisconnectRoomSocketEvent(id:int.parse(RoomId!) ));
        }


        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.loaded,
          CurrentRoom: r.data,

        ));
        RoomId=r.data?.id.toString();
        JoinChairStatus=false;
        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);
        final myBloc3 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);
        if(r.data?.describe!=null){
          final myBloc3 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);

          myBloc3.add(AddWelcomeChatEvent(status: 0,user: r.data?.owner??UserModel() ,tittle:r.data?.describe??''));
        }
        myBloc.add(EndAgoraEvent());

        myBloc.add(initializeagoraEvent(role: ClientRole.Audience,Token: r.data?.voiceToken??'',channelName: r.data?.token??''));


        myBloc2.add(StartRoomSocketEvent());
        final myBloc4 = BlocProvider.of<UserloginBloc>(NavigationService.CurrentContext);

        Provider.of<ShowEntryViewmodel>(NavigationService.CurrentContext,listen: false).ShowRoomEntryEvent(user: myBloc4.state.UserProfile!,);


      }   );

    });
    on<EnterPasswordVoiceRoomEvent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(
        JoinVoiceRoomState:         RequestState.loading,
      ));
      final result= await  EnterPasswordVoiceRoom.EnterPasswordVoiceRoom(id: event.id,password: event.Password);
      DismissGlopalLoading();

      result.fold((l) {
        print('sssssssssssssssssssssssssssss');
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.error,
        ));

      }, (r){
        final myBloc2 = BlocProvider.of<PusherBloc>(NavigationService.CurrentContext);

        if(RoomId!=null){
          myBloc2.add(DisconnectRoomSocketEvent(id:int.parse(RoomId!) ));
        }




        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.loaded,
          CurrentRoom: r.data,

        ));
        print(r.data);
        RoomId=r.data?.id.toString();
        JoinChairStatus=false;
        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);

        if(r.data?.describe!=null){
          final myBloc3 = BlocProvider.of<RoomchatBloc>(NavigationService.CurrentContext);

          myBloc3.add(AddWelcomeChatEvent(status: 0,user: r.data?.owner??UserModel() ,tittle:r.data?.describe??''));
        }
        myBloc.add(EndAgoraEvent());

        myBloc.add(initializeagoraEvent(role: ClientRole.Audience,Token: r.data?.voiceToken??'',channelName: r.data?.token??''));

         myBloc2.add(StartRoomSocketEvent());
        final myBloc4 = BlocProvider.of<UserloginBloc>(NavigationService.CurrentContext);

        Provider.of<ShowEntryViewmodel>(NavigationService.CurrentContext,listen: false).ShowRoomEntryEvent(user: myBloc4.state.UserProfile!,);



      }   );

    });
    on<FollowRoomsevent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(
        FollowRoomsState:      RequestState.loading,
      ));
      final result= await  FollowRooms.FollowVoiceRoom(state.CurrentRoom?.id);
      DismissGlopalLoading();

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(
          FollowRoomsState:RequestState.error,
        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(
            FollowRoomsState:RequestState.loaded,
          CurrentRoom: state.CurrentRoom?.copyWith(FollowRoom: 1)

        ));



      }   );

    });
    on<UnFollowRoomsevent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(
        FollowRoomsState:      RequestState.loading,
      ));
      final result= await  UnFollowRooms.UnFollowVoiceRoom(state.CurrentRoom?.id);
      DismissGlopalLoading();

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(
          FollowRoomsState:RequestState.error,
        ));

      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(
            FollowRoomsState:RequestState.loaded,
            CurrentRoom: state.CurrentRoom?.copyWith(FollowRoom: 0)

        ));



      }   );

    });

    on<InviteuserRoomEvent>((event, emit)async{

      ShowGlopalLoading();

      final result= await  InviteToRoom.InviteToRoom(roomId: event.Roomid, id: event.id);
      DismissGlopalLoading();

      result.fold((l) {
        Showtoast(message: l.statusMessage??'');



      }, (r){
        Showtoast(message: r.statusMessage??'');

        emit(state.copyWith(
            FollowRoomsState:RequestState.loaded,


        ));



      }   );

    });

    on<ChangeRoomImageEvent>((event, emit) async{

      final ImagePicker _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile!= null) {

        File  Image = File(pickedFile.path);
        final Files=  await Cropedimage(value: Image);
        if(Files!=null){
          print(Files);

          ShowGlopalLoading();
          emit(state.copyWith(
            ChangeImageState: RequestState.loading,
          ));
          final result= await  UpdateImage.UpdateRoomImage(image:Files);
          DismissGlopalLoading();
          result.fold((l) {
            print('llllllllllllllllllllllllllllllllllllllllllllllllllllllll');
            Showtoast(message: l.statusMessage??'');

            emit(state.copyWith(

              ChangeImageState:RequestState.error,

            ));

          },
                  (r){
            print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
                    Showtoast(message: r.statusMessage??'');
                emit(state.copyWith(
                  ChangeImageState:  RequestState.loaded,

               CurrentRoom: state.CurrentRoom?.copyWith(image:AppConstance.imageThumbnailsUrl(r.image??'') ,
               )));



              }   );





        }
        print(Files);

      } else {

      }

    });

    on<ChangeRoomBackGroundImageEvent>((event, emit) async{

    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile!= null) {

    File  Image = File(pickedFile.path);
    final Files=  await Cropedimage(value: Image);
    if(Files!=null){
    print(Files);

    ShowGlopalLoading();
    emit(state.copyWith(
    ChangeImageState: RequestState.loading,
    ));
    final result= await  UpdatebackgroundImage.UpdatebackgroundRoomImage(image:Files);
    DismissGlopalLoading();
    result.fold((l) {
    print('llllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    Showtoast(message: l.statusMessage??'');

    emit(state.copyWith(

    ChangeImageState:RequestState.error,

    ));

    },
    (r){
    print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    Showtoast(message: r.statusMessage??'');
    emit(state.copyWith(
    ChangeImageState:  RequestState.loaded,

   ));



    }   );





    }
    print(Files);

    } else {

    }

    });

    on<ChangeRoomnameEvent>((event, emit) async{

          ShowGlopalLoading();
          emit(state.copyWith(
            ChangeImageState: RequestState.loading,
          ));
          final result= await  UpdateRoomname.UpdateRoomName(name:event.name);
          DismissGlopalLoading();
          result.fold((l) {
            print('llllllllllllllllllllllllllllllllllllllllllllllllllllllll');
            Showtoast(message: l.statusMessage??'');

            emit(state.copyWith(

              ChangeImageState:RequestState.error,

            ));

          },
                  (r){
                print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
                Showtoast(message: r.statusMessage??'');
                emit(state.copyWith(
                    ChangeImageState:  RequestState.loaded,

                    ));



              }   );

    });

    on<ChangeRoomdescripeEvent>((event, emit) async{

    ShowGlopalLoading();
    emit(state.copyWith(
    ChangeImageState: RequestState.loading,
    ));
    final result= await  UpdateRoomdescripe.UpdateRoomescripe(name:event.name);
    DismissGlopalLoading();
    result.fold((l) {
    print('llllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    Showtoast(message: l.statusMessage??'');

    emit(state.copyWith(

    ChangeImageState:RequestState.error,

    ));

    },
    (r){
    print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    Showtoast(message: r.statusMessage??'');
    emit(state.copyWith(
    ChangeImageState:  RequestState.loaded,

    ));


    }   );

    });


    on<ChangeImageEvent>((event, emit) async{emit(state.copyWith( CurrentRoom: state.CurrentRoom?.copyWith(image:event.image)));});
    on<ChangeBackImageEvent>((event, emit) async{emit(state.copyWith( CurrentRoom: state.CurrentRoom?.copyWith(screanImage:  event.image)));});
    on<ChangenameEvent>((event, emit) async{emit(state.copyWith( CurrentRoom: state.CurrentRoom?.copyWith(name:   event.image)));});
    on<ChangedescripEvent>((event, emit) async{emit(state.copyWith( CurrentRoom: state.CurrentRoom?.copyWith(describe:   event.image)));});


    on<LeaveVoiceRoomEvent>((event, emit)async{
      InRoom=false;

      var roomid=event.id;
      ShowGlopalLoading();
      emit(state.copyWith(
        JoinVoiceRoomState:         RequestState.loading,
      ));
      final result= await  LeaveVoiceRoom.LeaveVoiceRoom(id: event.id);


      result.fold((l) {
        print('sssssssssssssssssssssssssssss');
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.error,

        ));

      }, (r){
        final myBloc2 = BlocProvider.of<PusherBloc>(NavigationService.CurrentContext);
        myBloc2.add(DisconnectRoomSocketEvent(id:int.parse(roomid) ));
        RoomId=null;

        final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);

        myBloc.add(EndAgoraEvent());






        emit(state.copyWith(
          JoinVoiceRoomState:RequestState.loaded,
          CurrentRoom:RoomModel(),

        ));




      }   );
      DismissGlopalLoading();
    });

    on<GetJoinMemberRoomEvent>((event, emit)async{

emit(state.copyWith(

    MemperPaginateState:true

));


      final result= await  MemberRoomse.GetMemberRooms();


      result.fold((l) {

        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(


            MemperPaginateState:false
        ));

      }, (r){


if(JoinNextPage==1){
  emit(state.copyWith(

      JoindUsers:r.users,
      MemperPaginateState:false
  ));
}else{

List<UserModel> Users=  r.users!;
state.JoindUsers.addAll(Users);
  emit(state.copyWith(

      JoindUsers:state.JoindUsers,
      MemperPaginateState:false
  ));

}
print(state.JoindUsers.length);

        print(r.users);
        JoinNextPage=JoinNextPage+1;



      }   );
      DismissGlopalLoading();
    });
    on<GetKickedMemberRoomEvent>((event, emit)async{

      ShowGlopalLoading();

      final result= await  GetKickedUseCase.GetKickRooms();


      result.fold((l) {

        Showtoast(message: l.statusMessage??'');



      }, (r){
emit(state.copyWith(KickedUsers: r.users));






      }   );
      DismissGlopalLoading();
    });
    on<SearchMmeberRoomEvent>((event, emit)async{

      ShowGlopalLoading();



      final result= await  SearchJoin.SearchMemberRooms(tittle: event.tittle);


      result.fold((l) {

        Showtoast(message: l.statusMessage??'');



      }, (r){




          emit(state.copyWith(

              JoindUsers:r.data,

          ));






      }   );
      DismissGlopalLoading();
    });

    on<ChangeChairEvent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(

        CheckChairState:  RequestState.loading,

      ));
        RoomModel? Room=state.CurrentRoom;
      Room?.roomChairs![event.index].lock=event.status;

      emit(state.copyWith(
        CheckChairState:RequestState.loaded,
        CurrentRoom:Room,

      ));
      print(event.status);
      print( Room?.roomChairs![event.index].lock);
print(state.CurrentRoom?.roomChairs![event.index].lock);
      DismissGlopalLoading();
    });

    on<ChangemicEvent>((event, emit)async{

    ShowGlopalLoading();
    emit(state.copyWith(

    CheckChairState:  RequestState.loading,

    ));
    RoomModel? Room=state.CurrentRoom;
    Room?.roomChairs![event.index].mic=event.status;

    emit(state.copyWith(
    CheckChairState:RequestState.loaded,
    CurrentRoom:Room,

    ));

    DismissGlopalLoading();
    });

    on<AddUserToChairEvent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(

        CheckChairState:  RequestState.loading,

      ));
      RoomModel? Room=state.CurrentRoom;
      Room?.roomChairs![event.index].user=event.user;
      Room?.roomChairs![event.index].hostId=event.user.id;

      emit(state.copyWith(
        CheckChairState:RequestState.loaded,
        CurrentRoom:Room,

      ));
      print(event.user);
      print( Room?.roomChairs![event.index].user);
      print(state.CurrentRoom?.roomChairs![event.index].user);
      DismissGlopalLoading();
    });
    on<RemoveUserToChairEvent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(

        CheckChairState:  RequestState.loading,

      ));
      RoomModel? Room=state.CurrentRoom;
      Room?.roomChairs![event.index].user=null;
      Room?.roomChairs![event.index].hostId=null;
      Room?.roomChairs![event.index].mic=0;
      emit(state.copyWith(
        CheckChairState:RequestState.loaded,
        CurrentRoom:Room,

      ));

      DismissGlopalLoading();
    });
    on<RemoveUserFromRoomEvent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(

        CheckChairState:  RequestState.loading,

      ));
      RoomModel? Room=state.CurrentRoom;
    List <RoomChairs>?Chair = Room?.roomChairs?.where((element) => element.hostId==event.id).toList();
    if(Chair?.length!=0){
     int Index=(Chair?.first.chairId??0);
      Room?.roomChairs![Index].hostId=null;
     Room?.roomChairs![Index].user=null;
    }
      int usernumber= (Room?.joinNum??0)-1;

      emit(state.copyWith(
        CheckChairState:RequestState.loaded,
        CurrentRoom:Room?.copyWith(joinNum: usernumber),

      ));


      DismissGlopalLoading();
    });

    on<KickUserFromRoomEvent>((event, emit)async{

      ShowGlopalLoading();
      emit(state.copyWith(

        CheckChairState:  RequestState.loading,

      ));
      RoomModel? Room=state.CurrentRoom;
      List <RoomChairs>?Chair = Room?.roomChairs?.where((element) => element.hostId==event.id).toList();
      print(Chair);
      if(Chair?.length!=0){
        int Index=(Chair?.first.chairId??0);
        print('Chair Index ${Index}');
        Room?.roomChairs![Index].hostId=null;
        Room?.roomChairs![Index].user=null;
      }
      int usernumber= (Room?.joinNum??0)-1;

      if(event.id.toString()==UserId){
        Showtoast(message: 'you are  Kicked from  Room ');
        if(InRoom){
          Navigator.pop(NavigationService.CurrentContext);
          InRoom=false;
        }


        final myBloc2 = BlocProvider.of<PusherBloc>(NavigationService.CurrentContext);
         final myBloc = BlocProvider.of<AgoraBloc>(NavigationService.CurrentContext);
        myBloc2.add(DisconnectRoomSocketEvent(id:int.parse(RoomId!) ));
        RoomId=null;



        myBloc.add(EndAgoraEvent());



        emit(state.copyWith(
          CheckChairState:RequestState.loaded,
          CurrentRoom:RoomModel(),

        ));
      }else{
        emit(state.copyWith(
          CheckChairState:RequestState.loaded,
          CurrentRoom:Room?.copyWith(joinNum: usernumber),

        ));
      }




      DismissGlopalLoading();
    });

    on<KickUserEvent>((event, emit)async{


      ShowGlopalLoading();

      final result= await  KickUser.KickUserRooms(id: event.id);


      result.fold((l) {

        Showtoast(message: l.statusMessage??'');


      }, (r){

        Showtoast(message: r.statusMessage??'');



      }   );
      DismissGlopalLoading();
    });
    on<UnKickUserEvent>((event, emit)async{


      ShowGlopalLoading();

      final result= await  UnKickUser.UnKickUserRooms(id: event.id);


      result.fold((l) {

        Showtoast(message: l.statusMessage??'');


      }, (r){

        Showtoast(message: r.statusMessage??'');
        List<UserModel> Kicked=state.KickedUsers;
        Kicked.removeWhere((element) => element.id==event.id);
        print(Kicked);
        emit(state.copyWith(KickedUsers: Kicked));




      }   );
      DismissGlopalLoading();
    });


    on<IncreaseCurrentRoomDonate>((event, emit) async{
      emit(state.copyWith(CurrentRoom:state.CurrentRoom?.copyWith(donate:  ((state.CurrentRoom?.donate??0)+event.Coins) ) ));
    });


  }
}
