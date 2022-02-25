import 'package:flutter/material.dart';


class TempletDetails extends StatefulWidget {
  Widget mywidget;

  TempletDetails(this.mywidget);

  @override
  _TempletDetailsState createState() => _TempletDetailsState();
}

class _TempletDetailsState extends State<TempletDetails> {
  @override
  Widget build(BuildContext context) {
    return widget.mywidget;
  }
}
