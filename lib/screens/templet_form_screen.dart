import 'package:flutter/material.dart';
import 'package:greeting_card/screens/final_templet_screen.dart';
import 'package:greeting_card/screens/templet_screen.dart';

class TempletFormScreen extends StatefulWidget {

  @override
  _TempletFormScreenState createState() => _TempletFormScreenState();
}

class _TempletFormScreenState extends State<TempletFormScreen> {

  TextEditingController brideNameController = TextEditingController();
  TextEditingController groomNameController= TextEditingController();
  TextEditingController dateController= TextEditingController();
  TextEditingController placeController= TextEditingController();
  TextEditingController locationController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.yellow.shade200,
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: brideNameController,
                  decoration: InputDecoration(hintText: "BrideName"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: groomNameController,
                  decoration: InputDecoration(hintText: "GroomName"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(hintText: "Date"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: placeController,
                  decoration: InputDecoration(hintText: "Place"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(hintText: "Location"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    String brideName = brideNameController.text;
                    String groomName =  groomNameController.text;
                    String date = dateController.text;
                    String place = placeController.text;
                    String location =  locationController.text;
                    print("${brideName}");
                    Navigator.push(context ,MaterialPageRoute(builder: (BuildContext context) => FinalTempletScreen(brideName,groomName, date,place,location)));
                  },
                  child: Container(
                    width: width/2,
                    height: height/14,
                    color: Colors.brown,
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
