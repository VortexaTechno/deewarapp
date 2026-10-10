import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/core/utils/validation.dart';
import 'package:ahlachat/users/presentation/components/select_country_code.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/components/shared_textformfield.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterScrean extends StatelessWidget {
  TextEditingController NameTextField=TextEditingController();
  TextEditingController DescriptionTextField=TextEditingController();
  TextEditingController CodeTextField=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomeAppBar(showpop: true,tittle:getLang( context: context, key: "Sign_up") ,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              Column( mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  SizedBox(height: 50,),
                  Center(
                    child: BlocBuilder<UserloginBloc, UserloginState>(
  builder: (context, state) {
    if(state.Picker==null){
      return InkWell(onTap: (){
            final myBloc = BlocProvider.of<UserloginBloc>(context);
            myBloc.add(PickSignUpImage( ));
      },child: CircleAvatar(radius: 45,backgroundColor:  Colors.white,backgroundImage: ExactAssetImage('assets/image/App/picture_blank_portrait.png'),));
    }
      return InkWell(onTap: () {
          final myBloc = BlocProvider.of<UserloginBloc>(context);
          myBloc.add(PickSignUpImage());
      },child: CircleAvatar(radius: 45,backgroundColor: Colors.white,backgroundImage: FileImage(state.Picker!),));
  },
),
                  ),

                  SizedBox(height: 30,),
                  CustomeTextField(enable: true,hint:getLang( context: context, key: "Enter_Name"),type: TextInputType.text,Controller:NameTextField  ),
                  SizedBox(height: 30,),
                  CustomeTextField(enable: true,hint:getLang( context: context, key: "Enter_Description"),type: TextInputType.text,Controller:DescriptionTextField  ),
                  SizedBox(height: 30,),
                  InkWell(onTap: () {
                    showDatePickers(context);
                  },
                    child: Container(height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: TextFormColor ),width:SizeConfig.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: BlocBuilder<UserloginBloc, UserloginState>(
                        buildWhen:(previous, current) => previous.SelectData!=current.SelectData ,
  builder: (context, state) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.SelectData!=null?convertDatetimeString(state.SelectData.toString()):getLang( context: context, key: "Birthday"),style: TextStyle(color: Colors.black26)),
                          Icon(Icons.date_range_rounded,color: MainColor,)
                        ],
                      );
  },
),
                    ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(onTap: () {
                    showDatePickers(context);
                  },
                    child: Container(height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: TextFormColor ),width:SizeConfig.screenWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: BlocBuilder<UserloginBloc, UserloginState>(
                          buildWhen:(previous, current) => previous.CountryCode!=current.CountryCode ,
                          builder: (context, state) {
                            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text( state.CountryCode.Country??'' ,style: TextStyle(color: Colors.black26)),
                                CountryCodePhone(ShowCode: true,)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: TextFormColor ),width:SizeConfig.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: BlocBuilder<UserloginBloc, UserloginState>(
                        buildWhen:(previous, current) => previous.Gender!=current.Gender ,
                        builder: (context, state) {
                          final myBloc = BlocProvider.of<UserloginBloc>(context);
                          return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text( getLang( context: context, key: "Gender"),style: TextStyle(color: Colors.black26)),
                              Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: InkWell(onTap: () {

                                     myBloc.add(UpdateGinderEvent(gender: 0));
                                   },child: Image.asset(state.Gender==0?'assets/image/App/basic_info_boy_selected.png':'assets/image/App/basic_info_boy.png')),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: InkWell(onTap: () {

                                     myBloc.add(UpdateGinderEvent(gender: 1));
                          },child: Image.asset(state.Gender==1?'assets/image/App/basic_info_girl_selected.png':'assets/image/App/basic_info_girl.png')),
                                 ),
                               ],

                             )
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                ]
              ),

          Center(
            child: BlocBuilder<UserloginBloc, UserloginState>(
              builder: (context, state) {
    return UserSharedButton(Buttontittle: getLang(context: context,key: "Done"),onClickAction: (){
                if(state.Picker==null){
                Showtoast(message:getLang(context: context,key:"Select_Photo" ) );
                }else  if(!validateName(Name:NameTextField.text ,)){
                Showtoast(message:getLang(context: context,key:"Enter_Name" ) );
                }else if(DescriptionTextField.text==''){
                  Showtoast(message:getLang(context: context,key:"No_Description" ) );
                }else if(state.SelectData==null){
                  Showtoast(message:getLang(context: context,key:"Select_Birthday" ) );
                }else{
                     final myBloc = BlocProvider.of<UserloginBloc>(context);
                    myBloc.add(Register(description: DescriptionTextField.text,name: NameTextField.text,date: state.SelectData,sex: state.Gender,));
                }


              },);
  },
))
            ],
          ),
        ),
      )

    );
  }
}



