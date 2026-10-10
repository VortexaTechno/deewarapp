import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/shop/presentation/Screans/shop_screan.dart';
import 'package:ahlachat/splashscrean.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
      switch (settings.name) {
        case RouteConstance.splash_screan:
          return MaterialPageRoute(builder: (_) =>  SplashScrean());
        case RouteConstance.Shop_Screan:
          return MaterialPageRoute(builder: (_) =>  ShopScrean());
        default:
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
      }
    }


