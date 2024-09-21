import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/moduls/tasks/widgets/task_item_widget.dart';

class tasksview extends StatefulWidget {
  const tasksview({super.key});

  @override
  State<tasksview> createState() => _tasksviewState();
}

class _tasksviewState extends State<tasksview> {
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  var _focusDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var mediaquery=MediaQuery.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width:mediaquery.size.width,
                height: mediaquery.size.height*0.22,
                color: theme.primaryColor,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 60,
                ),
                child: Text(
                  "To Do List",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )
                ),

              ),
              Positioned(
                top: 100,
                child:
                SizedBox(
                  width: mediaquery.size.width,
                  child: EasyInfiniteDateTimeLine(
                    controller: _controller,
                    firstDate: DateTime(2024),
                    focusDate: _focusDate,
                    lastDate: DateTime(2025, 12, 31),
                    onDateChange: (selectedDate) {
                      setState(() {
                        _focusDate = selectedDate;
                      }
                      );
                    },
                    dayProps: EasyDayProps(
                      activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        dayStrStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "poppians",
                          color: theme.primaryColor
                        ),
                        dayNumStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                         fontFamily: "poppians",
                          color: theme.primaryColor
                           ),
                        monthStrStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppians",
                            color: theme.primaryColor
                        ),

                      ),
                      inactiveDayStyle:  DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        dayStrStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppians",
                            color: Colors.black
                        ),
                        dayNumStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppians",
                            color: Colors.black
                        ),
                        monthStrStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppians",
                            color: Colors.black
                        ),

                      ),

                    ),
                    showTimelineHeader: false,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseUtils.getSteramData(_focusDate),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(child: Text("Some Thing Went Error"));
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                );
              }
           List<TaskModel>?tasksList=   snapshot.data?.docs.map((e) => e.data()).toList()??[];

              return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => taskitemwidget(
                        data: tasksList[index],
                      ) ,
                    itemCount: tasksList.length ?? 0,
              );

            },
          ),
        ),
        SizedBox(height: 50,),
        // Expanded(
        //   child: ListView.builder(
        //     padding: EdgeInsets.zero,
        //     itemBuilder: (context, index) => const taskitemwidget() ,
        //   itemCount: 10,),
        // )
      ],
    );
  }
}
