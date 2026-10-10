import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/services/alerts.dart';
import 'package:ahlachat/core/services/services_locator.dart';
import 'package:ahlachat/core/utils/SharedWidget.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/main.dart';

import 'package:ahlachat/shop/presentation/Screans/mine_item_screan.dart';
import 'package:ahlachat/shop/presentation/components/Shared_button_widget.dart';
import 'package:ahlachat/shop/presentation/components/ShopHeadWidget.dart';
import 'package:ahlachat/shop/presentation/components/shop_buttom_widget.dart';
import 'package:ahlachat/shop/presentation/controller/shop_bloc.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/presentation/controller/my_profile_bloc.dart';


class ShopScrean extends StatelessWidget {
  const ShopScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        showpop: true,
        tittle: getLang(context: context, key: "Shop"),
        LeadWidget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                color: MainColor, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(onTap: () {
                final myBloc = BlocProvider.of<ShopBloc>(context);


                myBloc.add(GetMinePackageEvent());

              }, child: Row(children: [
                Text('Mine', style: StyleTitleW.copyWith(fontSize: 12)),
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 18,
                )
              ]),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(flex: 1, child: ShopHeadWidget()),
            Expanded(
                flex: 3,
                child: ShopButtomWidget()),
            ShopButtonWidget()
          ],
        ),
      ),
    );
  }
}


class ShopButtonWidget extends StatelessWidget {
  const ShopButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 30,),
            Expanded(
                child: BlocBuilder<ShopBloc, ShopState>(
                  builder: (context, state) {
                    return SharedButton(
                      Buttontittle: getLang(context: context, key: "Send"),
                      onClickAction: () {
                        if (state.SelectedItem == null) {
                          Showtoast(message: getLang(
                              context: context, key: "No_Select_Item"));
                        } else {
                          final myBloc = BlocProvider.of<MyProfileBloc>(
                              context);
                          myBloc.add(GetMyFriendsForItemEvent());
                        }
                      },

                    );
                  },
                )
            ),
            SizedBox(width: 40,),
            Expanded(
              child: BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  return SharedButton(Buttontittle: getLang(
                      context: context, key: "Bye"), onClickAction: () {
                    if (state.SelectedItem == null) {
                      Showtoast(message: getLang(
                          context: context, key: "No_Select_Item"));
                    } else {
                      final myBloc = BlocProvider.of<ShopBloc>(context);
                      myBloc.add(ByeItemEvent());
                    }
                  },);
                },
              ),
            ),
            SizedBox(width: 30,),
          ]),
    );
  }
}



