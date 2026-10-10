import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/helper.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';
import 'package:ahlachat/profile/presentation/Screans/my_model_screan.dart';
import 'package:ahlachat/profile/presentation/controller/my_profile_bloc.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MedalScrean extends StatelessWidget {
  const MedalScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(Images.ic_g1),fit: BoxFit.cover)),
      child: Scaffold(backgroundColor: Colors.transparent,
        appBar: CustomeAppBar(tittle: getLang(context: context, key: "Achivement"),LeadWidget: InkWell(onTap: () => NavigateTo(context: context, screen: MyMedalScrean()),child: Image.asset(Images.icequip,height: 50)),showpop: true,BC: Colors.transparent,TC: Colors.white),
body: BlocBuilder<MyProfileBloc, MyProfileState>(
  buildWhen: (previous, current) => previous.GetMedalState!=current.GetMedalState,
  builder: (context, state) {
    return GridView.builder( gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 0.8,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20)  ,itemCount:state.Medal.length , itemBuilder:(context, index) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(onTap: () {

        ShowModelDetales(Model: (state.Medal[index]) );

      },
        child: Column(
          children: [
            state.MyMedal.where((element) => element.medal?.id==state.Medal[index].id).toList().isNotEmpty? CachedNetworkImage(imageUrl:state.Medal[index].image??'' ,):   CachedNetworkImage(imageUrl:state.Medal[index].bImage??'' ,),
            SizedBox(height: 10,),
            Text(state.Medal[index].tittle??'' ,style: StyleTitleW,)
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
