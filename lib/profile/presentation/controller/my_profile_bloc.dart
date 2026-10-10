
import 'dart:io';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/data/models/levelModel.dart';
import 'package:ahlachat/profile/data/models/medalModel.dart';
import 'package:ahlachat/profile/data/models/mymedalModel.dart';
import 'package:ahlachat/profile/domin/usecases/get_fans_usecase.dart';
import 'package:ahlachat/profile/domin/usecases/get_followed_usecase.dart';
import 'package:ahlachat/profile/domin/usecases/get_friends_usecase.dart';
import 'package:ahlachat/profile/domin/usecases/get_level_use_case.dart';
import 'package:ahlachat/profile/domin/usecases/submit_feedback_use_case.dart';
import 'package:ahlachat/profile/domin/usecases/update_profile_image_usecase.dart';
import 'package:ahlachat/profile/domin/usecases/update_profile_usecase.dart';
import 'package:ahlachat/profile/presentation/Screans/level_screan.dart';
import 'package:ahlachat/profile/presentation/Screans/model_screan.dart';
import 'package:ahlachat/recharge/presentation/controller/recharge_bloc.dart';
import 'package:ahlachat/shop/presentation/Screans/my_friends_for_Item_screan.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/components/TermesAndCondition.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../domin/usecases/get_medal_use_case.dart';
import '../Screans/my_friends_screan.dart';

