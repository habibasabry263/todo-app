import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myProvider extends ChangeNotifier{
  ThemeMode appTheme= ThemeMode.dark;
  changeTheme(ThemeMode themeMode){
    appTheme=themeMode;

    notifyListeners();
  }
}