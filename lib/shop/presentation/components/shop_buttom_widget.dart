

import 'package:ahlachat/shop/presentation/components/vertical_tapbar.dart';
import 'package:ahlachat/shop/presentation/controller/shop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopButtomWidget extends StatefulWidget {

  @override
  State<ShopButtomWidget> createState() => _ShopButtomWidgetState();
}

class _ShopButtomWidgetState extends State<ShopButtomWidget>  with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {


    return Container(
      child: Column(mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BlocBuilder<ShopBloc, ShopState>(
            buildWhen:(previous, current) => previous.GetShopState!=current.GetShopState ,
            builder: (context, state) {
              return TabBar(physics: BouncingScrollPhysics(),
                  labelColor: Colors.black,
                  indicatorColor: Colors.transparent,
                  controller: _controller,
                  padding: EdgeInsets.zero,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  unselectedLabelColor: Colors.black54,
                  tabs:List.generate(state.ShopPackages.length, (index) =>  Tab(
                    text: state.ShopPackages[index].name??'',
                  ),)


              );
            },
          ),
          Expanded(
            child:       BlocBuilder<ShopBloc, ShopState>(
              buildWhen:(previous, current) => previous.GetShopState!=current.GetShopState ,
              builder: (context, state) {
                return TabBarView(physics: BouncingScrollPhysics(),
                    controller: _controller,
                    children: List.generate(state.ShopPackages.length, (index) =>   Center(
                      child: VerticalTapBar(Packages: state.ShopPackages[index]),
                    ),)



                );
              },
            ),
          )
        ],
      ),
    );
  }
}

