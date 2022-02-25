import 'package:flutter/material.dart';
import 'package:greeting_card/screens/my_pdf_editer/MyPdfEditer.dart';
import 'package:greeting_card/screens/my_pdf_editer/greeting_card.dart';
import 'package:greeting_card/screens/templet_list.dart';
import 'package:greeting_card/screens/templet_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormFillingPdf(),
    );
  }
}

