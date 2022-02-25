import 'package:flutter/material.dart';
import 'package:greeting_card/screens/templet_details.dart';
import 'package:greeting_card/screens/templet_screen.dart';

class TempletList extends StatefulWidget {
  const TempletList({Key? key}) : super(key: key);

  @override
  _TempletListState createState() => _TempletListState();
}

class _TempletListState extends State<TempletList> {

  List<Widget> mywidgets = [
    TempletScreen(),
    TempletScreen(),
    TempletScreen(),
    TempletScreen(),
    TempletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: mywidgets.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  TempletDetails(mywidgets[index])),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Some Templets"),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            }),
      ),
    );
  }
}
