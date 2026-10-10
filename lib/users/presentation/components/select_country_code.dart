import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/users/data/models/SelectCodeModel.dart';
import 'package:ahlachat/users/presentation/controller/userlogin_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCodePhone extends StatelessWidget {
bool ShowCode=true;
CountryCodePhone({required this.ShowCode});


  @override
  Widget build(BuildContext context) {
    return  CountryCodePicker(
      onChanged: (value){
        final myBloc = BlocProvider.of<UserloginBloc>(context);
        myBloc.add(UpdateCountryCode(CountryCode: SelectCodeModel(flag:value.flagUri,Country:value.name ,code:value.dialCode ),));
print(value.name);
        print(value.code);        print(value.flagUri); print(value.dialCode);
      },
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'EG',
      favorite: ['+20','EG'],
      // optional. Shows only country name and flag
      showCountryOnly: ShowCode,textStyle:TextStyle(color: MainColor),

      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: ShowCode,searchStyle: TextStyle(color: MainColor),
      // optional. aligns the flag and the Text left
      alignLeft: false,
    );
  }
}
