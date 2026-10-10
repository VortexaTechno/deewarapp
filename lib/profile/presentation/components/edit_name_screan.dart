import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:ahlachat/users/presentation/components/shared_textformfield.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EditNameScean extends StatelessWidget {
  String name;
    EditNameScean({required this.name});

  @override
  Widget build(BuildContext context) {
    TextEditingController NameController=TextEditingController(text: name);
    return Scaffold(
      appBar:CustomeAppBar(showpop: true,tittle:'Nickname',LeadWidget: Center(child: InkWell(onTap: () {
        final myBloc = BlocProvider.of<MyProfileBloc>(context);
        myBloc.add(UpdateProfileEvent(name:NameController.text ));

      },child: Text('Save',style: StyleTitle.copyWith(color:MainColor,fontSize: 17),)))),
      body: CustomeTextField(hint: 'Nickname',Controller: NameController,onChanged: (c){
        name=c;
      }),
    );
  }
}