part 'my_profile_event.dart';
part 'my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  final GetFriendsUseCase GetFriendes;
  final GetFollowedUseCase GetFollowed;
  final GetFanUseCase GetFans;
  final GetMedalUseCase GetMedal;
  final GetLevelUseCase GetLevel;
  final SubmitFeedbackUseCase SubmitFeedBack;
  final UpdateProfileUseCase UpdateProfile;

  final  UpdateProfileImageUseCase UpdateImage;
  MyProfileBloc(this.GetFriendes,this.GetFollowed,this.UpdateProfile,this.GetFans,this.GetMedal,this.GetLevel,this.SubmitFeedBack,this.UpdateImage)  : super(MyProfileState()) {


    on<ChangeFollowedStatusEvent>((event, emit) async{
List<UserModel> Users= state.Followed ;
UserModel Userdata=Users[event.index] ;
Userdata.copyWith(followstatus: event.status);
emit(state.copyWith(
  GetFriendsState:   RequestState.loading,

));
state.Followed[event.index]=Userdata.copyWith(followstatus: event.status);
print(state..Followed[event.index].followstatus);
//    state.Followed[event.index].copyWith(followstatus: event.status);
// print(state.Followed[event.index].followstatus);
      emit(state.copyWith(Followed:  state.Followed,GetFriendsState: RequestState.loaded,));
//        print( event.status);
// print(state.Followed[event.index].followstatus);


    });

    on<ChangeFollowerStatusEvent>((event, emit) async{
      List<UserModel> Users= state.Fans ;
      UserModel Userdata=Users[event.index] ;
      Userdata.copyWith(followstatus: event.status);
      emit(state.copyWith(
        GetFriendsState:   RequestState.loading,

      ));
      state.Fans[event.index]=Userdata.copyWith(followstatus: event.status);


      emit(state.copyWith(Fans:  state.Fans,GetFriendsState: RequestState.loaded,));



    });
    on<ChangeFrindsStatusEvent>((event, emit) async{
      List<UserModel> Users= state.Friends ;
      UserModel Userdata=Users[event.index] ;
      Userdata.copyWith(followstatus: event.status);
      emit(state.copyWith(
        GetFriendsState:   RequestState.loading,

      ));
      state.Friends[event.index]=Userdata.copyWith(followstatus: event.status);


      emit(state.copyWith(Fans:  state.Friends,GetFriendsState: RequestState.loaded,));



    });
    on<GetMyFriendsEvent>((event, emit) async{

      ShowGlopalLoading();

      final result= await  GetFriendes.GetFriendsUse();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          GetFriendsState:   RequestState.error,

        ));
      }, (r){
        print(r.data?.length);
        emit(state.copyWith(
          Friends: r.data,
          GetFriendsState: RequestState.loaded,
        ));

      }   );

    });
    on<GetMyFriendsForItemEvent>((event, emit) async{

      ShowGlopalLoading();

      final result= await  GetFriendes.GetFriendsUse();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          GetFriendsState:   RequestState.error,

        ));
      }, (r){
        print(r.data?.length);
        emit(state.copyWith(
          Friends: r.data,
          GetFriendsState: RequestState.loaded,
        ));
        NavigateTo(context: NavigationService.CurrentContext, screen: MyFriendsForItemScrean());
      }   );

    });

    on<GetMoreFriendsEvent>((event, emit) async{

      ShowGlopalLoading();

      final result= await  GetFriendes.GetFriendsUse();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          GetFriendsState:   RequestState.error,

        ));
      }, (r){
        print(r.data?.length);

        emit(state.copyWith(
          Friends: r.data,
          GetFriendsState: RequestState.loaded,
        ));

      }   );

    });
    on<GetMyFollowedEvent>((event, emit) async{

      ShowGlopalLoading();

      final result= await  GetFollowed.GetFollowed();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          GetFriendsState:   RequestState.error,

        ));
      }, (r){

        emit(state.copyWith(
          Followed:  r.data,
          GetFriendsState: RequestState.loaded,
        ));


      }   );

    });
    on<GetFansEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  GetFans.GetFan();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          GetFriendsState:   RequestState.error,
        ));
      }, (r){
     //   Showtoast(message: r.statusMessage??'');
        emit(state.copyWith(
          Fans: r.data,
          GetFriendsState: RequestState.loaded,
        ));

      }   );

    });

    on<GetMedalEvent>((event, emit) async{
      ShowGlopalLoading();
      final result= await  GetMedal.GetMedal();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          GetMedalState:   RequestState.error,
        ));
      }, (r){
        emit(state.copyWith(
          Medal:   r.medal,
          MyMedal: r.mymedal,
          GetMedalState: RequestState.loaded,
        ));
        NavigateTo(context: NavigationService.CurrentContext, screen: MedalScrean());

      }   );

    });

    on<GetLevelEvent>((event, emit) async{

      ShowGlopalLoading();
      final result= await  GetLevel.GetLevel();
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          GetlevelState:    RequestState.error,
        ));
      }, (r){
        emit(state.copyWith(
          Income:  r.Income,
          wealth: r.Wealth,
          GetlevelState: RequestState.loaded,
        ));
        print( r.Income?.length);
        print( r.Wealth?.length);
        NavigateTo(context: NavigationService.CurrentContext, screen: MyLevelScrean());
      }   );

    });

    on<SubmitFeedBackEvent>((event, emit) async{

      ShowGlopalLoading();
      final result= await  SubmitFeedBack.SubmitFeed(describe: event.descrbe, content:  event.contact);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          SubmitFeedBackState:   RequestState.error,
        ));
      }, (r){
        emit(state.copyWith(
          SubmitFeedBackState: RequestState.loaded,
        ));

      }   );

    });

    on<ChangeProfileImageEvent>((event, emit) async{

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
          final result= await  UpdateImage.UpdateProfileImage(image:Files);
          DismissGlopalLoading();
          result.fold((l) {
            Showtoast(message: l.statusMessage??'');

            emit(state.copyWith(

             ChangeImageState:RequestState.error,

            ));

          },
                  (r){
                    final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
                    myBloc.add(ChangeImage(  image:AppConstance.imageThumbnailsUrl(r.image??''),));
                emit(state.copyWith(
                  ChangeImageState:  RequestState.loaded,

                ));



              }   );





        }
        print(Files);

      } else {

      }

    });


    on<UpdateProfileEvent>((event, emit) async{
      final myBloc = BlocProvider.of<UserloginBloc>(NavigationService.navigatorKey.currentContext!);
      ShowGlopalLoading();
      final result= await  UpdateProfile.UpdateProfile(name:   event.name, Flag:  myBloc.state.UserProfile?.flag,Country:  myBloc.state.UserProfile?.country,Signature:event.descript,date:event.data  );
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(
          UpdateProfileState:   RequestState.error,
        ));
      }, (r){
        Showtoast(message: r.statusMessage??'');
        myBloc.add(UpdateMyProfileEvent( name: event.name,discript: event.name,country:  myBloc.state.UserProfile?.country,flag:  myBloc.state.UserProfile?.flag,date: event.data ));
        emit(state.copyWith(
          UpdateProfileState: RequestState.loaded,
        ));

      }   );

    });


  }
}
