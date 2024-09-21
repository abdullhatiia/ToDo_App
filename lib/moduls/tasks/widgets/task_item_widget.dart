import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/model/task_model.dart';
import 'dart:collection';


class taskitemwidget extends StatelessWidget {
  final  TaskModel data;

  const taskitemwidget({
    super.key,
    required this.data}
      );

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var mediaquery=MediaQuery.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8,),
      // padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20,),
      decoration: BoxDecoration(
        color: Color(0xFFFE4A49),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
         extentRatio: 0.27,

          children:  [
            SlidableAction(borderRadius: BorderRadius.only(
                topLeft:Radius.circular(15.0),
               bottomLeft:Radius.circular(15.0)),
              onPressed: (context) {
              FirebaseUtils.deleteTask(data);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),

          ],
        ),
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8,),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20,),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child:Row(
            children: [
              Container(
                height: 90,
                width: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: theme.primaryColor,
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.title,
                      style:theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 5,),

                    Text(data.describtion,
                      style:theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 10,),


                    Row(
                      children: [
                        const Icon(Icons.alarm,size: 18,),
                        const SizedBox(width: 5,),
                        Text(
                          DateFormat("dd MMM yy").format(data.selectedDate),
                          style:theme.textTheme.displaySmall,
                        ),

                      ],
                    ),
                  ],
                ),

              ),
              InkWell(
                onTap: () {
                  FirebaseUtils.updateTask(data);
                },

                child: data.isDone?
                Text("Done",style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.green,
                ),)
                :Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                      color:theme.primaryColor,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child:
                  Icon(Icons.check,size: 30,color: Colors.white,),
                ),
              ),

            ],
          )



          // ListTile(
          //   contentPadding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
          //   leading:
          //   Container(
          //     height: 120,
          //     width: 6,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10.0),
          //       color: theme.primaryColor,
          //     ),
          //   ),
          //   title: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(data.title,
          //         style:theme.textTheme.bodyLarge?.copyWith(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //           color: theme.primaryColor,
          //         ),
          //
          //       ),
          //   Text(data.describtion,
          //     style:theme.textTheme.bodyLarge?.copyWith(
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold,
          //       color: theme.primaryColor,
          //     ),
          //   ),
          //
          //       Row(
          //         children: [
          //           const Icon(Icons.alarm,size: 18,),
          //           const SizedBox(width: 5,),
          //           Text(
          //             DateFormat("dd MMM yy").format(data.selectedDate),
          //             style:theme.textTheme.displaySmall,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          //   trailing: Container(
          //     width: 70,
          //     height: 30,
          //     decoration: BoxDecoration(
          //       color: theme.primaryColor,
          //       borderRadius: BorderRadius.circular(12)
          //     ),
          //     child: const Icon(Icons.check,size: 30,color: Colors.white,),
          //   ),
          //
          // ),
        ),
      ),
    );
  }
}
