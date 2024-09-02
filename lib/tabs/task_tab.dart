import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/firebase/FirebaseFunctions.dart';
import 'package:todo_app/tasks.dart';
import 'package:intl/intl.dart';

class tasktab extends StatefulWidget {
   tasktab({super.key});

  @override
  State<tasktab> createState() => _tasktabState();
}

class _tasktabState extends State<tasktab> {
  // int selectedIndex = 0;
   DateTime selectedDate = DateTime.now();
   late List<DateTime> dateList;

   @override
   void initState() {
     super.initState();
     DateTime now = DateTime.now();
     dateList = List.generate(
       30,
           (index) => now.subtract(Duration(days: index)),
     ).reversed.toList();
   }
   bool isToday(DateTime date1, DateTime date2) {
     return date1.year == date2.year &&
         date1.month == date2.month &&
         date1.day == date2.day;
   }

   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         Stack(
           clipBehavior: Clip.none,
           children: [
             Container(
               color: AppColors.primary,
               height: 80,
             ),
             Positioned(
               left: 0,
               right: 0,
               bottom: -35,
               child: Container(
                 height: 80,
                 color: Colors.transparent,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: dateList.length,
                   itemBuilder: (context, index) {
                     DateTime date = dateList[index];
                     bool today = isToday(date, DateTime.now());
                     return GestureDetector(
                       onTap: () {
                         setState(() {
                           selectedDate = date;
                         });
                         print('Selected date: $selectedDate');
                       },
                       child: Container(
                         width: 60,
                         margin: EdgeInsets.symmetric(horizontal: 15.0),
                         decoration: BoxDecoration(
                           color: Theme.of(context).textTheme.bodySmall?.color,
                           borderRadius: BorderRadius.circular(5),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.white.withOpacity(0.2),
                               spreadRadius: 2,
                               blurRadius: 5,
                               offset: Offset(0, 3),
                             ),
                           ],
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text(
                               DateFormat.E(context.locale.toString()).format(date),
                               //DateFormat.E().format(date),
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: Theme.of(context).textTheme.bodyLarge?.color,
                               ),
                             ),
                             SizedBox(height: 15),
                             Text(
                               date.day.toString(),
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: today ? AppColors.primary:
                                 Theme.of(context).textTheme.bodyLarge?.color,
                               ),
                             ),
                           ],
                         ),
                       ),
                     );
                   },
                 ),
               ),
             ),

           ],
         ),
         SizedBox(height: 70), 
         StreamBuilder(stream: FirebaseFunctions.getTasks(selectedDate),
             builder:(context, snapshot) {
               if(snapshot.connectionState==ConnectionState.waiting){
                 return CircularProgressIndicator();

               }
               else if(snapshot.hasError){
                 return Center(
                   child: Column(
                     children: [
                       Text("something has gone wrong"),
                     ElevatedButton(onPressed: (){},
                         child: Text("try again"))
                     ],
                   ),
                 );
               };
               var tasks=snapshot.data?.docs.map((doc) =>doc.data()).toList() ??[];
               if(tasks.isEmpty){
                 return Center(
                     child: Text("please enter a task to continue")
                 );


               }
               return   Expanded(
                 child: ListView.separated(
                   separatorBuilder: (context, index) => SizedBox(
                     height: 12,
                   ),
                   itemBuilder: (context, index) {
                     return TaskItem(taskModel: tasks[index],);
                   },
                   itemCount: tasks.length,
                 ),
               );
             },
        )


       ],
     );

   }

}