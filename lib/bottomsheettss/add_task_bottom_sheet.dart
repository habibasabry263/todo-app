import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/firebase/FirebaseFunctions.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/my_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  //final DateTime selectedDate;
  //final Function(String title, DateTime dateTime) onTaskAdded;

  const AddTaskBottomSheet({super.key,});


  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  //late DateTime selectedDate;
  DateTime selectedDate = DateTime.now();
  late TimeOfDay selectedTime;
  var _taskTitleController = TextEditingController();
 // String? taskTitle=_taskTitleController.text;
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodySmall?.color,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
    padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add New Task".tr(),
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 24),
          TextField(
            controller: _taskTitleController,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white,
            ),
            decoration: InputDecoration(
              hintText: "Enter Your Task".tr(),
              hintStyle: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge?.color?? Colors.grey
                ),
              ),
                focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.blue,
                    ),
                ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Select Time".tr(),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 18),
          InkWell(
            onTap: () {
              selectTimeFun();
            },
            child: Text(
              selectedTime?.format(context)?? "select time",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              TaskModel task=TaskModel(
                  title: _taskTitleController.text,
                  date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch
              );
              FirebaseFunctions.addTask(task).then((value){
                Navigator.of(context).pop();
                setState(() {

                });
                }
                );

            },
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          // In _AddTaskBottomSheetState
          // ElevatedButton(
          //   onPressed: () {
          //     DateTime taskDateTime = getSelectedDateTime();
          //     String taskTitle = getTaskTitle();
          //
          //     if (taskTitle.isNotEmpty) {
          //       widget.onTaskAdded(taskTitle, taskDateTime);
          //     }
          //   },
          //   child: Icon(
          //     Icons.check,
          //     color: Colors.white,
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     primary: AppColors.primary,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30),
          //       side: BorderSide(
          //         color: Colors.white,
          //         width: 4,
          //       ),
          //     ),
          //   ),
          // ),


        ],
      ),
    );
  }

  Future<void> selectTimeFun() async {
    TimeOfDay? chosenTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (chosenTime != null) {
      setState(() {
        selectedTime = chosenTime;
      });
    }
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