import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/home.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/provider/my_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp( EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('ar')],
    path: 'assets/translation',
    startLocale: Locale('ar'),
    //fallbackLocale: Locale('en'),
    child: ChangeNotifierProvider(
      create: (context) => myProvider(),
        child: MyApp()),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
     themeMode: provider.appTheme,
     theme: myThemeData.lightTheme,
      darkTheme: myThemeData.darkTheme,
      initialRoute:  home.routeName,
      routes: {
        home.routeName: (context) =>  home(),
      },


    );

  }
}
