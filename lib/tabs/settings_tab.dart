import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/provider/my_provider.dart';

class settingsTab extends StatelessWidget {
  const settingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.primary,
          height: 80,
          width: double.infinity,
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Language".tr(),
            style: GoogleFonts.poppins(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              labelStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            items: [
              DropdownMenuItem(
                value: "en",
                child: Text("English".tr(),
                     ),

              ),
              DropdownMenuItem(
                value: "ar",
                child: Text("Arabic".tr(),
                  ),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                EasyLocalization.of(context)?.setLocale(Locale(value));
              }
            },
            hint: Text("Select Language".tr(),
         style: TextStyle(
           color: Theme.of(context).textTheme.bodyLarge?.color,
         ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Mode".tr(),
            style: GoogleFonts.poppins(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            items: [
              DropdownMenuItem(
                value: "light",
                child: InkWell(
                    onTap:(){
                     // provider.changeTheme(ThemeMode.light);
                    } ,

                    child: Text("Light".tr())),
              ),
              DropdownMenuItem(
                value: "dark",
                child: InkWell(
                    onTap:() {
                     // provider.changeTheme(ThemeMode.dark);
                    },
                    child: Text("Dark".tr())),
              ),
            ],
            onChanged: (value) {
              if (value == "light") {
                provider.changeTheme(ThemeMode.light);
              } else if (value == "dark") {
                provider.changeTheme(ThemeMode.dark);
              }
            },
            hint: Text("Select Mode".tr(),
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),),
          ),
        ),
      ],
    );
  }
}
