import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsprovider extends ChangeNotifier{

  String currentLanguage="en";
  ThemeMode currenttheme=ThemeMode.dark;

  void changeLanguage(String newLanguage)
  {
    if(currentLanguage==newLanguage) return;
    currentLanguage=newLanguage;
    notifyListeners();
  }

  void changethememode(ThemeMode newtheme){
    if (currenttheme== newtheme) return;
    currenttheme= newtheme;
    notifyListeners();
  }


  String gethomebackground(){
    return currenttheme== ThemeMode.dark?"assets/images/bg.png":"assets/images/bg3 (1).png";
  }
 bool isdark(){
    return currenttheme==ThemeMode.dark;
  }

}
