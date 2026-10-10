import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class InboxRoomScrean extends StatelessWidget {
  const InboxRoomScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       centerTitle: true,
       title: Text('المحادثات',style: StyleTitleB.copyWith(fontSize: 18)),
       leading:Padding(
         padding: const EdgeInsets.all(10.0),
         child: Container(decoration: BoxDecoration(color:Colors.grey.withOpacity(0.3),borderRadius: BorderRadius.circular(10)),child: Center(child: Icon(Icons.add,color: Colors.black),)),
       ),
     ),
      body:CustomScrollView(
        slivers: [
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
          SliverToBoxAdapter(child: Container(height: 100,child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) => 
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: [
                Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,gradient: AppGradiant),child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(radius: 32,backgroundColor: Colors.white,child: CircleAvatar(radius:30,backgroundImage: ExactAssetImage(Images.leaderboard))),
                )),
          SizedBox(height: 5,),
             Text('data',style: StyleTitleBN,)
              ],
            ),
          )))),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 7)),
          // SliverToBoxAdapter(child: Container(height: 70,
          //   child: Row(
          //    children: [
          //      SizedBox(width: 5,),
          //      Expanded(child:Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image:DecorationImage(image:  ExactAssetImage(Images.bg_cover_blind),fit: BoxFit.fill)),)),
          //      SizedBox(width: 10,),
          //      Expanded(child:Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image:DecorationImage(image:  ExactAssetImage(Images.bg_cover_truth),fit: BoxFit.fill)),)),
          //      SizedBox(width: 5,),
          //    ],
          //   ),
          // ),)

        ],
      ),

    );
  }
}
