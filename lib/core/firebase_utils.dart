import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/core/services/snack_bar_servce.dart';
import 'package:todo_app/core/utils.dart';
import 'package:todo_app/model/task_model.dart';

class FirebaseUtils{



static  CollectionReference<TaskModel>getColectionRef(){
  return
    FirebaseFirestore.instance.collection(TaskModel.CollectionName)
        .withConverter<TaskModel>(
        fromFirestore: (snapshot, _) =>TaskModel.fromFirestore(snapshot.data()!) ,
        toFirestore: (taskModel, _) =>taskModel.toFireStore() ,);
  }



static Future<void> addTaskModel(TaskModel taskModel){

    var CollectionRef=getColectionRef();

   var docRef= CollectionRef.doc();

   taskModel.id=docRef.id;

   return docRef.set(taskModel);

  }


  static Future<List<TaskModel>> GetDocumentsData(DateTime selectedDate)async{

  var collectionRef=getColectionRef().
  where("selectedDate",isEqualTo:
  SelectedFormatDate(selectedDate)  .millisecondsSinceEpoch);


  QuerySnapshot<TaskModel>doc=await collectionRef.get();

  List<TaskModel> taskList=[];

  taskList=doc.docs.map((e) => e.data()).toList();
  print
    ("${taskList.length} ______________________________________");



return taskList;

  }
  static Stream<QuerySnapshot<TaskModel>> getSteramData(DateTime selectedDate){
    var collectionRef=getColectionRef().
    where("selectedDate",isEqualTo:
    SelectedFormatDate(selectedDate).millisecondsSinceEpoch);
    return collectionRef.snapshots();
  }
static Future<void> deleteTask(TaskModel taskModel) async{
    var collectionRef=getColectionRef();
    var docRef=collectionRef.doc(taskModel.id);

  return docRef.delete();
  }
static Future<void> updateTask(TaskModel taskModel) async{
  var collectionRef=getColectionRef();
  var docRef=collectionRef.doc(taskModel.id);

  return docRef.update({
    "isDone":true,
  },);
}

static Future<bool> createAccount(String emailAddress,String password) async{
  try {
    EasyLoading.show();

    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    credential.user?.uid;
    EasyLoading.dismiss();

    return Future.value(true);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      EasyLoading.dismiss();

      SnackBarService.showErrorMessage('The password provided is too weak.');
      return Future.value(false);
    } else if (e.code == 'email-already-in-use') {
      SnackBarService.showErrorMessage('The account already exists for that email.');
      EasyLoading.dismiss();

      print('The account already exists for that email.');
      return Future.value(false);

    }
  } catch (e) {
    print(e);
    return Future.value(false);

  }
  return Future.value(false);

}
static Future<bool> signIn(String emailAdress,String password) async{
  try {
    EasyLoading.show();
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAdress,
        password: password
    );
    return Future.value(true);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage('No user found for that email.');

      return Future.value(false);
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      EasyLoading.dismiss();

      SnackBarService.showErrorMessage('Wrong password provided for that user.');

      return Future.value(false);
    }
    return Future.value(false);

  }
}
}