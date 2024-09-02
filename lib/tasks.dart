import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/firebase/FirebaseFunctions.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/my_theme_data.dart';



class TaskItem extends StatefulWidget {
  final TaskModel taskModel;

  TaskItem({super.key, required this.taskModel});

  @override
  State<TaskItem> createState() => _TaskItemState();

}
  class _TaskItemState extends State<TaskItem> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
  return Container(
  height: 115,
  margin: EdgeInsets.symmetric(horizontal: 12),
  width: double.infinity,
  decoration: BoxDecoration(
  color: Theme.of(context).textTheme.bodySmall?.color,
      borderRadius: BorderRadius.circular(25)),
  child: Slidable(
  startActionPane:
  ActionPane(motion: DrawerMotion(), extentRatio: .6, children: [
  SlidableAction(
  onPressed: (context) {
  FirebaseFunctions.deleteTask(widget.taskModel.id);
  },
  label: "Delete".tr(),
  backgroundColor: Colors.red,
  icon: Icons.delete,
  spacing: 8,
  padding: EdgeInsets.zero,
  borderRadius: BorderRadius.only(
  topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
  ),
  SlidableAction(
  onPressed: (context) {
  showDialog(
  context: context,
  builder: (context) {
  var titleController = TextEditingController(text: widget.taskModel.title);
  return Dialog(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
  ),
  child: Container(
  width: 300,
  height: 300,
  padding: EdgeInsets.all(20),
  child: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
  Text(
  "Edit Task".tr(),
  style: GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  ),
  ),
  SizedBox(height: 20),
  TextField(
  controller: titleController,
  decoration: InputDecoration(hintText: "Task title".tr()),
  ),
  Spacer(),
  // SizedBox(height: 90),
  InkWell(
  onTap: ()async{
  DateTime? newDate=await chooseDate();
  },
  child: Align(
  alignment: Alignment.topLeft,
  child: Text("select date".tr(),
  style: TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 20
  ),)

  ),
  ),
  Text("26/3/2004",
  style:TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: AppColors.grey,
  ),
  ),
  Align(
  alignment: Alignment.center,
  child: Container(
  decoration: BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.circular(25),
  ),


  child: TextButton(
  onPressed: () {
  widget.taskModel.title = titleController.text;
  FirebaseFunctions.editTask(widget.taskModel);
  Navigator.of(context).pop();
  },
  style: TextButton.styleFrom(
  primary: Colors.white,
  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
  alignment: Alignment.center,
  ),
  child: Text("Save Changes".tr()),
  ),
  ),
  ),
  ],
  ),
  ),
  );
  },
  );;
  },
  label: "Edit".tr(),
  backgroundColor: Colors.blue,
  icon: Icons.edit,
  spacing: 8,
  ),

  ]),
  child: Padding(
  padding: const EdgeInsets.all(12.0),
  child: Row(
  children: [
  Container(
  height: 80,
  width: 4,
  decoration: BoxDecoration(
  color: widget.taskModel.isDone?Colors.green: AppColors.primary,
  borderRadius: BorderRadius.circular(25)),
  ),
  SizedBox(
  width: 12,
  ),
  Expanded(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  widget.taskModel.title,
  style: TextStyle(
  fontSize: 18,
  color:widget.taskModel.isDone?Colors.green: AppColors.primary,
  ),
  ),
  ],
  ),
  ),
  widget.taskModel.isDone?Text(
    "Done!!".tr()
    , style: GoogleFonts.poppins(
  color: Colors.green,
  fontWeight: FontWeight.w700,
  fontSize: 22
  ),): ElevatedButton(
  onPressed: () {
  widget.taskModel.isDone=true;
  FirebaseFunctions.updateTask(widget.taskModel);
  },
  child: Icon(
  Icons.done,
  color: Colors.white,
  size: 30,
  ),
  style: ElevatedButton.styleFrom(
  backgroundColor: AppColors.primary,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(12))),
  )
  ],
  ),
  ),
  ),
  );
  }

  chooseDate()async{
  DateTime? chosenDate=await showDatePicker(
  context: context,
  initialDate: selectedDate,
  firstDate: DateTime.now(),
  lastDate: DateTime.now().add(Duration(days: 365)),
  );
  if(chosenDate!=null){
  selectedDate=chosenDate;
  setState(() {

  });


  }
  }
  }
