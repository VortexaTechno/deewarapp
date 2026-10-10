 
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/userprofile/presentation/components/show_image_profile.dart';
import 'package:ahlachat/userprofile/presentation/controller/user_profile_bloc.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
class AddImageProfileScrean extends StatelessWidget {
  const AddImageProfileScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      appBar: CustomeAppBar(tittle:getLang(context: context,key: "Profile_Photo") ,showpop: true),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:   BlocBuilder<UserProfileBloc, UserProfileState>(
 
  builder: (context, state) {

    return CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio:1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  if(index==state.Profile?.ProfileImage?.length){
                    return InkWell(onTap: (){
                      final myBloc = BlocProvider.of<UserProfileBloc>(context);
                      myBloc.add(AddProfileImageEvent());
                    },child: Container(height: 60,width: 60,child: Center(child: Image.asset(Images.ic_image, height: 30,)),decoration: BoxDecoration(color: BackgroundGray,borderRadius:BorderRadius.circular(10)  ),))  ;
                  }
                  return Stack(
                  children: [
                    InkWell(onTap: () {
                      NavigateTo(context: context, screen: ImageViewProfile(ProfileImage:state.Profile?.ProfileImage,photoindex:index ,));
                    },child:  Container( decoration: BoxDecoration(color: Colors.grey,borderRadius:BorderRadius.circular(10) ,image: DecorationImage(image:CachedNetworkImageProvider( state.Profile?.ProfileImage![index].image??''),fit: BoxFit.cover)),)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(onTap: () {
                        final myBloc = BlocProvider.of<UserProfileBloc>(context);
                        myBloc.add(DeleteImageUserProfileEvent(id: state.Profile?.ProfileImage![index].id  ));
                      },child: Icon(Icons.cancel_outlined,color: Colors.orange,)),
                    )
                  ],
                  )  ;
                },childCount: (state.Profile?.ProfileImage?.length??0)+1,
              ),
            ),
          ],
        );
  },
),
      ),
    );
  }
}
