import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/core/services/snack_bar_servce.dart';
import 'package:todo_app/model/task_model.dart';

class AddTaskBottomSheetWidget extends StatefulWidget {
  const AddTaskBottomSheetWidget({super.key});

  @override
  State<AddTaskBottomSheetWidget> createState() => _AddTaskBottomSheetWidgetState();
}

class _AddTaskBottomSheetWidgetState extends State<AddTaskBottomSheetWidget> {
  var formkey=GlobalKey<FormState>();
  TextEditingController titelController=TextEditingController();
  TextEditingController descController=TextEditingController();
  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add New Task",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: Colors.black,
              ),
        
                ),
            SizedBox(height: 50,),
            TextFormField(
              controller:titelController ,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              validator: (value){
                if(value==null||value.trim().isEmpty){
                  return "Plz Enter Task Title";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter Task Title",
              errorStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: Color(0xffE30B00FF),
                  fontWeight: FontWeight.w500,
                fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(

              controller:descController ,
              maxLines: 2,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              validator: (value){
                if(value==null||value.trim().isEmpty){
                  return "Plz Enter Description title";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter Task Description",
                errorStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: Color(0xffE30B00FF),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Select Time",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: Colors.black,
              ),
        
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: () {
                getSelectedDateTime();
        
              },
              child: Text(
                textAlign: TextAlign.center,
                DateFormat("dd MMM, yy").format(selectedDate),
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              
              ),
            ),
            Spacer(),
            FilledButton(
                onPressed: () {
                  if(formkey.currentState!.validate()){
                    var taskModel=TaskModel(
                        title: titelController.text,
                        describtion: descController.text,
                        selectedDate: selectedDate
                    );

                     EasyLoading.show();
                    FirebaseUtils.addTaskModel(taskModel).then((Value){
                      Navigator.pop(context);
                      EasyLoading.dismiss();
                      SnackBarService.showSuccessMessage("Task added Successfully");
                    });
                  }


                },
                style: FilledButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                  )
                ),
                child: Text("Save",
                style: theme.textTheme.bodySmall,))
          ],
        ),
      ),

    );
  }
    getSelectedDateTime() async {
  var currentDate=
        await showDatePicker(context: context,
     firstDate: DateTime.now(),
     lastDate: DateTime.now().add(Duration(days: 365)
       ,)
     );
  if(currentDate!=null){
    setState(() {

    });
    return selectedDate=currentDate;

  }
  }
}
