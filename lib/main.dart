import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'launchpage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(MyApp());
}

class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [

   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
   GlobalCupertinoLocalizations.delegate,
 ],
 supportedLocales: [
    const Locale('tr', 'TR'), 
  ],
      title: "Ebeveyn App",
      home: LaunchPage(),      
    );
  }
}