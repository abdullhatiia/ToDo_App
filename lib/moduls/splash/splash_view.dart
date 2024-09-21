import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/page_routs_names.dart';

class splashview extends StatefulWidget {
  const splashview({super.key});

  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview> {
  @override
  void initState() {
    Timer(const Duration(seconds:3),
          (){
        Navigator.pushReplacementNamed(
            context,
            pageroutesname.login) ;

      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/splash_background.png",
      fit: BoxFit.cover,
    );
  }
}
