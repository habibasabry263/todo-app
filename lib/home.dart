import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bottomsheettss/add_task_bottom_sheet.dart';
import 'package:todo_app/colors.dart';
import 'tabs/settings_tab.dart';
import 'tabs/task_tab.dart';

class home extends StatefulWidget {
  static const String routeName = 'Home';

  const home({super.key});

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  int selectedIndex = 0;
  //List<TaskModel>task=[];
  DateTime selectedDate = DateTime.now();
  bool isAddingTask = false;
  var taskTitle;
  //AddTaskBottomSheet?AddTaskBottomSheet;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).textTheme.bodyMedium?.color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.iconTheme?.color,
        title: Padding(
          padding: const EdgeInsets.only(right:120.0, top: 30),
          child: Text(
            "To Do List".tr(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 22,
                color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          tabs[selectedIndex],
          if (isAddingTask)
            Positioned(
              left: 2,
              right: 2,
              bottom: 55,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  //Theme.of(context).textTheme.bodyLarge?.color,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(18),
                    bottom: Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskBottomSheet(),
            ),
          );
        },
        child: Icon(
         // isAddingTask ? Icons.check :
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color:Theme.of(context).textTheme.bodySmall?.color,
        notchMargin: 8,
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined, size: 30),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined, size: 30),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
  List<Widget> tabs = [tasktab(), settingsTab()];
}
