import 'package:flutter/material.dart';
import 'package:todo_app/moduls/settings/settings_view.dart';
import 'package:todo_app/moduls/tasks/tasks_view.dart';
import 'package:todo_app/moduls/tasks/widgets/add_task_bottom_sheet_widget.dart';

class layoutview extends StatefulWidget {
  const layoutview({super.key});

  @override
  State<layoutview> createState() => _layoutviewState();
}

class _layoutviewState extends State<layoutview> {
  int currentIndex= 0;

  List<Widget> screens=[
   const tasksview(),
    const SettingsView(),

  ];
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () {
          showModalBottomSheet(context: context,
            builder:
              (context) => AddTaskBottomSheetWidget(),
            backgroundColor: Colors.transparent,
          );
        },
        child: CircleAvatar(
          radius: 25,
          backgroundColor: theme.primaryColor,
          child: const Icon(Icons.add,
            size: 30,
            color: Colors.white,),
        ),

      ),
      body: screens[currentIndex],

      bottomNavigationBar:

      BottomAppBar(
        height: 93,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 3,

        child: BottomNavigationBar(
          backgroundColor: Colors.white,
            elevation: 0,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex=value;
            setState(() {

            });
          },
          items:   [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logo/tasks_icn.png"),
          ),
            label: "Tasks",
          ),
            BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logo/Icon feather-settings.png"),
               ),
           label: "Settings",
            )
        ],
    ),
      ),
    );
  }
}
