
import 'package:ahlachat/shop/presentation/components/ShopHeadWidget.dart';
import 'package:ahlachat/shop/presentation/components/mine_buttom_widget.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:flutter/material.dart';


class MineScrean extends StatelessWidget {
  const MineScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        showpop: true,
        tittle: "Mine",
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(flex:1, child: ShopHeadWidget()),
            Expanded(
                flex: 3,
                child:MineButtomWidget()
            ),

          ],
        ),
      ),
    );
  }
}


