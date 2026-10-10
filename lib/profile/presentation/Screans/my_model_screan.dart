import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyMedalScrean extends StatelessWidget {
  const MyMedalScrean({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.ic_g1),fit: BoxFit.cover)),
      child: Scaffold(backgroundColor: Colors.transparent,
        appBar: CustomeAppBar(tittle: getLang(context: context, key: "My_Achivement"),showpop: true,BC: Colors.transparent,TC: Colors.white),
        body: BlocBuilder<MyProfileBloc, MyProfileState>(
          buildWhen: (previous, current) => previous.GetMedalState!=current.GetMedalState,
          builder: (context, state) {
            return GridView.builder( gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20)  ,itemCount:state.MyMedal.length , itemBuilder:(context, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(onTap: () {
                ShowModelDetales(Model: (state.MyMedal[index].medal)! );

              },
                child: Column(
                  children: [
         CachedNetworkImage(imageUrl:state.MyMedal[index].medal?.image??'' ,),
                    SizedBox(height: 10,),
                    Text(state.MyMedal[index].medal?.tittle??'' ,style: StyleTitleW,)
                  ],
                ),
              ),
            ) );
          },
        ),
      ),
    );
  }
}
