import 'dart:async';
import 'dart:io';

import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/enums.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/userprofile/data/models/ProfileImageModel.dart';
import 'package:ahlachat/userprofile/domin/usecases/delete_user_image_profile_usecase.dart';
import 'package:ahlachat/userprofile/domin/usecases/follow_user_usecase.dart';
import 'package:ahlachat/userprofile/domin/usecases/get_user_profile_in_room_usecase.dart';
import 'package:ahlachat/userprofile/domin/usecases/get_user_profile_usecase.dart';
import 'package:ahlachat/userprofile/domin/usecases/upload_new_profile_image_usecase.dart';
import 'package:ahlachat/userprofile/presentation/Screans/user_profile_screan.dart';
import 'package:ahlachat/users/data/models/UserModel.dart';
import 'package:ahlachat/users/presentation/components/TermesAndCondition.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';                           
                                                           
part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetUserProfileUseCase GetUserProfilee;

  final  GetUserProfileinroomUseCase  GetUserProfileRoom;

  final DeleteImageProfileUseCase DeleteUserImage;
  final UploadImageProfileUseCase UploadImageProfileUse;
  UserProfileBloc(this.GetUserProfilee ,this.DeleteUserImage,this.GetUserProfileRoom,this.UploadImageProfileUse) : super(UserProfileState()) {
    on<GetUserProfileEvent>((event, emit) async{
      emit(state.copyWith(
        Profile:  event.User ,
      ));


      ShowGlopalLoading();
      emit(state.copyWith(
        GetProfileState: RequestState.loading,
      ));
      final result= await  GetUserProfilee.GetUserProfile(id: event.User.id);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');

        emit(state.copyWith(

          GetProfileState:RequestState.error,

        ));

      },
              (r){


        emit(state.copyWith(

          Profile:  r.data ,
          GetProfileState:RequestState.loaded,

        ));

        NavigateTo(context: NavigationService.CurrentContext, screen: UserProfileScrean());
       // NavigateTo(context: NavigationService.CurrentContext, screen: ShopScrean());

      }   );

    });


    on<ChangeFollowStatusProfileEvent>((event, emit) async{

    emit(state.copyWith(
    Profile:  state.Profile?.copyWith(followstatus: event.status) ,
      GetProfileState:RequestState.loaded,

    ));



    });


    on<GetUserProfileRoomEvent>((event, emit) async{
    emit(state.copyWith(
    Profile:  event.User ,
      GetProfileState: RequestState.loading,
    ));




    final result= await  GetUserProfileRoom.GetUserProfileRoom(id: event.User.id);

    result.fold((l) {
    Showtoast(message: l.statusMessage??'');

    emit(state.copyWith(

    GetProfileState:RequestState.error,

    ));

    },
    (r){


    emit(state.copyWith(

    Profile:  r.data ,
    GetProfileState:RequestState.loaded,

    ));


    // NavigateTo(context: NavigationService.CurrentContext, screen: ShopScrean());

    }   );

    });




    on<DeleteImageUserProfileEvent>((event, emit) async{

      emit(state.copyWith(

        DeleteProfileImageState:RequestState.loading,

      ));
      ShowGlopalLoading();

      final result= await  DeleteUserImage.DeleteUserImage(id: event .id);
      DismissGlopalLoading();
      result.fold((l) {
        Showtoast(message: l.statusMessage??'');
        emit(state.copyWith(
          DeleteProfileImageState:RequestState.error,
        ));

      }, (r){
 List<ProfileImageModel> LIST2=state.Profile?.ProfileImage??[];
 LIST2 .removeWhere((element) => element.id==event.id);
        emit(state.copyWith(
         Profile: state.Profile?.copyWith(ProfileImage: LIST2),

          DeleteProfileImageState:RequestState.loaded,

        ));




      }   );

    });

    on<AddProfileImageEvent>((event, emit) async{

      final ImagePicker _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile!= null) {

     File  Image = File(pickedFile.path);
     final Files=  await Cropedimage(value: Image);
if(Files!=null){
  print(Files);

  ShowGlopalLoading();
  emit(state.copyWith(
    DeleteProfileImageState: RequestState.loading,
  ));
  final result= await  UploadImageProfileUse.UploadImageProfile(image:Files);
  DismissGlopalLoading();
  result.fold((l) {
    Showtoast(message: l.statusMessage??'');

    emit(state.copyWith(

      DeleteProfileImageState:RequestState.error,

    ));

  },
          (r){
        List<ProfileImageModel>?  LSIT1=  state.Profile?.ProfileImage;
        LSIT1?.add(r.data!);
        emit(state.copyWith(

            Profile:state.Profile?.copyWith(ProfileImage: LSIT1) ,
          DeleteProfileImageState:RequestState.loaded,

        ));



      }   );





  }
print(Files);

      } else {

      }

    });
  }
}
