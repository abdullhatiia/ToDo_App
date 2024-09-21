import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/app_theme_manager.dart';
import 'package:todo_app/core/routes_genarator.dart';
import 'package:todo_app/core/page_routs_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/moduls/login/login_view.dart';
import 'package:todo_app/moduls/splash/splash_view.dart';
 // import 'package:todo_app/services/loading_service.dart';
import 'core/services/loading_service.dart';
import 'core/settings_provider.dart';
import 'firebase_options.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:lottie/lottie.dart';
import 'dart:collection';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  configration();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: appthememanager.lighttheme,
      initialRoute: pageroutesname.initial,
      onGenerateRoute: routesgenaration.ongenrateroutes,
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}


