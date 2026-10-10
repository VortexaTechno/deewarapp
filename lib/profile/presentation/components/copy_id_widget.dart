import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CopyIdWidget extends StatelessWidget {
String ID;
  CopyIdWidget({Key? key,required this.ID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Clipboard.setData(ClipboardData(text:ID ));
      Showtoast(message: getLang(context: context, key: "Copied"));
    },
      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.copy_outlined,color: Colors.black26,size: 13,),
          Text( 'ID : ${ID} ',style:StyleTitleG),

        ],
      ),
    );
  }
}
