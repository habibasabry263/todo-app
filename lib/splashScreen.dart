import 'package:todo_app/home.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  static const String routeName="splash";
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState(){
    Future.delayed(Duration( seconds: 3),(){
      Navigator.pushReplacementNamed(context, home.routeName);}
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Column(
        children: [
          Image.asset(
            "assets/images/splash.png",
            width: 262,
            height: 262,
          )
        ],

      ),
    );
  }
}
