import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {

  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var languagelist=[
    "English",
    "عربي",
  ];

  var themelist=[
    "Dark",
    "Light"
  ];

  @override
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    var provider=Provider.of<settingsprovider>(context);

    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("language",
              style: theme.textTheme.bodyLarge,

            ),
            const SizedBox(height: 10,),
            CustomDropdown<String>(
              hintText: 'Select Language',
              items: languagelist,
              initialItem: provider.currentLanguage=="en"?languagelist[0]:languagelist[1],
               // initialItem: languagelist [0],
              onChanged: (value) {
                if(value=="English"){
                  provider.changeLanguage("en");

                }
                if(value=="عربي"){
                  provider.changeLanguage("ar");
                }

                log('changing value to: $value');
                setState(() {

                });
              },
              decoration: CustomDropdownDecoration(
                closedFillColor:
                provider.isdark()? Color(0xff141A2E) :Colors.white,
                closedSuffixIcon:
                Icon(Icons.arrow_circle_down_outlined
                  ,color: provider.isdark()? theme.primaryColorDark :Colors.black,),
                expandedSuffixIcon:
                Icon(Icons.arrow_circle_up_outlined
                  ,color: provider.isdark()? theme.primaryColorDark :Colors.black,),
                expandedFillColor:
                provider.isdark()? Color(0xff141A2E) :Colors.white,
              ),

            ),
            SizedBox(height: 50,),
            Text("Theme",
              style: theme.textTheme.bodyLarge,

            ),
            const SizedBox(height: 10,),
            CustomDropdown<String>(
              hintText: 'Select Theme Mode',
              items: themelist,
              initialItem: provider.currenttheme==ThemeMode.light?
              themelist[1]:
              themelist[0],
              onChanged: (value) {
                if(value=="Dark"){
                  provider.changethememode(ThemeMode.dark);
                }
                if(value=="Light"){
                  provider.changethememode(ThemeMode.light);
                }

                log('changing value to: $value');
                setState(() {

                });
              },
              decoration: CustomDropdownDecoration(
                closedFillColor:
                provider.isdark()? Color(0xff141A2E) :Colors.white,
                closedSuffixIcon:
                Icon(Icons.arrow_circle_down_outlined
                  ,color: provider.isdark()? theme.primaryColorDark :Colors.black,),
                expandedSuffixIcon:
                Icon(Icons.arrow_circle_up_outlined
                  ,color: provider.isdark()? theme.primaryColorDark :Colors.black,),
                expandedFillColor:
                provider.isdark()? Color(0xff141A2E) :Colors.white,
              ),
            ),

          ],
        ),
      );
  }
}
