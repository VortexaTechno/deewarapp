import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/room/presentation/controller/room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordEntryDialog extends StatelessWidget {
  int id;
  PasswordEntryDialog({required this.id});
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '🔒 Enter Password',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,

              decoration: InputDecoration(

                hintText: 'Password',
                prefixIcon: Icon(Icons.lock,color: MainColor),
                border: InputBorder.none, // Remove the border


              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                // Perform password validation or any other actions
                if(_passwordController.text.length==0){
                  Showtoast(message: getLang(context: context,key: 'Confirm_pass'));
                }else{
                  Navigator.of(context).pop();

                  final myBloc = BlocProvider.of<RoomBloc>(NavigationService.CurrentContext);

                  myBloc.add(EnterPasswordVoiceRoomEvent(id: id,Password: _passwordController.text));
                }




              },
              child: Text('Submit',style: StyleTitle),
            ),
          ],
        ),
      ),
    );
  }
}
