
import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routs_names.dart';
import 'package:todo_app/moduls/layout_view.dart';
import 'package:todo_app/moduls/login/login_view.dart';
import 'package:todo_app/moduls/registeration/registeration_view.dart';
import 'package:todo_app/moduls/splash/splash_view.dart';

class routesgenaration{
  static Route<dynamic>ongenrateroutes(RouteSettings settings ){

    switch(settings.name){
      case pageroutesname.initial:
        return MaterialPageRoute(builder: (context) =>
            const splashview(),
          settings: settings,
        );
      case pageroutesname.login:
        return MaterialPageRoute(builder: (context) =>
            const loginview(),
          settings: settings,
        );
      case pageroutesname.registeration:
        return MaterialPageRoute(builder: (context) =>
        const registerationview(),
          settings: settings,
        );
      case pageroutesname.layout:
        return MaterialPageRoute(builder: (context) =>
            const layoutview(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (context) =>
        const splashview(),
        settings:settings);


    }


  }
}
