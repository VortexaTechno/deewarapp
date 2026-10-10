import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/presentation/components/edit_name_screan.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/users/presentation/components/select_country_code.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScrean extends StatelessWidget {
  const EditProfileScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(showpop: true, tittle: 'Modify information'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: BlocBuilder<UserloginBloc, UserloginState>(
              buildWhen: (previous, current) => previous.UserProfile?.image!=current.UserProfile?.image,
              builder: (context, state) {
                return  InkWell( onTap: () {
                  final myBloc = BlocProvider.of<MyProfileBloc>(context);
                  myBloc.add(ChangeProfileImageEvent());

                },
                  child: Container(height: 110,
                    decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: CachedNetworkImageProvider(state.UserProfile?.image??''))),
                  ),
                );
              },
            ),),
            SliverToBoxAdapter(child: BlocBuilder<UserloginBloc, UserloginState>(
              buildWhen: (previous, current) => previous.UserProfile?.name!=current.UserProfile?.name,
              builder: (context, state) {

    return EditProfileList(onClickAction: (){

      NavigateTo(context: context, screen: EditNameScean(name:  state.UserProfile?.name??'',));

    },Title: state.UserProfile?.name??'', StartTitle: 'NickName',);
  },
),),
            SliverToBoxAdapter(child: BlocBuilder<UserloginBloc, UserloginState>(
              buildWhen: (previous, current) => previous.UserProfile?.sex!=current.UserProfile?.sex,
              builder: (context, state) {
                return EditProfileList( Title: state.UserProfile?.sex=='0'?'Male':'Female', StartTitle: 'Gender',);
              },
            ),),
            SliverToBoxAdapter(child: BlocBuilder<UserloginBloc, UserloginState>(
              buildWhen: (previous, current) => previous.UserProfile?.date!=current.UserProfile?.date,
              builder: (context, state) {
                return EditProfileList(onClickAction: (){
                  showDatePickersProfile(context);
                },Title:ConvertTimeToday(Time: state.UserProfile?.date??'') , StartTitle: 'Birthday',);
              },
            ),),
            SliverToBoxAdapter(child: BlocBuilder<UserloginBloc, UserloginState>(
              buildWhen: (previous, current) => previous.UserProfile?.country!=current.UserProfile?.country,
              builder: (context, state) {
                return EditProfileList(onClickAction: (){
                  showDialog(

                      context: NavigationService.CurrentContext,
                      builder: (_) => new Dialog(

                          child: Row(
                            children: [
                              Container(),
                              CountryCodePhone(ShowCode: true,),
                            ],
                          )
                      ));
                },Title: state.UserProfile?.country??'',Flag: state.UserProfile?.flag, StartTitle: 'Country',);
              },
            ),),
            SliverToBoxAdapter(child: BlocBuilder<UserloginBloc, UserloginState>(
              buildWhen: (previous, current) => previous.UserProfile?.descript!=current.UserProfile?.descript,
              builder: (context, state) {
                return EditProfileList(onClickAction: (){},Title: state.UserProfile?.descript??getLang(context:context,key: "Not_set"), StartTitle: 'Signature',);
              },
            ),),


          ],
        ),
      ),
    );
  }
}

class EditProfileList extends StatelessWidget {
  final String StartTitle;
  final String Title;
  final String? Flag;
  final  Function ?onClickAction;
  EditProfileList({required this.StartTitle , this.Flag,this.onClickAction,required this.Title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:15,horizontal: 15),
      child: InkWell(
        onTap: onClickAction==null?null:()=>onClickAction!(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StartTitle,style: StyleTitleBN.copyWith(fontSize: 13,fontWeight: FontWeight.normal),),
            Row(
              children: [
                Text(Title,style: StyleTitleG.copyWith(fontSize: 12,fontWeight: FontWeight.bold),),
     if(Flag!=null)     Padding(
       padding: const EdgeInsets.symmetric(horizontal: 5),
       child: Image.asset(
         Flag!,
         package: countryCodePackageName,height: 15,

       ),
     ),
     Opacity(opacity: onClickAction==null?0:1,child: Icon(Icons.navigate_next,color: Colors.black26,size: 25,)),

              ],
            )
          ],
        ),
      ),
    );
  }
}




