import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {

  String? tittle;
  bool  ? showpop;
  Widget?LeadWidget;
  Color  BC;
  Color  TC;
  CustomeAppBar({this.tittle,  this.showpop=false,this.LeadWidget,this.BC=Colors.white,this.TC=Colors.black});

  @override
  Widget build(BuildContext context) {

    return Directionality(textDirection: TextDirection.ltr,
      child: AppBar(elevation:0,
        actions: [

       if(LeadWidget!=null)   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LeadWidget,
        )],
        centerTitle: true,flexibleSpace: Container(
        color: BC,

      ),
        title:Text(tittle??"",style: TextStyle(color: TC,fontSize: 18,fontWeight: FontWeight.normal ),),
        automaticallyImplyLeading:  showpop!,
        backgroundColor: BC,
        iconTheme: IconThemeData(color: TC),

      ),
    );
  }
  // TODO: implement preferredSize
  @override
  Size get preferredSize =>   Size.fromHeight(50);
}
