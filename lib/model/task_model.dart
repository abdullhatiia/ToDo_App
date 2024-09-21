import 'package:todo_app/core/utils.dart';

class TaskModel{
  static const String CollectionName="TasksCollection";
  String? id;
  String title;
  String describtion;
  DateTime  selectedDate;
  bool isDone;




  TaskModel(
      {this.id,
        required this.title,
        required this.describtion,
        required this.selectedDate,
        this.isDone=false}
      );

  factory TaskModel.fromFirestore(Map<String,dynamic> json)=> TaskModel(
     id: json["id"],
      title: json["title"],
      describtion: json["describtion"],
      selectedDate: DateTime.fromMillisecondsSinceEpoch(json["selectedDate"]
      ),
      isDone:json["isDone"],
  );



  Map<String,dynamic> toFireStore(){
    return {
      "id" : id,
      "title" : title,
      "describtion": describtion,
      "selectedDate":SelectedFormatDate(selectedDate).millisecondsSinceEpoch,
      "isDone":isDone,

    };
  }


}